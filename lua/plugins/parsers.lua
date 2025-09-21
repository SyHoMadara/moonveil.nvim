return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPre",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"tsx",
					"typescript",
					"javascript",
					"html",
					"css",
					-- "vue",
					-- "astro",
					-- "svelte",
					"gitcommit",
					-- "graphql",
					"json",
					"json5",
					"lua",
					"markdown",
					"prisma",
					"python",
					"vim",
				}, -- one of "all", or a list of languages
				sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
				ignore_install = { "haskell" }, -- list of parsers to ignore installing
				highlight = {
					enable = true,
					-- disable = { "c", "rust" },  -- list of language that will be disabled
					-- additional_vim_regex_highlighting = false,
				},
        -- autotag = { enable = true },
				folding = true,
				incremental_selection = {
					enable = false,
					keymaps = {
						init_selection = "<leader>Pnn",
						node_incremental = "<leader>Pnr",
						scope_incremental = "<leader>Pne",
						node_decremental = "<leader>Pnt",
					},
				},

				indent = {
					enable = true,
				},
			})
		end,
		dependencies = {
			"hiphish/rainbow-delimiters.nvim",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
		},
	},


	{
		"wurli/contextindent.nvim",
		-- This is the only config option; you can use it to restrict the files
		-- which this plugin will affect (see :help autocommand-pattern).
		opts = { pattern = "*" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
