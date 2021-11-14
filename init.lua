require("plugins")
require("settings")
require("explorer")
require("tele")
require("sitter")
require("lsp")
require("format")

require("bufferline").setup()
require("nvim-autopairs").setup()
require("nvim-ts-autotag").setup()
require("gitsigns").setup()

-- COLORS
-- vim.api.nvim_exec(
--   [[
-- if exists('+termguicolors')
--   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--   set termguicolors
-- endif
-- ]],
--   true
-- )
vim.o.termguicolors = true
vim.g.tokyonight_style = "night"
vim.cmd("colorscheme tokyonight")
require("lualine").setup {
  options = {
    theme = "tokyonight",
    disabled_filetypes = {"NvimTree"}
    -- section_separators = "",
    -- component_separators = ""
  }
}



  require("todo-comments").setup {}



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
