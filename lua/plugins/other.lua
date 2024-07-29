return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "latte",
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require("hop").setup({ keys = "asdfghjkl;" })
        end,
    },
    {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                view_options = {
                    show_hidden = true,
                },
            })
        end,
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
    {
        "christoomey/vim-tmux-navigator",
    },
    { "kevinhwang91/nvim-bqf" },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    -- {
    --     "akinsho/bufferline.nvim",
    --     version = "*",
    --     dependencies = "nvim-tree/nvim-web-devicons",
    --     config = function()
    --         require("bufferline").setup()
    --     end,
    -- },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                scope = { enabled = false },
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
    {
        "windwp/nvim-ts-autotag",
        opts = {}, -- this is equalent to setup({}) function
    },
    -- { "github/copilot.vim" },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },
    -- {
    --     "JoosepAlviste/nvim-ts-context-commentstring",
    --     config = function()
    --         require("ts_context_commentstring").setup()
    --         vim.g.skip_ts_context_commentstring_module = true
    --     end,
    -- },
    -- {
    --     "numToStr/Comment.nvim",
    --     config = function()
    --         require("Comment").setup({
    --             pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    --         })
    --     end,
    -- },
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
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
            require("todo-comments").setup()
        end,
    },
}
