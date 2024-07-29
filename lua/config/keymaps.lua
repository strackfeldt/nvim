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
key("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
key("n", "<Leader>ef", ":Neotree toggle filesystem<CR>", opts)
key("n", "<Leader>eb", ":Neotree toggle buffers<CR>", opts)

-- -- Format
key("n", "<leader>cf", ":Neoformat<CR>", opts)

-- -- Aerial
key("n", "<leader>a", "<cmd>AerialToggle!<CR>", opts)

-- -- Telescope
local builtin = require("telescope.builtin")
key("n", "<Leader>ff", builtin.find_files, opts)
key("n", "<Leader>fb", builtin.buffers, opts)
key("n", "<Leader>sg", builtin.live_grep, opts)
key("n", "<Leader>st", "<CMD>TodoTelescope<CR>", opts)
key("n", "<Leader>rr", builtin.resume, opts)

local hop = require("hop")
local directions = require("hop.hint").HintDirection
key("", "f", function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, { remap = true })
key("", "F", function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, { remap = true })
key("", "t", function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, { remap = true })
key("", "T", function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, { remap = true })
