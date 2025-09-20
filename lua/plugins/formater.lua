return {
  -- Formatter
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black", "ruff" },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { "rustfmt", lsp_format = "fallback" },
          -- Conform will run the first available formatter
          javascript = {"deno","prettierd", "prettier", stop_after_first = true },
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
            require("conform").format { lsp_format = "fallback" }
          end,
          { desc = "Format buffer" }
        ),
        -- format_on_save = {
        --   -- These options will be passed to conform.format()
        --   timeout_ms = 500,
        --   lsp_format = "fallback",
        -- },
      }
    end,
  },
  
}

