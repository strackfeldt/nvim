local key = vim.api.nvim_set_keymap
-- local buf_key = vim.api.nvim_buf_set_keymap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

key("", "<Space>", "<Nop>", opts)
key("t", "<Esc>", "<C-\\><C-n>", term_opts)

key("n", "<Leader>ww", ":bd<CR>", opts)
key("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

key("n", "<Leader>fr", ":Telescope resume<CR>", opts)
key("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
key("n", "<Leader>fp", ":Telescope commands<CR>", opts)
key("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
key("n", "<Leader>fl", ":Telescope live_grep<CR>", opts)

key("n", "<leader>rn", ":Lspsaga rename<CR>", opts)
key("n", "K", ":Lspsaga hover_doc<CR>", opts)
key("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
key("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
key("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
key("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
key("n", "gsd", ":lua vim.diagnostic.open_float()<CR>", opts)
key("n", "gj", ":lua vim.diagnostic.goto_next()<CR>", opts)
key("n", "gk", ":lua vim.diagnostic.goto_prev()<CR>", opts)

key("n", "<C-u>", "<C-u>zz", opts)
key("n", "<C-d>", "<C-d>zz", opts)

key("n", "<C-h>", "<C-w>h", opts)
key("n", "<C-j>", "<C-w>j", opts)
key("n", "<C-k>", "<C-w>k", opts)
key("n", "<C-l>", "<C-w>l", opts)

key("n", "<S-h>", ":bp<CR>", opts)
key("n", "<S-l>", ":bn<CR>", opts)

key("i", "<C-l>", "copilot#Accept()", { silent = true, script = true, expr = true })

--local action = require "lspsaga.action"
-- buf_key(0, "n", "grn", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
-- buf_key(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
-- buf_key(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
-- buf_key(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
