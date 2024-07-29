return {
    "hoob3rt/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                component_separators = { left = " ", right = " " },
                -- section_separators = { left = "", right = "" },
                section_separators = { left = "█", right = "█" },

            },
        })
    end,
}
