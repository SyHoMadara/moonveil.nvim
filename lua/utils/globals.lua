P = function(v)
	vim.print(v)
	return v
end

NP = function(v)
	local present, snacks = pcall(require, "snacks")
	if not present then
		return
	end
	snacks.notifier.notify(v, "debug")
end

OPTIONS = function (v)
  local o = {} 
  for k, val in pairs(v) do
    table.insert(o, k .. "=" .. tostring(val))
  end
  return table.concat(o, ", ")
end

PR = function(v)
	P(vim.inspect(v))
	return v
end

NPR = function(v)
	NP(vim.inspect(v))
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

GIT_CWD = function()
	return vim.fn.systemlist("git rev-parse --show-toplevel")[1] .. "/"
end
