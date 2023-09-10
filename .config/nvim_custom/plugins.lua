local plugins = {
	-- Mason
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"shellcheck",

				"clangd",
				"clang-format",

				"rust-analyzer",

				"pyright",
				"black",
				"mypy",
				"ruff",

				"lua_ls",
				"stylua",

				"cssls",

				"prettierd",
			},
		},
	},
	-- Treesitter
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
				"cpp",
				"python",
				"bash",
				"rust",
			},
		},
	},

	-- In order to modify the `lspconfig` configuration:
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
	{
		"neovim/nvim-lspconfig",
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
