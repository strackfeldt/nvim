return {
    "hoob3rt/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                component_separators = { left = " ", right = " " },
                -- section_separators = { left = "", right = "" },
                section_separators = { left = "█", right = "█" },

            },
        })
    end,
}
