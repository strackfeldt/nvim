local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Colorscheme
	{
		"sainnhe/gruvbox-material",
		priority = 1000,
		lazy = false,
		config = function()
			vim.o.background = "dark"
			vim.g.gruvbox_material_background = "hard"

			-- transparent background
			-- vim.g.gruvbox_material_transparent_background = 1

			vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	-- Icons
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.devicons")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	},

	-- Status- and Bufferline
	{
		"hoob3rt/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.bufferline")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
		end,
		config = function()
			require("plugins.neotree")
		end,
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("plugins.treesitter")
		end,
	},

	--lsp
	{ "onsails/lspkind-nvim" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
		config = function()
			require("plugins.lsp")
		end,
	},

	{ "github/copilot.vim" },

	-- code manipulation
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"sbdchd/neoformat",
		config = function()
			vim.g.neoformat_try_node_exe = 1
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
		end,
	},
}

local opts = {}

require("lazy").setup(plugins)
