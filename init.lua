require("timo.plugins")

require("timo.settings")
require("timo.autocommands")
require("timo.keybindings")

require("timo.nvim-tree")
require("timo.telescope")
require("timo.treesitter")
require("timo.lsp")

require("todo-comments").setup({})
require("colorizer").setup()
require("gitsigns").setup({})
require("which-key").setup({})
require("nvim-autopairs").setup({})
require("nvim-ts-autotag").setup({})

require("lualine").setup({
	options = {
		theme = "tokyonight",
		disabled_filetypes = { "NvimTree" },
		-- section_separators = "",
		-- component_separators = ""
	},
})
require("Comment").setup({
	pre_hook = function(ctx)
		local U = require("Comment.utils")

		local location = nil
		if ctx.ctype == U.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})

require("bufferline").setup({
	options = {
		show_close_icon = false,
		show_tab_indicators = false,
		offsets = { { filetype = "NvimTree" } },
		right_mouse_command = nil,
		middle_mouse_command = "bdelete! %d",
	},
})

-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = require("formatter.filetypes.lua").stylua,
		typescriptreact = require("formatter.filetypes.typescriptreact").prettier,
		typescript = require("formatter.filetypes.typescript").prettier,
	},
})
