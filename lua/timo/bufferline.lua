require("bufferline").setup({
	options = {
		show_close_icon = false,
		show_tab_indicators = false,
		offsets = { { filetype = "NvimTree" } },
		right_mouse_command = nil,
		middle_mouse_command = "bdelete! %d",
	},
})
