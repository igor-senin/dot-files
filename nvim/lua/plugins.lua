local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("nvim-tree/nvim-tree.lua")

Plug("ryanoasis/vim-devicons")
Plug("numToStr/Comment.nvim")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("nvim-lualine/lualine.nvim")
Plug("nvim-tree/nvim-web-devicons")

Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

Plug("akinsho/toggleterm.nvim")

-- telescope
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.6" })

-- color schemes
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })
Plug("yasukotelin/shirotelin")
Plug("AlexvZyl/nordic.nvim")
Plug("EdenEast/nightfox.nvim")

-- TODO: vim-slime

-- LSP
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("windwp/nvim-autopairs")
Plug("creativenull/efmls-configs-nvim")
Plug("nvimdev/lspsaga.nvim")

-- auto completion
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")

vim.call("plug#end")
