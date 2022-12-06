-- print("telescope loaded", os.getenv("HOME") .. "/code")

local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		file_ignore_patterns = {
			"backups",
			"public",
			"migrations",
		},
		mappings = {
			i = { ["<esc>"] = actions.close },
			n = { ["<esc>"] = actions.close },
		},
	},
})


key("n", "<Leader>fr", ":Telescope resume<CR>", opts)
key("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
key("n", "<leader>c", ":FineCmdline<CR>", opts)
key("n", "<Leader>fp", ":Telescope commands<CR>", opts)
key("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
key("n", "<Leader>fl", ":Telescope live_grep<CR>", opts)
