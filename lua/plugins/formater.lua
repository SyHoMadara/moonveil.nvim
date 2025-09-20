return {
	-- Formatter
	{
		"stevearc/conform.nvim",
		lazy = false,
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black", "ruff" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "deno", "prettierd", "prettier", stop_after_first = true },
					html = { "deno", "prettierd", "jsbeautify", stop_after_first = true },

					typescript = { "deno", "prettierd", "prettier", stop_after_first = true },
					css = { "deno", "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "deno", "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "deno", "prettierd", "prettier", stop_after_first = true },
				},
				formatters = {
					jsbeautify = {
						command = "js-beautify",
					},
					deno = {
						command = "deno fmt",
					},
				},
				vim.keymap.set(
					{ "n", "v" }, -- Normal and Visual modes
					"<leader>i",
					function()
						require("conform").format({ lsp_format = "fallback" })
					end,
					{ desc = "Format buffer" }
				),
				-- format_on_save = {
				--   -- These options will be passed to conform.format()
				--   timeout_ms = 500,
				--   lsp_format = "fallback",
				-- },
			})
		end,
	},


	-- {
	-- 	"altermo/ultimate-autopair.nvim",
	-- 	event = { "InsertEnter", "CmdlineEnter" },
	-- 	branch = "v0.6", --recommended as each new version will have breaking changes
	-- 	opts = {
	-- 		--Config goes here
	-- 	},
	-- },

	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	config = function()
	-- 		require("nvim-ts-autotag").setup({
	-- 			opts = {
	-- 				-- Defaults
	-- 				enable_close = true, -- Auto close tags
	-- 				enable_rename = true, -- Auto rename pairs of tags
	-- 				enable_close_on_slash = false, -- Auto close on trailing </
	-- 			},
	-- 			-- Also override individual filetype configs, these take priority.
	-- 			-- Empty by default, useful if one of the "opts" global settings
	-- 			-- doesn't work well in a specific filetype
	-- 			per_filetype = {
	-- 				["html"] = {
	-- 					enable_close = false,
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
