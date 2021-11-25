vim.g.mapleader = " "

-- vim.api.nvim_set_keymap("n", "<Leader>", ":WhichKey <leader>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>p", ":Telescope commands<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>f", ":Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>tg", ":Telescope git_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>tl", ":Telescope live_grep<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {silent = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {silent = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {silent = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {silent = true})

vim.api.nvim_set_keymap("n", "<Leader>s", ":up<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-x>", ":bd<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap(
  "v",
  "<Leader>re",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
  {noremap = true, silent = true, expr = false}
)
vim.api.nvim_set_keymap(
  "v",
  "<Leader>rf",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
  {noremap = true, silent = true, expr = false}
)

vim.cmd("filetype on")
vim.cmd("syntax on")
vim.cmd("set noswapfile")
vim.cmd("set noshowmode")
vim.cmd("set iskeyword+=-")
vim.cmd("set shortmess+=c")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set ignorecase")
vim.cmd("set smartcase ")

vim.opt.timeoutlen = 100
vim.o.cmdheight = 1
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.mouse = "a"
vim.o.splitbelow = true
vim.o.splitright = true
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.bo.autoindent = true
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
vim.o.scrolloff = 8
vim.g.nvcode_termcolors = 256
