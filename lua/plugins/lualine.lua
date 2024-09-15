-- section_separators = { left = "", right = "" },
-- section_separators = { left = "█", right = "█" },

return {
    "hoob3rt/lualine.nvim",
    config = function()
        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = false,
            always_visible = true,
        }

        local diff = {
            "diff",
            colored = false,
            symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = hide_in_width,
        }

        local filename = {
            "filename",
            path = 1,
        }

        local filetype = {
            "filetype",
            icons_enabled = false,
        }

        local location = {
            "location",
            padding = 0,
        }

        require("lualine").setup({
            options = {
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { diagnostics },
                lualine_x = { diff, filename, filetype },
                lualine_y = { location },
                lualine_z = { "progress" },
            },
        })
    end,
}
