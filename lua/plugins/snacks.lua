return {
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = { enabled = false },
			scroll = { enabled = false },
			indent = { enabled = false },
			picker = {
				sources = {
					explorer = {
						layout = { preset = "default", preview = true },
						auto_close = true,
					},
				},
			},
		},
	},
}
