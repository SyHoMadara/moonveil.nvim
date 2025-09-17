return {
  {
    "folke/noice.nvim",
    cond = (SyHoMadaraVim.minimal_mode == false),
    lazy = SyHoMadaraVim.minimal_mode,
    opts = {
      messages = { enabled = false },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
      },
      cmdline = {
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = SyHoMadaraVim.icons.nvim, lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$ ", lang = "bash" },
          lua = { pattern = "^:%s*lua%s+", icon = " ", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = " ", lang = "vim" },
        },
      },
          
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false,    -- use a classic bottom cmdline for search
        command_palette = true,   -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,       -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,   -- add a border to hover docs and signature help
      },
    }
  },
}
