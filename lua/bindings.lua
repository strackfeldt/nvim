vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>s", ":up<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>p", ":Telescope commands<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>f", ":Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>gf", ":Telescope git_files<CR>", {noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {silent = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {silent = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {silent = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {silent = true})

vim.api.nvim_set_keymap("n", "<C-x>", ":BufferClose<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
