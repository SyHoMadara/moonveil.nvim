local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local ufo_utils = require("utils._ufo")
local lspconfig = require("lspconfig")

mason_lsp.setup({

	ensure_installed = {
		-- "bashls",
		-- "cssls",
-- "eslint",
		-- "graphql",
		-- "html",
		-- "jsonls",
		"lua_ls",
		"pyright",
		"ruff",

		-- "prismals",
		-- "tailwindcss",
	},
})

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		silent = true,
		border = SyHoMadaraVim.ui.float.border or "rounded",
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = SyHoMadaraVim.ui.float.border or "rounded" }
	),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local function on_attach(client, bufnr)
	vim.lsp.inlay_hint.enable(true, { bufnr })
end
-- Config lsp
-- vim.lsp.config("lua_ls").setup({
-- 	capabilities = capabilities,
-- 	handlers = handlers,
-- 	on_attach = on_attach,
-- 	settings = require("config.lsp.servers.lua_ls").settings,
-- })
-- Global override for floating preview border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or SyHoMadaraVim.ui.float.border or "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
--
--
-- -- Config lsp
-- vim.lsp.config("lua_ls").setup({
-- 	capabilities = capabilities,
-- 	handlers = handlers,
-- 	on_attach = on_attach,
-- 	settings = require("config.lsp.servers.lua_ls").settings,
-- })
--

-- require("mason-lspconfig").setup_handlers {
--   -- The first entry (without a key) will be the default handler
--   -- and will be called for each installed server that doesn't have
--   -- a dedicated handler.
--   function(server_name)
--     require("lspconfig")[server_name].setup {
--       on_attach = on_attach,
--       capabilities = capabilities,
--       handlers = handlers,
--     }
--   end,
--
--    ["lua_ls"] = function()
--     lspconfig.lua_ls.setup({
--       capabilities = capabilities,
--       handlers = handlers,
--       on_attach = on_attach,
--       settings = require("config.lsp.servers.lua_ls").settings,
--     })
--   end,
--
-- }

-- require("ufo").setup({
--   fold_virt_text_handler = ufo_config_handler,
--   close_fold_kinds_for_ft = { default = { "imports" } },
-- })
