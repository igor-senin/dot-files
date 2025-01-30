require("plugins")

require("plugins_setup.mason")

require("mason-lspconfig").setup({
	ensure_installed = {
		"efm",
		"lua_ls",
		"clangd",
		"pyright",
		"eslint",
	},
	automatic_installation = true,
})
