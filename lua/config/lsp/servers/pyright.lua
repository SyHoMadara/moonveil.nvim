local M = {}

local on_attach_pyright = function(client, _)
	local on_attach_ts_ls = function(client, bufnr)
		vim.lsp.inlay_hint.enable(true, { bufnr })
		require("plugins.which-key.setup").attach_typescript(bufnr)
	end

	-- Disable all capabilities except hoverProvider
	-- client.server_capabilities.completionProvider = false
	-- client.server_capabilities.definitionProvider = false
	-- client.server_capabilities.typeDefinitionProvider = false
	-- client.server_capabilities.implementationProvider = false
	-- client.server_capabilities.referencesProvider = false
	-- client.server_capabilities.documentSymbolProvider = false
	-- client.server_capabilities.workspaceSymbolProvider = false
	-- client.server_capabilities.codeActionProvider = false
	-- client.server_capabilities.documentFormattingProvider = false
	-- client.server_capabilities.documentRangeFormattingProvider = false
	-- client.server_capabilities.renameProvider = false
	-- client.server_capabilities.signatureHelpProvider = false
	-- client.server_capabilities.documentHighlightProvider = false
	-- client.server_capabilities.foldingRangeProvider = false
	-- client.server_capabilities.semanticTokensProvider = false
	-- client.server_capabilities.declarationProvider = false
	-- client.server_capabilities.callHierarchyProvider = false
	-- client.server_capabilities.diagnosticProvider = false

	-- Enable hoverProvider
	client.server_capabilities.hoverProvider = true
end

M.capabilities = (function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
	return capabilities
end)()
M.settings = {
	python = {
		analysis = {
			useLibraryCodeForTypes = true,
			diagnosticSeverityOverrides = {
				reportUnusedVariable = "warning",
			},
			typeCheckingMode = "on", -- Set type-checking mode to off
			diagnosticMode = "off", -- Disable diagnostics entirely
		},
	},
}

M.on_attach = on_attach_pyright
return M
