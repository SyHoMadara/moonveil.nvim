local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
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
local lua_ls = require("config.lsp.servers.lua_ls")
vim.lsp.config("lua_ls",{
	capabilities = capabilities,
	handlers = handlers,
	on_attach = on_attach,
	settings = lua_ls.settings,
})

local pyright = require("config.lsp.servers.pyright")
vim.lsp.config("pyright", {
	capabilities = pyright.capabilities,
	handlers = handlers,
	on_attach = pyright.on_attach,
	settings = pyright.settings,
})

local ruff = require("config.lsp.servers.ruff")
vim.lsp.config("ruff", {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = ruff.on_attach,
  settings = ruff.settings,
})

