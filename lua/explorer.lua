vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_gitignore = 1

local tree_cb = require "nvim-tree.config".nvim_tree_callback

local list = {
  {key = "l", cb = tree_cb("edit")}
}

require "nvim-tree".setup {
  nvim_tree_gitignore =true,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  update_cwd = false,
  open_on_setup = false,
  auto_close = true,
  open_on_tab = false,
  ignore_ft_on_setup = {},
  update_to_buf_dir = {
    enable = true,
    auto_open = true
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = ""
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
    custom = {}
  },
  view = {
    -- width = 30,
    -- height = 30,
    side = "left",
    auto_resize = true,
    hide_root_folder = true,
    mappings = {
      custom_only = false,
      list = list
    }
  }
}
