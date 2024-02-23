require("config.options")

require("config.lazy")

require("config.autocmds")
require("config.keymaps")

require("tools.magic-sql")

vim.filetype.add({
  filename = {
    [".env"] = "sh",
    [".envrc"] = "sh",
    ["*.env"] = "sh",
    ["*.envrc"] = "sh"
  }
})
