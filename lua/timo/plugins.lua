local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Installing packer...")
	local packer_url = "https://github.com/wbthomason/packer.nvim"
	vim.fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
	print("Done.")

	vim.cmd("packadd packer.nvim")
	install_plugins = true
end

require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

    --ui
    use({ "folke/tokyonight.nvim" })
    use({
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup {
                style = 'deep'
            }
            require('onedark').load()
        end,
    })

	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			pcall(require, "plugins.lualine")
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		config = function()
			pcall(require, "plugins.bufferline")
		end,
	})
	use({
		"glepnir/dashboard-nvim",
		config = function()
			pcall(require, "plugins.dashboard-nvim")
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				char = "¦",
				show_trailing_blankline_indent = false,
			})
			-- pcall(require, "plugins.indent-blankline")
		end,
	})
    use ({
        "akinsho/toggleterm.nvim", tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    })

	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			pcall(require, "plugins.nvim-tree")
		end,
	})

	-- Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			pcall(require, "plugins.telescope")
		end,
	})

	-- fancy
	use({ "MunifTanjim/nui.nvim" })
	use({ "VonHeikemen/searchbox.nvim" })
	use({ "VonHeikemen/fine-cmdline.nvim" })
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	-- syntax
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/nvim-treesitter-context" })

	--lsp
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({
		"neovim/nvim-lspconfig",
		config = function()
			pcall(require, "plugins.lsp")
		end,
	})
	use({ "onsails/lspkind-nvim" })
	use({ "VonHeikemen/lsp-zero.nvim" })

	--completion
	use({ "github/copilot.vim" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-cmdline" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			pcall(require, "plugins.gitsigns")
		end,
	})
    -- use({
    --     -- "TimUntersberger/neogit",
    --     config = function()
    --         -- pcall(require, "plugins.neogit")
    --     end,
    -- })

	-- code manipulation
	use({
		"numToStr/Comment.nvim",
		config = function()
			pcall(require, "plugins.comment")
		end,
	})
	use({
		"sbdchd/neoformat",
		config = function()
			pcall(require, "plugins.neoformat")
		end,
	})

	-- auto
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- utils
	use({ "nvim-lua/plenary.nvim" })

	if install_plugins then
		require("packer").sync()
	end
end)

if install_plugins then
	print("==================================")
	print("    Plugins will be installed.")
	print("       After you press Enter")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
end

-- require("plugins.bufferline")
-- require("plugins.lualine")
-- require("plugins.nvim-tree")
-- require("plugins.comments")
-- require("plugins.telescope")
-- require("plugins.formatter")
require("plugins.gitsigns")
