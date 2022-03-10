vim = vim

require("plugins")
require("settings")
require("keybindings")
require("explorer")
require("tele")
require("sitter")
require("lsp")
require("format")

require("lualine").setup {
  options = {
    theme = "tokyonight",
    disabled_filetypes = {"NvimTree"},
    section_separators = "",
    component_separators = ""
  },
  sections = {
    lualine_c = {require("auto-session-library").current_session_name},
    lualine_x = {},
    lualine_y = {"filetype"}
  }
}

require("auto-session").setup {
  log_level = "info",
  auto_session_suppress_dirs = {"~/", "~/Projects"}
}

require("bufferline").setup {
  options = {
    show_close_icon = false,
    show_tab_indicators = false,
    offsets = {{filetype = "NvimTree"}},
    right_mouse_command = nil,
    middle_mouse_command = "bdelete! %d"
  }
}

require("Comment").setup {
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == "typescriptreact" then
      local U = require("Comment.utils")

      -- Detemine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end

      return require("ts_context_commentstring.internal").calculate_commentstring(
        {
          key = type,
          location = location
        }
      )
    end
  end
}
require("surround").setup {}
require("nvim-autopairs").setup {}
require("nvim-ts-autotag").setup {}

require("gitsigns").setup {}
require("which-key").setup {}
require("todo-comments").setup {}
require("colorizer").setup()
