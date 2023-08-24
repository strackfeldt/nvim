local key = vim.keymap.set

-- Keymaps
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

key({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

key("n", "Y", "yg$", opts)

key("v", "J", ":m '>+1<CR>gv=gv", opts)
key("v", "K", ":m '<-2<CR>gv=gv", opts)

key("n", "<C-h>", ":bp<CR>", opts)
key("n", "<C-l>", ":bn<CR>", opts)

key("n", "<C-u>", "<C-u>zz", opts)
key("n", "<C-d>", "<C-d>zz", opts)

key("n", "<Leader>ww", ":bd<CR>", opts)
key("n", "<Leader>e", ":Neotree toggle<CR>", opts)

key("n", "<C-f>", ":Neoformat<CR>", opts)
key("n", "<Leader>ft", ":Neoformat<CR>", opts)

local builtin = require("telescope.builtin")

key("n", "<Leader>fr", builtin.resume, opts)
key("n", "<Leader>ff", builtin.git_files, opts)
key("n", "<Leader>faf", builtin.find_files, opts)
key("n", "<Leader>fl", builtin.live_grep, opts)
key("n", "<Leader>fb", builtin.buffers, opts)

key("n", "<C-p>", builtin.commands, opts)
