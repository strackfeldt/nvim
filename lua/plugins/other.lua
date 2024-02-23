return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "warmer",
                transparent = true,
            })
            require("onedark").load()
        end,
    },
    -- {
    --   "gmr458/vscode_modern_theme.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     require("vscode_modern").setup({
    --       cursorline = true,
    --       transparent_background = false,
    --       nvim_tree_darker = true,
    --     })
    --     vim.cmd.colorscheme("vscode_modern")
    --   end,
    -- },
    -- {
    --     "sainnhe/gruvbox-material",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.g.gruvbox_material_background = "hard"
    --         vim.g.gruvbox_material_better_performance = 1
    --         vim.g.gruvbox_material_transparent_background = 1
    --         vim.cmd("colorscheme gruvbox-material")
    --     end,
    -- },
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
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup()
        end,
    },
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
    { "github/copilot.vim" },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("ts_context_commentstring").setup()
            vim.g.skip_ts_context_commentstring_module = true
        end,
    },
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
            require("todo-comments").setup()
        end,
    },
}
