require("packer").init({
        compile_path = "~/.local/share/nvim/plugin/packer_compiled.lua",
        display = {
            non_interactive = false,
            open_fn = require("packer.util").float,
            show_all_info = false,
            prompt_border = "single"
        }
    }
)

return require("packer").startup(
    function(use)
        use {"wbthomason/packer.nvim"}

        -- colors
        use {"folke/tokyonight.nvim"}

        --ui
        use {"kyazdani42/nvim-tree.lua"}
        use {"akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons"}
        use {"hoob3rt/lualine.nvim"}
        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end
        }
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup()
            end
        }

        -- syntax
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/plenary.nvim"},
                {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
            }
        }
        use {"Zane-/cder.nvim"}

        use {"kyazdani42/nvim-web-devicons"}
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup()
            end
        }
        use {"lukas-reineke/indent-blankline.nvim"}

        use {"github/copilot.vim"}

        use {"neovim/nvim-lspconfig"}
        use {"glepnir/lspsaga.nvim"}
        use {"onsails/lspkind-nvim"}
        use {"williamboman/nvim-lsp-installer"}

        -- snip
        use {"hrsh7th/vim-vsnip"}
        use {"rafamadriz/friendly-snippets"}

        --completion
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                {"hrsh7th/cmp-nvim-lsp"},
                {"hrsh7th/cmp-vsnip"}
            }
        }

        -- auto
        use {
            "windwp/nvim-ts-autotag",
            config = function()
                require("nvim-ts-autotag").setup()
            end
        }
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup()
            end
        }

        --workspace
        use {
            "folke/todo-comments.nvim",
            config = function()
                require("todo-comments").setup()
            end
        }
        use {"numToStr/Comment.nvim"}
        use {"JoosepAlviste/nvim-ts-context-commentstring"}
        -- use {"sbdchd/neoformat"}
        use {"mhartington/formatter.nvim"}

        -- languages
        use {"pantharshit00/vim-prisma"}
        use {"stephenway/postcss.vim"}
        -- use "wuelnerdotexe/vim-astro"
    end
)
