local tree_cb = require "nvim-tree.config".nvim_tree_callback

local list = {
    {key = "l", cb = tree_cb("edit")}
}

require "nvim-tree".setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_cwd = true,
    open_on_setup = false,
    open_on_tab = false,
    ignore_ft_on_setup = {},
    actions = {
        open_file = {
            quit_on_open = true
        }
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "?",
            info = "?",
            warning = "?",
            error = "?"
        }
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    filters = {
        dotfiles = true,
        custom = {
            "public",
            "next-env.d.ts"
        },
        exclude = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400
    },
    view = {
        side = "left",
        hide_root_folder = true,
        mappings = {
            custom_only = false,
            list = list
        }
    }
}
