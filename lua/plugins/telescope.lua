-- print("telescope loaded", os.getenv("HOME") .. "/code")

local key = vim.keymap.set
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

local builtin = require("telescope.builtin")

key("n", "<Leader>fr", builtin.resume, opts)
key("n", "<Leader>ff", builtin.find_files, opts)
key("n", "<C-p>", builtin.git_files, opts)

key("n", "<Leader>fl", builtin.live_grep, opts)
key("n", "<Leader>fs", function()
	local search = vim.fn.input("grep: ")

	if #search > 0  then
		builtin.grep_string({ search = search })
	end
end, opts)

key("n", "<leader>c", ":FineCmdline<CR>", opts)

key("n", "<Leader>fp", ":Telescope commands<CR>", opts)
key("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
