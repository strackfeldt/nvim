require("treesitter-context").setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "help", "javascript", "typescript", "tsx", "c", "lua", "rust", "prisma" },

	sync_install = false,

	-- indent = {
	-- 	enable = true,
	-- },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
	},
})
