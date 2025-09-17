return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		-- `main` is untested, please open a PR if you've confirmed it works as expected
		dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
		opts = {
			snippets = { preset = "luasnip" },
			-- ensure you have the `snippets` source (enabled by default)
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		appearance = {
			kind_icons = {
				Copilot = "",
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},
	},
}
