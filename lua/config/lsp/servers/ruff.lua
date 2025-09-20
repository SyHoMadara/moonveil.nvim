local M = {}

M.on_attach = function(client, _)
	if client.name == "ruff" then
		-- disable hover in favor of pyright
		client.server_capabilities.hoverProvider = false
	end
end

M.setting = {
	args = {
		"--ignore",
		"F821",
		"--ignore",
		"E402",
		"--ignore",
		"E722",
		"--ignore",
		"E712",
	},
}

return M
