local components = require("plugins.lualine.components")

require("lualine").setup({
	options = {
		theme = "tokyonight",
		section_separators = "",
		component_separators = "",
	},
	-- tabline = {
	-- 	lualine_a = { "buffers" },
	-- 	lualine_b = {},
	-- 	lualine_c = {},
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = {},
	-- },
	-- winbar = {
	-- 	lualine_a = { "filename" },
	-- 	lualine_b = {},
	-- 	lualine_c = {},
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = {},
	-- },
	sections = {
		-- lualine_a = {
		-- 	components.mode,
		-- },
		-- lualine_b = {
		-- 	components.branch,
		-- },
		-- lualine_c = {
		-- 	components.diff,
		-- 	components.python_env,
		-- },
		-- lualine_x = {
		-- 	components.diagnostics,
		-- 	components.lsp,
		-- 	components.spaces,
		-- 	components.filetype,
		-- },
		-- lualine_y = { components.location },
		-- lualine_z = {
		-- 	components.progress,
		-- },
		lualine_a = {
			components.mode,
		},
		lualine_b = {
			components.branch,
		},
		lualine_c = {
			-- "filename",
			components.diff,
			-- components.python_env,
		},
		lualine_x = {
			components.diagnostics,
			components.lsp,
			-- components.spaces,
			components.filetype,
		},
		lualine_y = {
			-- components.location,
		},
		lualine_z = {
			components.location,
			-- components.progress,
		},
	},
})
