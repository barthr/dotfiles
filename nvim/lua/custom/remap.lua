vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Fix moving between buffers
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")

vim.keymap.set('n', '<A-1>', ":NeoTreeShowToggle<CR>")
-- Fix annoying paste over highlight
-- vim.keymap.set("x", "<leader>p", "\"_dP")
--
-- Fix netrw
--
-- vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_browse_split = 2
-- vim.g.netrw_winsize = 15
