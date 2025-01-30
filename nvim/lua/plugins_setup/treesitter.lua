require("plugins")

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"python",

		"javascript",
		"tsx",
		"typescript",
		"vue",

		"haskell",

		"bash",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",

		"nasm",
		"asm",
		"kconfig",

		"make",
		"cmake",
		"dockerfile",
		"json",
		"html",
		"css",
		"http",
		"ini",
		"xml",
		"yaml",
	},
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
		-- additional_vim_regex_highlighting = true,
	},
	autotage = {
		enable = true,
	},
	sync_install = false,
	auto_install = true,
})
