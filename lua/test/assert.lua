M = {}

-- assert strings have same length
function M.assert_equal_string_length(expected, actual)
  print(' Assert same length', expected, actual)
  assert(expected:len() == actual:len(), '  - FAIL, strings have different length')
  print("  - PASS")
end

-- assert values are equal
function M.assert_equals(expected, actual)
  print (' Assert equal', expected, actual)
  assert(expected == actual, '  - FAIL - Values do not match')
  print("  - PASS")
end

M.assert_nil = function(actual)
  print (' Assert nil', actual)
  assert(actual == nil, '  - FAIL - result is not nil')
  print('  - PASS')
end

M.assert_false = function(actual)
  print (' Assert false', actual)
  assert(actual == false, '  - FAIL - result is not false')
  print('  - PASS')
end

M.assert_true = function(actual)
  print (' Assert true')
  assert(actual == true, '  - FAIL - "' .. actual .. '" is not true')
  print('  - PASS')
end

-- assert no of differing characters in strings
function M.assert_char_diff(string1, string2, t_diffs)
  print(' Assert number of different characters')
  local diffs = 0
  for i = 1, string1:len() do
    local s1 = string1:sub(i,i)
    local s2 = string2:sub(i,i)
    if (s1 ~= s2) then
      diffs = diffs + 1
    end
  end
  assert(t_diffs == diffs, '  - FAIL - Number of differences does not match', t_diffs, diffs)
  print('  - PASS')

end

return M
