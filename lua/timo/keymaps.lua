local key = vim.keymap.set
-- local buf_key = vim.api.nvim_buf_set_keymap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

key({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


key("n", "Y", "yg$", opts)

key("v", "J", ":m '>+1<CR>gv=gv", opts)
key("v", "K", ":m '<-2<CR>gv=gv", opts)

-- HARDMODE
key("n", "<Down>", "<Nop>", opts)
key("n", "<Left>", "<Nop>", opts)
key("n", "<Up>", "<Nop>", opts)
key("n", "<Right>", "<Nop>", opts)
key("v", "<Down>", "<Nop>", opts)
key("v", "<Left>", "<Nop>", opts)
key("v", "<Up>", "<Nop>", opts)
key("v", "<Right>", "<Nop>", opts)

key("", "<Space>", "<Nop>", opts)
key("t", "<Esc>", "<C-\\><C-n>", term_opts)

key("n", "<Leader>ww", ":bd<CR>", opts)
key("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

key("n", "<C-h>", ":bp<CR>", opts)
key("n", "<C-l>", ":bn<CR>", opts)

key("n", "<C-u>", "<C-u>zz", opts)
key("n", "<C-d>", "<C-d>zz", opts)

key({"n", "t"}, "<C-t>", vim.cmd.ToggleTerm, opts)

-- key("i", "<C-l>", "copilot#Accept()", { silent = true, script = true, expr = true })
