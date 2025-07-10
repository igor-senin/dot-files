require("plugins")
local vim = vim
-- local nerdtree_augroup = vim.api.nvim_create_augroup("NERDTreeClose", { clear = true })
local nvimtree_augroup = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true })

-- Open NvimTree by default
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	desc = "Open NvimTree by default",
	group = nvimtree_augroup,
	callback = function()
		require("nvim-tree.api").tree.open()
		vim.cmd("wincmd p")
	end,
})

-- local isNerdTreeEnabled = function()
--   return vim.t.NERDTreeBufName and vim.fn.bufwinnr(vim.t.NERDTreeBufName) ~= -1
-- end
--

local isNvimTreeEnabled = function()
	return require("nvim-tree.view").is_visible()
end
-- When NvimTree is the last window, quit nvim
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	desc = "Close vim if NvimTree is the last window",
	group = nvimtree_augroup,
	callback = function()
		if vim.fn.winnr("$") == 1 and isNvimTreeEnabled() then
			vim.cmd("quit")
		end
	end,
})

-- TODO: сделать так, чтобы при "nvim ." и открытии файла NERDTree оставался открытым
-- vim.api.nvim_create_autocmd({"VimEnter"}, {
--   desc = "Open NERDTree when type 'nvim .'",
--   group = nerdtree_augroup,
--   callback = function()
--     -- TODO
--   end,
-- })

local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	desc = "Format before save",
	callback = function()
		local efm = vim.lsp.get_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})
