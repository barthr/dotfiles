-- plugins section
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug 'dracula/vim' 
    Plug 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    Plug 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    Plug 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    Plug 'L3MON4D3/LuaSnip' -- Snippets plugin
    Plug 'nvim-treesitter/nvim-treesitter' -- tree sitter for faster syntax highlighting
    --  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
vim.call('plug#end')
-- end plugin section

vim.opt.showmatch = true               -- show matching 
vim.opt.ignorecase = true              -- case insensitive 
vim.opt.mouse= 'v' 		-- middle-click paste with 
vim.opt.hlsearch = true                -- highlight search 
vim.opt.incsearch = true               -- incremental search
vim.opt.tabstop = 4               -- number of columns occupied by a tab 
vim.opt.softtabstop = 4           -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true               -- converts tabs to white space
vim.opt.shiftwidth = 4            -- width for autoindents
vim.opt.autoindent = true              -- indent a new line the same amount as the line just typed
vim.opt.number = true                  -- add line numbers
vim.opt.wildmode = { 'longest', 'list' }    -- get bash-like tab completions
vim.opt.syntax = 'on'                   -- syntax highlighting
vim.opt.mouse = 'a'                 -- enable mouse click
vim.opt.clipboard = 'unnamedplus'   -- using system clipboard
-- filetype plugin on          -- filetype plugin
-- filetype plugin indent on   -- allow auto-indenting depending on file type
vim.opt.ttyfast = true         -- Speed up scrolling in Vim

vim.opt.termguicolors = true -- set true colors in gui
vim.cmd('colorscheme dracula') -- set color scheme


-- autocompletion section
vim.o.completeopt = 'menu,noselect' -- set completeopt to have a better completion experience

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
