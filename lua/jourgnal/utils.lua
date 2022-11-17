local c = require('jourgnal.config')
M = { }

function M.append_to_file(filename, line)
  local file = io.open(filename, 'a')
  if (file ~= nil) then
    file:write('\n' .. line)
  else
    print('ERROR, could not write to file ' .. file)
  end
  io.close(file)
end

function M.concat_if_not_empty(string1, string2, delim)
  local result = ''
  if (string2 and string.len(string2) > 0) then
    result = string1 .. delim .. string2
  else
    result = string1
  end
  return result
end

return M
