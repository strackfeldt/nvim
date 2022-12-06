local icons = require("utils.icons")

local tree_cb = require("nvim-tree.config").nvim_tree_callback

local list = {
	{ key = "l", cb = tree_cb("edit") },
}

require("nvim-tree").setup({
	hijack_cursor = true,
	disable_netrw = true,
	hijack_netrw = true,
	git = {
		enable = true,
		ignore = false,
		timeout = 200,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	update_focused_file = {
		enable = true,
	},
	filters = {
		-- dotfiles = true,
		-- custom = {
		-- 	"public",
		-- 	"next-env.d.ts",
		-- },
	},
	view = {
		side = "left",
		mappings = {
			custom_only = false,
			list = list,
		},
        width = 30,
        hide_root_folder = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
      },
	renderer = {
		indent_markers = {
			enable = false,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
		icons = {
            webdev_colors = true,
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
			glyphs = {
				default = icons.ui.Text,
				symlink = icons.ui.FileSymlink,
				git = {
					deleted = icons.git.FileDeleted,
					ignored = "", -- icons.git.FileIgnored,
					renamed = icons.git.FileRenamed,
					staged = icons.git.FileStaged,
					unmerged = icons.git.FileUnmerged,
					unstaged = icons.git.FileUnstaged,
					untracked = icons.git.FileUntracked,
				},
				folder = {
					default = icons.ui.Folder,
					empty = icons.ui.EmptyFolder,
					empty_open = icons.ui.EmptyFolderOpen,
					open = icons.ui.FolderOpen,
					symlink = icons.ui.FolderSymlink,
				},
			},
		},
		highlight_git = true,
		group_empty = false,
		root_folder_modifier = ":t",
	},
    log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          diagnostics = false,
          git = false,
          profile = false,
        },
      },
})
