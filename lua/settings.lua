vim.o.termguicolors = true
vim.cmd("set termguicolors")
vim.cmd("colorscheme aurora")
vim.cmd("filetype on")
vim.cmd("syntax on")
vim.cmd("set noswapfile")
vim.cmd("set noshowmode")
vim.cmd("set iskeyword+=-")
vim.cmd("set shortmess+=c")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 2
vim.o.mouse = "a"
vim.o.splitbelow = true
vim.o.splitright = true
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.cmd("set ts=2")
vim.cmd("set sw=2")
vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.o.showmode = false
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.wo.signcolumn = "yes"
vim.o.updatetime = 200
vim.o.clipboard = "unnamedplus"

-- My Settings
vim.o.scrolloff = 6
vim.g.nvcode_termcolors = 256
