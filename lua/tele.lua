local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "backups"
    },
    find_command = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = ">> ",
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
      n = {
        ["<esc>"] = actions.close
      }
    }
  },
  pickers = {
    find_files = {
      sort_lastused = true
    },
    commands = {
      --theme = "dropdown"
    }
  }
}
