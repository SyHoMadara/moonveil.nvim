return {
  {
    "nvzone/minty",
    lazy = false,
    cmd = { "Shades", "Huefy" },
    config = function()
      require("minty").setup({
        vim.keymap.set(
          {"n", "v"},
          "<leader>cts",
          function()
            require("minty.shades").open()
          end,
          { desc = "Open Shades" }
        ),
        vim.keymap.set(
          {"n", "v"},
          "<leader>ctt",
          function()
            require("minty.huefy").open()
          end,
          { desc = "Open huefy" }
        )
      })
    end,
  }

	-- {
	-- 	"nvchad/ui",
	-- 	config = function()
	-- 		require("nvchad")
	-- 	end,
	-- },
}
