local opts = { noremap = true, silent = true }
local key = vim.keymap.set

key("n", "Y", "yg$", opts)
key("v", "J", ":m '>+1<CR>gv=gv", opts)
key("v", "K", ":m '<-2<CR>gv=gv", opts)
key("n", "<C-h>", ":bp<CR>", opts)
key("n", "<C-l>", ":bn<CR>", opts)
key("n", "<C-u>", "<C-u>zz", opts)
key("n", "<C-d>", "<C-d>zz", opts)
key("n", "<Leader>ww", ":bd<CR>", opts)

-- -- NvimTree
key("n", "<Leader>e", ":Neotree toggle filesystem<CR>", opts)
key("n", "<Leader>b", ":Neotree toggle buffers<CR>", opts)

-- -- Format
key("n", "<C-f>", ":Neoformat<CR>", opts)

-- -- Aerial
key("n", "<leader>a", "<cmd>AerialToggle!<CR>", opts)

-- -- Telescope
local builtin = require("telescope.builtin")
key("n", "<Leader>ff", builtin.find_files, opts)
key("n", "<Leader>fg", builtin.git_files, opts)
key("n", "<Leader>fb", builtin.buffers, opts)
key("n", "<Leader>fl", builtin.live_grep, opts)
key("n", "<Leader>fc", builtin.commands, opts)
key("n", "<Leader>tt", "<CMD>TodoTelescope<CR>", opts)
