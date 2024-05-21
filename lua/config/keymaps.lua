local opts = { noremap = true, silent = true }
local key = vim.keymap.set

key("n", "Y", "yg$", opts)
key("v", "J", ":m '>+1<CR>gv=gv", opts)
key("v", "K", ":m '<-2<CR>gv=gv", opts)
key("n", "<C-u>", "<C-u>zz", opts)
key("n", "<C-d>", "<C-d>zz", opts)
key("n", "<Leader>ww", ":bd<CR>", opts)

-- key("n", "<C-h>", ":bp<CR>", opts)
-- key("n", "<C-l>", ":bn<CR>", opts)

key("n", "<c-h>", ":TmuxNavigateLeft<cr>", opts)
key("n", "<c-j>", ":TmuxNavigateDown<cr>", opts)
key("n", "<c-k>", ":TmuxNavigateUp<cr>", opts)
key("n", "<c-l>", ":TmuxNavigateRight<cr>", opts)

-- -- NvimTree
key("n", "<Leader>ef", ":Neotree toggle filesystem<CR>", opts)
key("n", "<Leader>eb", ":Neotree toggle buffers<CR>", opts)

-- -- Format
key("n", "<leader>cf", ":Neoformat<CR>", opts)

-- -- Aerial
key("n", "<leader>a", "<cmd>AerialToggle!<CR>", opts)

-- -- Telescope
local builtin = require("telescope.builtin")
key("n", "<Leader>ff", builtin.find_files, opts)
key("n", "<Leader>fl", builtin.live_grep, opts)
key("n", "<Leader>fb", builtin.buffers, opts)
key("n", "<Leader>fr", builtin.resume, opts)
key("n", "<Leader>ft", "<CMD>TodoTelescope<CR>", opts)
