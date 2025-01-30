local map = require("util.mapkey").map

local M = {}

-- to set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	map("n", "<Leader>fd", ":Lspsaga finder<CR>", opts) -- go to definition
	map("n", "<Leader>gd", ":Lspsaga peek_definition<CR>", opts) -- peak definition
	map("n", "<Leader>gD", ":Lspsaga goto_definition<CR>", opts) -- go to definition
	map("n", "<Leader>ca", ":Lspsaga code_action<CR>", opts) -- see available code action
	map("n", "<Leader>rn", ":Lspsaga rename<CR>", opts) -- smart rename
	map("n", "<Leader>D", ":Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for line
	map("n", "<Leader>d", ":Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	map("n", "<Leader>pd", ":Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buffer
	map("n", "<Leader>nd", ":Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	map("n", "K", ":Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

	if client.name == "pyright" then
		map("n", "<Leader>oi", ":PyrightOrganizeImports<CR>", opts)
	end
end

M.diagnostic_signs = { Error = "", Warn = "", Hint = "■", Info = "" }

return M
