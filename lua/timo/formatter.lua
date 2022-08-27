-- Utilities for creating configurations
-- local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    typescriptreact = require("formatter.filetypes.typescriptreact").prettier,
    typescript = require("formatter.filetypes.typescript").prettier,
    json = require("formatter.filetypes.typescript").prettier,
    markdown = require("formatter.filetypes.markdown").prettier,
    lua = require("formatter.filetypes.lua").stylua,
    go = require("formatter.filetypes.go").gofmt,
  },
}
