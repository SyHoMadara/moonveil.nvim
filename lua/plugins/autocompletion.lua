local snippet_trigger_text = ";"

return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		version = "*",
		dependencies = {
			{
				"saghen/blink.compat",
				opts = { impersonate_nvim_cmp = true },
			},
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
			-- "David-Kunz/cmp-npm",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = { vim.fn.stdpath("config") .. "/snippets" },
					})
				end,
			},
		},

		-- use a release tag to download pre-built binaries
		-- version = 'v0.*',
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = "cargo build --release",
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = {
				-- preset = 'C-l',
				-- ["<C-p>"] = { "scroll_documentation_up", "fallback" },
				-- ["<C-j>"] = { "scroll_documentation_down", "fallback" }
				["C-p"] = { "select_prev", "fallback" },
				["C-n"] = { "select_next", "fallback" },
				["<C-l>"] = { "select_and_accept", "fallback" },
				["<C-e>"] = { "cancel", "fallback" },
			},

			snippets = {
				preset = "luasnip",
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
					-- 'codecompanion',
					-- 'copilot',
				},
				-- cmdline = {},

				-- providers = {
				-- codecompanion = {
				--   name = "CodeCompanion",
				--   module = "codecompanion.providers.completion.blink",
				-- },
				-- copilot = {
				--   name = "copilot",
				--   module = "blink-copilot",
				--   opts = {
				--     max_completions = 3,
				--     max_attempts = 4,
				--   },
				--   score_offset = 100,
				--   async = true,
				--   transform_items = function(_, items)
				--     local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
				--     local kind_idx = #CompletionItemKind + 1
				--     CompletionItemKind[kind_idx] = "Copilot"
				--     for _, item in ipairs(items) do
				--       item.kind = kind_idx
				--     end
				--     return items
				--   end,
				-- },
				-- npm = {
				--   name = 'npm',
				--   module = 'blink.compat.source',
				--
				--   -- all blink.cmp source config options work as normal:
				--   -- score_offset = -3,
				--
				--   opts = {
				--     ignore = {},
				--     only_semantic_versions = false,
				--   },
				-- },
				-- }
			},

			completion = {
				trigger = {
					-- When true, will show the completion window after typing a trigger character
					show_on_trigger_character = true,
					-- When both this and show_on_trigger_character are true, will show the completion window
					-- when the cursor comes after a trigger character when entering insert mode
					show_on_insert_on_trigger_character = true,
					-- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
					-- the completion window when the cursor comes after a trigger character when
					-- entering insert mode/accepting an item
					show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
					-- or a function, similar to show_on_blocked_trigger_character
				},
				menu = {
					border = SyHoMadaraVim.ui.float.border,
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
						treesitter = {},
					},
				},

				-- experimental auto-brackets support
				accept = {
					auto_brackets = { enabled = false },
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					treesitter_highlighting = true,
					window = {
						border = SyHoMadaraVim.ui.float.border,
					},
				},

				ghost_text = {
					enabled = true,
				},
			},

			signature = {
				enabled = true,
				window = {
					border = SyHoMadaraVim.ui.float.border,
				},
			},
		},
		-- allows extending the enabled_providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },

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

	-- Auto parir
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				fast_wrap = {
					map = "<C-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					before_key = "h",
					after_key = "l",
					cursor_pos_before = true,
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					manual_position = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPre",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true, -- Auto close on trailing </
				},
				-- ADD THIS LINE to specify the file types
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"jsx",
					"tsx",
				},
			})
		end,
	},
}
