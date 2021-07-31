vim.g.nvim_tree_width = "30%"
vim.g.nvim_tree_side = "right"

vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = ""
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = ""
  }
}

local tree_cb = require "nvim-tree.config".nvim_tree_callback

vim.g.nvim_tree_bindings = {
  {key = "l", cb = tree_cb("edit")}
}
