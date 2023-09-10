local plugins = {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			require("core.utils").load_mappings("dap")
		end,
	},
	-- Mason
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

				"pyright",
				"black",
				"mypy",
				"ruff",

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
