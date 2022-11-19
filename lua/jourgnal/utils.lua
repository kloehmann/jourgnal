M = { }

M.concat_if_not_empty = function(string1, string2, delim)
  local result = ''
  if (string2 and string.len(string2) > 0) then
    result = string1 .. delim .. string2
  else
    result = string1
  end
  return result
end

return M
