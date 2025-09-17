return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Improved directory color hashing function
			local function get_workdir_color()
				local wd = vim.fn.getcwd()
				local hash = 0
				for i = 1, #wd do
					hash = (hash * 31 + string.byte(wd, i)) % 2 ^ 32
				end

				local colors = {
					"#007acc",
					"#3e3e42",
					"#179ff1",
					"#ff5555",
					"#ff8800",
					"#ffcc00",
					"#00cc66",
					"#00cccc",
					"#cc66ff",
					"#ff66aa",
					"#ad7fa8",
					"#729fcf",
					"#ef2929",
				}

				return colors[(hash % #colors) + 1]
			end

			local function get_workdir_name()
				local n = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				return (n ~= "" and n) or "[No Folder]"
			end

			local function get_lsp_name()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if not clients or #clients == 0 then
					return ""
				end
				return " " .. clients[1].name
			end

			require("lualine").setup({
				options = {
					theme = "vscode",
					section_separators = { left = "", right = "" },
					component_separators = { left = "►", right = "" },
					globalstatus = true,
					icons_enabled = true,
				},
				sections = {
					lualine_a = {
						{
							"mode",
							color = function()
								return { fg = "#FFFFFF", bg = get_workdir_color(), gui = "bold" }
							end,
							separator = { right = "" },
							icon = "",
						},
					},
					lualine_b = {
						{ "branch", icon = "", color = { fg = "#CCCCCC", bg = "#2d2d30" } },
						{
							"diff",
							symbols = { added = "  ", modified = " ", removed = " " },
							color = { bg = "#2d2d30" },
							separator = { right = "┃" },
						},
					},
					lualine_c = {
						{
							get_workdir_name,
							icon = " ",
							color = function()
								return {
									fg = get_workdir_color(),
									-- bg = '#2d2d30',
									gui = "bold",
								}
							end,
						},
						{
							"filename",
							file_status = true,
							symbols = { modified = " ●", readonly = " ", newfile = " ✧" },
							color = { fg = "#CCCCCC" },
						},
					},
					lualine_x = {
						{ get_lsp_name, color = { fg = "#CCCCCC" } },
						{ "filetype", icons_enabled = true }, --color = { fg = '#CCCCCC' } },
					},
					lualine_y = {
						{ "progress", color = { fg = "#CCCCCC", bg = "#2d2d30" } },
					},
					lualine_z = {
						{
							"location",
							icon = "",
							color = function()
								return { fg = "#FFFFFF", bg = get_workdir_color(), gui = "bold" }
							end,
							separator = { left = "" },
						},
					},
				},
				inactive_sections = {
					lualine_c = { { "filename", color = { fg = "#777777" } } },
					lualine_x = { { "location", color = { fg = "#777777" } } },
				},
				extensions = { "nvim-tree", "quickfix", "fugitive", "lazy" },
			})
		end,
	},
}
