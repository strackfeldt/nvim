local key = vim.api.nvim_set_keymap
-- local buf_key = vim.api.nvim_buf_set_keymap

local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

key("", "<Space>", "<Nop>", opts)
key("t", "<Esc>", "<C-\\><C-n>", term_opts)


key("n", "<Leader>w", ":bd<CR>", opts)
key("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

key("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
key("n", "<Leader>fp", ":Telescope commands<CR>", opts)
key("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
key("n", "<Leader>fl", ":Telescope live_grep<CR>", opts)

key("n", "<C-h>", "<C-w>h", opts)
key("n", "<C-j>", "<C-w>j", opts)
key("n", "<C-k>", "<C-w>k", opts)
key("n", "<C-l>", "<C-w>l", opts)

key("n", "<S-h>", ":bp<CR>", opts)
key("n", "<S-l>", ":bn<CR>", opts)

key("i", "<C-l>", "copilot#Accept()", {silent = true, script = true, expr = true})



-- buf_key(0, "n", "grn", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
-- buf_key(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
-- buf_key(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
