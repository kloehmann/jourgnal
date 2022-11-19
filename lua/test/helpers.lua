M = {}


function M.init_mock(module)
  local mock = {}
  package.loaded[module] = mock
  return mock
end

return M
