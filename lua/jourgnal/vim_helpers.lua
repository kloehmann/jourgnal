local api = vim.api
local fn = vim.fn
M = { }

M.append_to_file = function(filename, line)
  local file = io.open(filename, 'a')
  if (file ~= nil) then
    file:write('\n' .. line)
  else
    print('ERROR, could not write to file ' .. file)
  end
  io.close(file)
end

M.current_line = function()
  return api.nvim_get_current_line()
end

M.prepend_line = function(line)
  fn.append(fn.line('.')-1, line)
  fn.cursor(fn.line('.')-1, fn.col('.'))
end

M.set_line = function(line)
  api.nvim_set_current_line(line)
end

-- request input from user with given prompt
M.request_input = function(prompt)
  local input
  repeat
    input = fn.input(prompt .. ': ')
    print('')
  until (input ~= '')
  return input
end

return M
