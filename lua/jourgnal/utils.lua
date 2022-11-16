local function append_to_file(filename, line)
  local file = io.open(filename, 'a')
  if (file ~= nil) then
    file:write('\n' .. line)
  else
    print('ERROR, could not write to file ' .. file)
  end
  io.close(file)
end

return {
  append_to_file = append_to_file
}
