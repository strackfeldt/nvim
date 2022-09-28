local tree_cb = require("nvim-tree.config").nvim_tree_callback

local list = {
  { key = "l", cb = tree_cb "edit" },
}

require("nvim-tree").setup {
  hijack_cursor = true,
  disable_netrw = true,
  hijack_netrw = true,
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
    custom = {
      "public",
      "next-env.d.ts",
    },
  },
  view = {
    side = "left",
    --[[ hide_root_folder = true, ]]
    mappings = {
      custom_only = false,
      list = list,
    },
  },
}
