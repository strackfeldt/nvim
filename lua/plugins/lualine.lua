local icons = require("utils.icons")

local components = {
	mode = {
		function()
			return " " .. icons.ui.Neovim .. " "
		end,
		padding = { left = 0, right = 0 },
		color = {},
		cond = nil,
	},
	filename = {
		"filename",
		color = {},
		cond = nil,
	},
	branch = {
		"b:gitsigns_head",
		icon = icons.git.Branch,
		color = { gui = "bold" },
	},
	diff = {
		"diff",
		source = function()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end,
		symbols = {
			added = icons.git.LineAdded .. " ",
			modified = icons.git.LineModified .. " ",
			removed = icons.git.LineRemoved .. " ",
		},
		padding = { left = 2, right = 1 },
		cond = nil,
	},
	diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = {
			error = icons.diagnostics.BoldError .. " ",
			warn = icons.diagnostics.BoldWarning .. " ",
			info = icons.diagnostics.BoldInformation .. " ",
			hint = icons.diagnostics.BoldHint .. " ",
		},
	},
	treesitter = {
		function()
			return icons.ui.Tree
		end,
		color = function()
			local buf = vim.api.nvim_get_current_buf()
			local ts = vim.treesitter.highlighter.active[buf]
			return { fg = ts and not vim.tbl_isempty(ts) }
		end,
	},
	lsp = {
		function(msg)
			msg = msg or "LS Inactive"
			local buf_clients = vim.lsp.buf_get_clients()
			if next(buf_clients) == nil then
				-- TODO: clean up this if statement
				if type(msg) == "boolean" or #msg == 0 then
					return "LS Inactive"
				end
				return msg
			end
			-- local buf_ft = vim.bo.filetype
			local buf_client_names = {}
			local copilot_active = false

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" and client.name ~= "copilot" then
					table.insert(buf_client_names, client.name)
				end

				if client.name == "copilot" then
					copilot_active = true
				end
			end

			-- -- add formatter
			-- local formatters = require "lvim.lsp.null-ls.formatters"
			-- local supported_formatters = formatters.list_registered(buf_ft)
			-- vim.list_extend(buf_client_names, supported_formatters)

			-- -- add linter
			-- local linters = require "lvim.lsp.null-ls.linters"
			-- local supported_linters = linters.list_registered(buf_ft)
			-- vim.list_extend(buf_client_names, supported_linters)

			local unique_client_names = vim.fn.uniq(buf_client_names)

			local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"

			if copilot_active then
				language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
			end

			return language_servers
		end,
		color = { gui = "bold" },
	},
	location = {
		"location",
	},
	progress = {
		"progress",
		fmt = function()
			return "%P/%L"
		end,
		color = {},
	},
	filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } },
}

require("lualine").setup({
	options = {
		-- theme = "tokyonight",
		theme = "onedark",
		-- section_separators = "",
		-- component_separators = "",
	},
	sections = {
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
			components.filetype,
		},
		-- lualine_y = {
		-- 	-- components.location,
		-- },
		-- lualine_z = {
		-- 	components.location,
		-- 	-- components.progress,
		-- },
	},
})
