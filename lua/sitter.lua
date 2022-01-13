require "nvim-treesitter.configs".setup {
  matchup = {
    enable = true
  },
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>"
    }
  },
  rainbow = {
    enable = false,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
  },
  ensure_installed = {
    "javascript",
    "typescript"
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
}
