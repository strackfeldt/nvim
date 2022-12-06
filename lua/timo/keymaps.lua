local key = vim.api.nvim_set_keymap
-- local buf_key = vim.api.nvim_buf_set_keymap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

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

key(
	"n",
	"<leader>s",
	"",
	{
		callback = function()
            print('My example')
			require('searchbox').incsearch({modifier="ignore-case"})
		end,
		noremap = true,
	}
)

key("n", "<Leader>ww", ":bd<CR>", opts)
key("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

key("n", "<C-h>", ":bp<CR>", opts)
key("n", "<C-l>", ":bn<CR>", opts)

key("n", "<C-k>", "<C-u>zz", opts)
key("n", "<C-j>", "<C-d>zz", opts)

key("i", "<C-l>", "copilot#Accept()", { silent = true, script = true, expr = true })
