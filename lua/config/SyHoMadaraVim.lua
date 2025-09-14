local icons = require("utils.icons")

SyHoMadaraVim = {
  -- General
  colorscheme = "tokyonight", -- colorscheme name
  ui = {
    float = {
      border = "rounded", -- defutlt=rounded, none, single, double, solid, shadow
    }
  },
  minimal_mode = false, -- if true, disable some ui features
  icons = icons, -- icons table 
  leader_key = ",", -- defutlt leader key is ","
}

return SyHoMadaraVim
