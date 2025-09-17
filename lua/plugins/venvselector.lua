return {
  -- Python Virtual Environment Selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "main", -- This is the regexp branch, use this for the new version
    keys = {
      { "<leader>vn", "<cmd>VenvSelect<cr>" },
    },
    opts = {
      -- Your settings go here
      stay_on_this_version = true,
    },
  },
}
