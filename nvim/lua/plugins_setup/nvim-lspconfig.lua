require("plugins")

require("lspconfig.ui.windows").default_options.border = "single"

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs
for type, icon in pairs(diagnostic_signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- lua
require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	on_init = function(client)
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- python
require("lspconfig").pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {},
})

-- C C++
require("lspconfig").clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {},
	init_options = {
		-- fallbackFlags = { "--std=c++23" },
	},
	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		"cuda",
		"cu",
		"cuh",
		"proto",
		"hpp",
		"h",
		"c.inc",
	},
})

-- rust
require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {},
	diagnostics = {
		refreshSupport = false,
	},
	filetypes = {
		"rust",
	},
})

-- asm
require("lspconfig").asm_lsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"S",
		"s",
		"asm",
	},
})

-- javascript
require("lspconfig").ts_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.jsx",
	},
})

-- css
require("lspconfig").cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"css",
		"scss",
	},
})

-- linters
local luacheck = require("efmls-configs.linters.luacheck")
local flake8 = require("efmls-configs.linters.flake8")
local eslint = require("efmls-configs.linters.eslint")
-- local cpplint = require("efmls-configs.linters.cpplint") -- clangd embeds clang-tidy
-- formatters
local stylua = require("efmls-configs.formatters.stylua")
local black = require("efmls-configs.formatters.black")
local prettier = require("efmls-configs.formatters.prettier")
-- local clang_format = require("efmls-configs.formatters.clang_format") -- clangd embeds clang-format

-- configuring efm server
require("lspconfig")["efm"].setup({
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = {
				luacheck,
				stylua,
			},
			python = {
				flake8,
				black,
			},
			javascript = {
				eslint,
				prettier,
			},
		},
	},
	filetypes = {
		"lua",
		"python",
		"c",
		"javascript",
		"javascriptreact",
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
		hover = true,
		documentSymbol = true,
		codeAction = true,
		completion = true,
	},
	-- single_file_support = false,
})
