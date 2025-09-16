return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("config.which-key.setup")
		end,
	},
	{
		"sudormrfbin/cheatsheet.nvim",

		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("cheatsheet").setup({
				-- telescope_mappings = {
				-- 	["<CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
				-- 	["<A-CR>"] = require("cheatsheet.telescope.actions").select_or_execute,
				-- 	["<C-Y>"] = require("cheatsheet.telescope.actions").copy_cheat_value,
				-- 	["<C-E>"] = require("cheatsheet.telescope.actions").edit_user_cheatsheet,
				-- },
			})
		end,
	},
}
