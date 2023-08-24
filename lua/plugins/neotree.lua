local events = require("neo-tree.events")

require("neo-tree").setup({
	close_if_last_window = true,
	event_handlers = {
		{
			event = events.FILE_OPENED,
			handler = function()
				require("neo-tree").close_all()
			end,
		},
	},
	window = {
		position = "left",
		width = 40,
	},
	filesystem = {
        follow_current_file = true,
		filtered_items = {
			-- hide_dotfiles = false,
			-- hide_gitignored = false,
		},
        -- hijack_netrw_behavior = "disabled",
	},
	buffers = {
		follow_current_file = true,
		group_empty_dirs = true,
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			},
		},
	},
})
