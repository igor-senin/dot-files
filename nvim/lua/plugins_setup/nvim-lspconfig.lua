require("plugins")

require("lspconfig.ui.windows").default_options.border = "single"

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("util.lsp").on_attach
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "■",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
	virtual_text = true,
})

local function starts_with(str, prefix)
	return str:sub(1, #prefix) == prefix
end

local lspconfig = require("lspconfig")

-- lua
lspconfig.lua_ls.setup({
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
lspconfig.pylsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
    plugins = {
      jedi = { extra_paths = {
        -- paths
      },
      }
    },
  },
})

-- C C++
local clangd_cmd = { "clangd", "--background-index", "-j=8", "--header-insertion=never", "--fallback-style=none" }
local hellos_path = "/home/igor/src/hellos-private"
if starts_with(vim.fn.getcwd(), hellos_path) or vim.fn.getcwd() == hellos_path then
	clangd_cmd = { hellos_path .. "/clangd_start.sh" }
end
lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = clangd_cmd,
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
		"hpp",
		"h",
		"c.inc",
	},
	root_dir = lspconfig.util.root_pattern(
		"compile_commands.json",
		".clangd",
		"Makefile",
		"compile_flags.txt",
		".clang-format"
	),
})

-- rust
lspconfig.rust_analyzer.setup({
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
lspconfig.asm_lsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"S",
		"s",
		"asm",
	},
})

-- javascript
lspconfig.ts_ls.setup({
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
lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"css",
		"scss",
	},
})

-- go
lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- linters
local luacheck = require("efmls-configs.linters.luacheck")
-- local flake8 = require("efmls-configs.linters.flake8")
local eslint = require("efmls-configs.linters.eslint")
-- local cpplint = require("efmls-configs.linters.cpplint") -- clangd embeds clang-tidy
-- formatters
local stylua = require("efmls-configs.formatters.stylua")
-- local black = require("efmls-configs.formatters.black")
-- local yapf = require("efmls-configs.formatters.yapf")
local prettier = require("efmls-configs.formatters.prettier")
-- local clang_format = require("efmls-configs.formatters.clang_format") -- clangd embeds clang-format

-- configuring efm server
lspconfig["efm"].setup({
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = {
				luacheck,
				stylua,
			},
			python = {
				-- flake8,
				-- black,
        -- yapf,
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
