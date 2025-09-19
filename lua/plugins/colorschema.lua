return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[colorscheme tokyonight]])
			vim.cmd("colorscheme " .. SyHoMadaraVim.colorscheme)
			require("config.colorscheme")
		end,
	},
	{
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        style = "dark",
        transparent = false,
        italic_comments = true,
        underline_links = true,
        disable_nvimtree_bg = true,
      })
      require("vscode").load()

      -- Python Highlights (unchanged from your setup)
      vim.api.nvim_set_hl(0, "@keyword.python", { fg = "#FF79C6", bold = true })
      vim.api.nvim_set_hl(0, "@function.python", { fg = "#DCDCAA", italic = true })
      vim.api.nvim_set_hl(0, "@parameter.python", { fg = "#9CDCFE", italic = true })
      vim.api.nvim_set_hl(0, "@type.python", { fg = "#4EC9B0", bold = true })
      vim.api.nvim_set_hl(0, "@string.python", { fg = "#CE9178" })
      vim.api.nvim_set_hl(0, "@number.python", { fg = "#B5CEA8" })
      vim.api.nvim_set_hl(0, "@operator.python", { fg = "#D4D4D4" })
      vim.api.nvim_set_hl(0, "@variable.python", { fg = "#9CDCFE" })
      vim.api.nvim_set_hl(0, "@field.python", { fg = "#9CDCFE" })
      vim.api.nvim_set_hl(0, "@comment.python", { fg = "#6A9955", italic = true })
      vim.api.nvim_set_hl(0, "@function.builtin.python", { fg = "#D7BA7D", bold = true })

     ---------------------------------------------------------------------------
      -- JSX/TSX Tags (colorize opening/closing tags and attributes)
      ---------------------------------------------------------------------------
      -- Regular tags <div>, <span>, etc.
      vim.api.nvim_set_hl(0, "@tag", { fg = "#569CD6", bold = true })
      -- Tag delimiters (<, />, </>, etc.)
      vim.api.nvim_set_hl(0, "@tag.delimiter", { bg = "#53327a" })
      
      -- Custom colors for opening tags like <a>, <button>, <img>, etc.
      vim.api.nvim_set_hl(0, "@tag.special", { fg = "#FF79C6" })

      -- Closing tags like </div>, </span>, etc. (with italic style)
      vim.api.nvim_set_hl(0, "@tag.end", { fg = "#D4D4D4", italic = true })

      -- JSX Props (attributes like `className`, `onClick`, etc.)
      vim.api.nvim_set_hl(0, "@tag.attribute", { fg = "#9CDCFE", italic = true })

      -- React-specific tags (like <React.Fragment>)
      vim.api.nvim_set_hl(0, "@tag.name.special", { fg = "#4EC9B0" })

      -- Custom JSX tag colors
      vim.api.nvim_set_hl(0, "@tag.div",    { fg = "#569CD6", bold = true })   -- div
      vim.api.nvim_set_hl(0, "@tag.builtin",      { fg = "#735bd5", bold = true })   -- a
      vim.api.nvim_set_hl(0, "@tag.button", { fg = "#FFD700", bold = true })   -- button
      vim.api.nvim_set_hl(0, "@tag.p",      { fg = "#98C379", bold = true })   -- p
      vim.api.nvim_set_hl(0, "@markup.heading.1",     { fg = "#FF8800", bold = true })   -- h1


      ---------------------------------------------------------------------------
      -- Strings & Expressions inside JSX (like { count })
      ---------------------------------------------------------------------------
      -- Strings inside JSX tags
      vim.api.nvim_set_hl(0, "@string", { fg = "#CE9178" })
      -- Punctuation brackets used in expressions (like {})
      vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#D4D4D4" })
      ---------------------------------------------------------------------------
      -- General UI Highlights
      ---------------------------------------------------------------------------
      vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#ffcc00" })
      vim.api.nvim_set_hl(0, "TermCursor", { fg = "#000000", bg = "#ffcc00" })
      vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
      vim.opt.termguicolors = true
      vim.opt.cursorline = true
    end
  },
  -- {
  --   'mhartington/oceanic-next',
  --   lazy = false,
  --   priority = 1000,
  -- }
}
