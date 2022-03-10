

vim.cmd([[set guifont=Monolisa\ Nerd\ Font]])
vim.cmd("set mouse=a")
vim.cmd("set signcolumn=yes")
vim.cmd("set ts=2")
vim.cmd("set sw=2")
vim.opt.timeoutlen = 100
vim.o.cmdheight = 1
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"

vim.o.splitbelow = true
vim.o.splitright = true

vim.bo.expandtab = true
vim.bo.smartindent = true
vim.bo.autoindent = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.wo.cursorline = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

vim.o.updatetime = 100
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 8


vim.o.termguicolors = true
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = {"NvimTree"}
vim.cmd("colorscheme tokyonight")

vim.g.copilot_no_tab_map = true
