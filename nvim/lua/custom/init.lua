require("custom.remap")
require("custom.packer")

-- Set color scheme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Set line numbers
vim.wo.number = true

vim.opt.guicursor = ""
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false

-- Undo config
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search improvements
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
