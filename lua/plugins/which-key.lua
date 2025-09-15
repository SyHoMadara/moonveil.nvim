return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("config.which-key.setup")
		end,
	},
}
