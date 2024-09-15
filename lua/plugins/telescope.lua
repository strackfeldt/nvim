return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = { ["<esc>"] = require("telescope.actions").close },
        n = { ["<esc>"] = require("telescope.actions").close },
      },
    },
  },
}
