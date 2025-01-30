require("plugins")

require("catppuccin").setup({
	flavour = "latte", -- frappe or latte
	integrations = {
		mason = true,
		nvimtree = true,
		telescope = {
			enabled = true,
			-- style = 'nvchad',
		},
		treesitter = true,
		indent_blankline = {
			enabled = true,
			scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
			colored_indent_levels = false,
		},
	},
})

vim.cmd.colorscheme("catppuccin")
