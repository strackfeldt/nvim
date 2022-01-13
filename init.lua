vim = vim

require("plugins")
require("settings")

vim.g.copilot_no_tab_map = true

-- COLORS
vim.o.termguicolors = true
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = {"NvimTree"}
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

vim.cmd("colorscheme tokyonight")

vim.cmd([[ 
imap <silent><script><expr> <C-L> copilot#Accept()
highlight CopilotSuggestion guifg=#87bb98 ctermfg=8
]])

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx  FormatWrite
augroup END
]],
  true
)

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
    lualine_x = {},
    lualine_y = {"filetype"}
  }
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

-- require('bqf').setup {}
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
require("trouble").setup {}
require("which-key").setup {}
require("todo-comments").setup {}
require("better_escape").setup {mapping = {"jk", "jj"}}
require("neoscroll").setup {}
require("colorizer").setup()
