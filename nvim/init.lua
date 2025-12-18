-- Basic vim fixes
vim.o.number = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.signcolumn = "yes"


vim.o.guicursor = ""
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false

-- Plugins
vim.pack.add({
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- Configuration for color theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Search improvements
vim.o.hlsearch = false
vim.o.incsearch = true

vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Fix moving between buffers
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")

vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

-- save with leader w
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true })
vim.keymap.set('n', '<leader>s', ':update<CR> :source<CR>', { silent = false })
-- close file with leader q
vim.keymap.set('n', '<leader>q', ':q<CR>', { silent = true })
vim.keymap.set('n', '<leader>qa', ':qa<CR>', { silent = true })

-- better tabs
for i = 1, 5 do
    local index = tostring(i)
    vim.keymap.set('n', '<leader>' .. index, index .. 'gt')
end

-- Configuration for telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>e', builtin.oldfiles, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

pcall(require('telescope').load_extension, 'fzf')
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-- Treesitter configu
require "nvim-treesitter.configs".setup({ highlight = { enable = true } })

-- Configuration for LSP
require("mason").setup()
-- Enabled LSP
vim.lsp.enable({ 'lua_ls' })

-- Lua specific
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

vim.cmd("set completeopt+=noselect")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
