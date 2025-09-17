return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("config.lsp.setup")
			require("config.lsp.config")
		end,
	},

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
        border = SyHoMadaraVim.ui.float.border or "rounded",
			},
		},
		keys = {
			{ "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" },
		},
	},

	{
		"antosha417/nvim-lsp-file-operations",
		event = "LspAttach",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-tree.lua" },
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
}
