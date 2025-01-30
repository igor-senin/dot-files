require("plugins")

require("plugins_setup.treesitter")

require("lspsaga").setup({
	move_in_saga = { -- navigation in lspsaga window
		prev = "<C-k>",
		next = "<C-j>",
	},
	finder_action_keys = {
		open = "<CR>", -- use ENTER to open file with finder
	},
	definition_action_keys = {
		edit = "<CR>",
	},
	ui = {
		-- code_action = "",
	},
	lightbulb = {
		enable = false,
	},
	code_action = {},
	symbol_in_winbar = {
		enable = false,
	},
})
