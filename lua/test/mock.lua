M = {}

M.init_mock = function(module)
  local mock = {}
  package.loaded[module] = mock
  return mock
end

return M
