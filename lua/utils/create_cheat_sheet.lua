Exract_chield_as_string = function(node, stack_trace)
	local out = ""
	if not stack_trace then
		stack_trace = {}
	end
	local st = vim.deepcopy(stack_trace)
	if Lenght(node._children) == 0 and node.keymap and node.keymap.desc and node.keymap.lhs then
		if #st == 0 then
			out = "## *\n"
		end
		out = out .. Trim(node.keymap.desc) .. " | " .. Trim(node.keymap.lhs) .. "\n"
		return out
	end
	if Lenght(node._children) == 0 and node.mapping and node.mapping.desc and node.mapping.lhs then
		if #st == 0 then
			out = "## *\n"
		end
		out = out .. Trim(node.mapping.desc) .. " | " .. Trim(node.mapping.lhs) .. "\n"
		return out
	end
	if Lenght(node._children) == 0 then
		return out
	end

	if not node.mapping or (node.mapping and not node.mapping.desc) then
		st[#st + 1] = "*"
	else
		st[#st + 1] = Trim(node.mapping.desc)
	end
	local begin = "## "
	for _, v in pairs(st) do
		begin = begin .. v .. " "
	end
	if node.mapping then
		out = begin .. "\n" .. Trim(node.mapping.desc) .. " | " .. Trim(node.mapping.lhs) .. "\n"
	else
		out = begin .. "\n"
	end
	for _, v in pairs(node._children) do
		local a = Exract_chield_as_string(v, st)
		out = out .. a
	end
	return out
end
Cheat_creatrot = function(opts)
	local present, wkb = pcall(require, "which-key.buf")
	if not present then
		return
	end
	local opt = opts or {}
	local mode = wkb.get({ update = opt.update or true })
	local node = mode.tree:find(opt.keys or {}, { expand = opt.expand or true })
	local file, err = io.open((opt.filepath or "/tmp/cheatsheet.txt"), "wb")
	if not file then
		P("Error opening file: " .. tostring(err))
		return
	end
  file:write(Exract_chield_as_string(node))
	file:close()
end

return Cheat_creatrot
