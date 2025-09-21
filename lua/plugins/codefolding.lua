return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			-- It's recommended to set the provider to treesitter or lsp
			-- see https://github.com/kevinhwang91/nvim-ufo#quick-start
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,

				-- Use the correctly referenced handler function
				fold_virt_text_handler = require("utils._ufo").handler,

				open_fold_hl_timeout = 150,
				close_fold_kinds_for_ft = {
					defult = {},
					python = { "import_statement", "function_definition", "import_from_statement", "argument_list" },
				},
				preview = {
					win_config = {
						border = { "", "─", "", "", "", "─", "", "" },
						winhighlight = "Normal:Folded",
						winblend = 0,
					},
					mappings = {
						scrollU = "<C-u>",
						scrollD = "<C-d>",
						jumpTop = "[",
						jumpBot = "]",
					},
				},
			})
			vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "UFO: Open all folds" })
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "UFO: Close all folds" })
			vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					-- if no fold is under cursor, fallback to LSP hover
					vim.lsp.buf.hover()
				end
			end, { desc = "UFO: Peek folded lines" })
			vim.keymap.set("n", "zc", function()
				local row = vim.fn.line(".")
				require("ufo").closeFoldsWith(1, { row, row })
			end, { desc = "UFO: Close current fold" })
		end,
	},
}
