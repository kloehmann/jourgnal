local m = require('test.mock')
local t = require('test.assert')
local test_data = require('test.task_data')

-- mocks
local config_mock = m.init_mock('jourgnal.config')
config_mock.tick_char = function() return 'x' end

-- imports
local tasks = require('jourgnal.model.task')

-- Status Pattern
local test_status_pattern = function(line, expected)
  -- GIVEN
  -- WHEN
  local actual = tasks.task_status(line)
  -- THEN
  t.assert_equal_string_length(expected, actual)
  t.assert_equals(expected, actual)
end

M.test_status_pattern = function()
  print('----------------- Test Status Pattern -----------------')
  for _, test_case in pairs(test_data) do
    print('-------- Test Case ', test_case['line'])
    test_status_pattern(test_case['line'], test_case['status'])
  end
end

-- Ticked Pattern
local test_ticked_pattern = function(line, expected)
  -- GIVEN
  -- WHEN
  local actual = tasks.task_ticked(line)
  -- THEN
  t.assert_equals(expected, actual)
end

M.test_ticked_pattern = function()
  print('----------------- Test Ticked Pattern -----------------')
  for _, test_case in pairs(test_data) do
    print('-------- Test Case ', test_case['line'])
    test_ticked_pattern(test_case['line'], test_case['ticked'])
  end
end

-- Date Pattern
local test_date_pattern = function(line, expected)
  -- GIVEN
  -- WHEN
  local actual = tasks.task_date(line)
  -- THEN
  t.assert_equals(expected, actual)
end

M.test_date_pattern = function()
  print('----------------- Test Date Pattern -----------------')
  for _, test_case in pairs(test_data) do
    print('-------- Test Case ', test_case['line'])
    test_date_pattern(test_case['line'], test_case['date'])
  end
end

-- Deadline Pattern
local test_deadline_pattern = function(line, expected)
  -- GIVEN
  -- WHEN
  local actual = tasks.task_deadline(line)
  -- THEN
  t.assert_equals(expected, actual)
end

M.test_deadline_pattern = function()
  print('----------------- Test Deadline Pattern -----------------')
  for _, test_case in pairs(test_data) do
    print('-------- Test Case ', test_case['line'])
    test_deadline_pattern(test_case['line'], test_case['deadline'])
  end
end

-- Tags Pattern
local test_tags_pattern = function(line, expected)
  -- GIVEN
  -- WHEN
  local actual = tasks.task_tags(line)
  -- THEN
  t.assert_equals(expected, actual)
end

M.test_deadline_pattern = function()
  print('----------------- Test Tags Pattern -----------------')
  for _, test_case in pairs(test_data) do
    print('-------- Test Case ', test_case['line'])
    test_tags_pattern(test_case['line'], test_case['tags'])
  end
end

-- Title Pattern
local test_title_pattern = function(line, expected)
  -- GIVEN
  -- WHEN
  local actual = tasks.task_title(line)
  -- THEN
  t.assert_equals(expected, actual)
end

M.test_title_pattern = function()
  print('----------------- Test Title Pattern -----------------')
  for _, test_case in pairs(test_data) do
    print('-------- Test Case ', test_case['line'])
    test_title_pattern(test_case['line'], test_case['title'])
  end
end

-- Level
local test_level = function(line, expected)
  -- GIVEN
  -- WHEN
  local actual = tasks.task_level(line)
  -- THEN
  t.assert_equals(expected, actual)
end

M.test_level = function()
  print('----------------- Test Level -----------------')
  for _, test_case in pairs(test_data) do
    print('-------- Test Case ', test_case['line'])
    test_level(test_case['line'], test_case['level'])
  end
end

print('=========================== Task Model ======================')
M.test_status_pattern()
M.test_ticked_pattern()
M.test_date_pattern()
M.test_deadline_pattern()
M.test_title_pattern()
M.test_level()

return M
