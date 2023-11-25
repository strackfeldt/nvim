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
	pickers = {
		git_files = {
			-- theme = "dropdown",
			previewer = false,
		},
		find_files = {
			-- theme = "dropdown",
			previewer = false,
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
			mappings = {
				i = { ["<c-d>"] = actions.delete_buffer },
				n = { ["<c-d>"] = actions.delete_buffer },
			},
		},
	},
})
