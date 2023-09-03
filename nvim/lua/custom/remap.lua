vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Fix moving between buffers
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")

vim.keymap.set('n', '<A-1>', ":NeoTreeShowToggle<CR>")

vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

-- save with leader w
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true })
-- close file with leader q
vim.keymap.set('n', '<leader>q', ':q<CR>', { silent = true })
vim.keymap.set('n', '<leader>qa', ':qa<CR>', { silent = true })

-- better tabs
for i = 1, 5 do
    local index = tostring(i)
    vim.keymap.set('n', '<leader>' .. index, index .. 'gt')
end

-- Fix annoying paste over highlight
-- vim.keymap.set("x", "<leader>p", "\"_dP")
--
-- Fix netrw
--
-- vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_browse_split = 2
-- vim.g.netrw_winsize = 15
