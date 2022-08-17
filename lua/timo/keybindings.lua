local key = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

--Remap space as leader key
key("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
key("v", "<C-L>", '"sy<ESC>:%s/<C-r>s/<C-r>s', opts)

key("t", "<Esc>", "<C-\\><C-n>", term_opts)
key("n", "<Leader>rp", ":term python3 % <CR>", opts)

key("n", "<Leader>w", ":bd!<CR>", opts)

key("n", "<Leader>f", ":Telescope find_files<CR>", opts)
key("n", "<Leader>p", ":Telescope commands<CR>", opts)

key("n", "<Leader>tc", ":Telescope cder<CR>", opts)
key("n", "<Leader>tg", ":Telescope git_files<CR>", opts)
key("n", "<Leader>tb", ":Telescope buffers<CR>", opts)
key("n", "<Leader>tl", ":Telescope live_grep<CR>", opts)

key("n", "<C-h>", "<C-w>h", opts)
key("n", "<C-j>", "<C-w>j", opts)
key("n", "<C-k>", "<C-w>k", opts)
key("n", "<C-l>", "<C-w>l", opts)

key("n", "<C-x>", ":bd<CR>", opts)
key("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

key("n", "<S-h>", ":bp<CR>", opts)
key("n", "<S-l>", ":bn<CR>", opts)

key("i", "<C-l>", "copilot#Accept()", {silent = true, script = true, expr = true})
