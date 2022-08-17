print("telescope loaded", os.getenv("HOME") .. "/code")

local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            "backups",
            "public",
            "migrations"
        },
        prompt_prefix = ">> ",
        mappings = {
            i = {["<esc>"] = actions.close},
            n = {["<esc>"] = actions.close}
        }
    },
    extensions = {
        cder = {
            dir_command = {"fd", "--max-depth=1", "--type=d", ".", os.getenv("HOME") .. "/code"}
        }
    }
}

require("telescope").load_extension("cder")
