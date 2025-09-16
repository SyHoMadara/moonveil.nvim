function Trim(s)
    return s:match('^%s*(.*%S)') or ''
end

function Lenght(m)
  local count = 0
  for _ in pairs(m) do count = count + 1 end
  return count
end

