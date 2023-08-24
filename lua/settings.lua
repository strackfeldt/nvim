vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"

vim.o.laststatus = 3

vim.o.pumheight = 10

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- vim.opt.colorcolumn = "80"
vim.o.cursorline = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.copilot_no_tab_map = true
