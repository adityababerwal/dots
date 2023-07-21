local plugins = {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"shellcheck",

				"clangd",
				"clang-format",
				"codelldb",

				"rust-analyzer",
				"rustfmt",

				"pyright",
				"mypy",
				"ruff",
				"black",

				"stylua",

				"cssls",

				"prettierd",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- defaults
				"vim",
				"lua",

				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"jsonc",
				-- "vue", "svelte",

				-- low level
				"c",
				"zig",
				"cpp",
				"python",
				"bash",
			},
		},
	},

	-- In order to modify the `lspconfig` configuration:
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- Just vimwiki
	{
		"vimwiki/vimwiki",
		lazy = false,
	},
}

return plugins
