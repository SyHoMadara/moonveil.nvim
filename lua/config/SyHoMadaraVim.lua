local icons = require("utils.icons")


SyHoMadaraVim = {
	-- General
	colorscheme = "tokyonight", -- colorscheme name
	ui = {
		float = {
			border = "rounded", -- defutlt=rounded, none, single, double, solid, shadow
		},
	},
	code_mode = IS_CODING_MODE, -- if true, enable some coding related plugins and features
	minimal_mode = IS_MINIMAL, -- if true, disable some ui features
	icons = icons, -- icons table
	leader_key = ",", -- defutlt leader key is ","
	diagnostic = {
		virtual_text = true, -- enable virtual text for diagnostics
	},
	shownumber = true, -- show line number
	relativenumber = false, -- show relative line number
	plugins = {
		-- Make sure to reload nvim & "Update Plugins" after change
		ai = {
			codecompanion = {
				enabled = true,
			},
			copilot = {
				enabled = true,
			},
      avante = {
        enabled = false,
      }
		},
	},
}

vim.wo.number = SyHoMadaraVim.shownumber or true
vim.wo.relativenumber = SyHoMadaraVim.relativenumber or false
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'



return SyHoMadaraVim
