require("plugins")

require("nvim-tree").setup({
	hijack_cursor = true,
	view = {
		cursorline = true,
	},
	actions = {
		file_popup = {
			open_win_config = {
				border = "rounded",
			},
		},
	},
})
