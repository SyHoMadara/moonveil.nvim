local present, wk = pcall(require, "which-key")
if not present then
	return
end

wk.setup({
	triggers = {
		{ "<leader>", mode = { "n", "v" } },
		{ "f", mode = { "n", "i" } },
	},
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
			z = false, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	win = {
		border = SyHoMadaraVim.ui.float.border or "rounded", -- none, single, double, shadow, rounded
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 4, -- spacing between columns
		align = "left", -- align columns left, center or right
	},

	show_help = true, -- show help message on the command line when the popup is visible
})

wk.add({
	{ "<leader>h", group = " Help" .. SyHoMadaraVim.icons.info },
	{ "<leader>g", group = " Git" .. SyHoMadaraVim.icons.git },
	{ "<leader>l", group = " Lazy Git" .. SyHoMadaraVim.icons.git },

	{ "<leader>f", group = " Grep" .. SyHoMadaraVim.icons.search },
	{ "<leader>p", group = " Project" .. SyHoMadaraVim.icons.folder },
	{ "<leader>s", group = "Code" },
	{
		"<leader>?",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "Buffer Local Keymaps",
	},
})

wk.add({
	{ "<A-q>", "<cmd>bn|bd#<CR>", desc = " Close Buffer " .. SyHoMadaraVim.icons.close, mode = { "n", "i" } },
	{ "<C-s>", "<cmd>w<cr>", desc = "Save Buffer", mode = { "n", "i" } },
  { "<C-e>", "<cmd>q!<cr>", desc = "Quit Neovim", mode = { "n", "i" }}
})


wk.add({
  { "<leader>/", "gcc", desc = "Toggle Commant", mode = { "n", "v" }},
})
