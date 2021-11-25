vim = vim

require("plugins")

require("settings")

-- COLORS
vim.o.termguicolors = true
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = {"NvimTree"}
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

vim.cmd("colorscheme tokyonight")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 5,
      severity_limit = "Warning"
    },
    update_in_insert = true
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.lua FormatWrite
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
    offsets = {{filetype = "NvimTree"}}
  }
}

-- require('bqf').setup {}

require("nvim-autopairs").setup {}
require("nvim-ts-autotag").setup {}
require("gitsigns").setup {}
require("trouble").setup {}
require("which-key").setup {}
require("todo-comments").setup {}
require("better_escape").setup {mapping = {"jk", "jj"}}
require("neoscroll").setup {}
