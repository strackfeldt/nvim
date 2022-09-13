vim.cmd [[set guifont=MonoLisa:h20]]
vim.cmd "colorscheme tokyonight"

vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.o.colorcolumn = "80"
vim.o.textwidth = "80"
-- vim.o.timeoutlen = 100
vim.o.signcolumn = "yes"
vim.o.fileencoding = "utf-8"
vim.o.laststatus = 3
vim.o.mouse = "a"
vim.o.cmdheight = 1
vim.o.pumheight = 10
vim.o.hlsearch = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 100
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 8
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

vim.g.copilot_no_tab_map = true

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "NvimTree" }
