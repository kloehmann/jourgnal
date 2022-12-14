local h = require('test.helpers')
local t = require('test.assert')
local test_data = require('test.tasks_data')

-- mocks
local config_mock = h.init_mock('jourgnal.config')
config_mock.tick_char = function() return 'x' end

-- imports
local tasks = require('jourgnal.tasks')

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

M.test_toggle_task_ticked_tick = function()
  print('----------------- Test Task Tick -----------------')
  -- GIVEN
  local line = '- [ ] Something to do'
  --WHEN
  local actual = tasks.toggle_task_ticked(line)
  --THEN
  local expected = '- [x] Something to do'
  t.assert_equals(expected, actual)
end

M.test_toggle_task_ticked_untick = function()
  print('----------------- Test Task Untick -----------------')
  -- GIVEN
  local line = '- [x] Something to do'
  --WHEN
  local actual = tasks.toggle_task_ticked(line)
  --THEN
  local expected = '- [ ] Something to do'
  t.assert_equals(expected, actual)
end

M.test_create_task = function()
  print('----------------- Test Create Task -----------------')
  -- GIVEN
  local title = 'Some title'
  config_mock.default_status = function() return 'TODO' end
  config_mock.default_date = function() return '2022-01-01' end
  config_mock.default_deadline = function() return '2022-01-12' end
  config_mock.default_tags = function() return ':test:' end
  --WHEN
  local actual = tasks.create_task(title)
  --THEN
  local expected = '- [ ] TODO Some title <2022-01-01> [2022-01-12] :test:'
  t.assert_equals(expected, actual)
end

M.test_set_date_add_date = function()
  print('----------------- Test Add Date -----------------')
  -- GIVEN
  local line = '- [ ] Foo'
  local date = '2022-02-11'
  --WHEN
  local actual = tasks.set_date(line, date)
  --THEN
  local expected = '- [ ] Foo <2022-02-11>'
  t.assert_equals(expected,actual)
end

M.test_set_date_set_date = function()
  print('----------------- Test Set Date -----------------')
  -- GIVEN
  local line = '- [ ] Foo <2022-11-22>'
  local date = '2022-02-11'
  --WHEN
  local actual = tasks.set_date(line, date)
  --THEN
  local expected = '- [ ] Foo <2022-02-11>'
  t.assert_equals(expected,actual)
end

M.test_set_deadline_add_deadline = function()
  print('----------------- Test Add Deadline-----------------')
  -- GIVEN
  local line = '- [ ] Foo'
  local deadline = '2022-02-11'
  --WHEN
  local actual = tasks.set_deadline(line,deadline)
  --THEN
  local expected = '- [ ] Foo [2022-02-11]'
  t.assert_equals(expected,actual)
end

M.test_set_deadline_set_deadline = function()
  print('----------------- Test Set Deadline-----------------')
  -- GIVEN
  local line = '- [ ] Foo [2022-11-22]'
  local deadline= '2022-02-11'
  --WHEN
  local actual = tasks.set_deadline(line, deadline)
  --THEN
  local expected = '- [ ] Foo [2022-02-11]'
  t.assert_equals(expected,actual)
end

M.test_set_status_add_status = function()
  print('----------------- Test Add Status -----------------')
  -- GIVEN
  local line = '- [ ] Foo'
  local status = 'TODO'
  --WHEN
  local actual = tasks.set_status(line,status)
  --THEN
  local expected = '- [ ] TODO Foo'
  t.assert_equals(expected,actual)
end

M.test_set_status_set_status = function()
  print('----------------- Test Set Status -----------------')
  -- GIVEN
  local line = '- [ ] WAITING Foo'
  local status = 'TODO'
  --WHEN
  local actual = tasks.set_status(line, status)
  --THEN
  local expected = '- [ ] TODO Foo'
  t.assert_equals(expected,actual)
end

M.test_set_tags_add_tags = function()
  print('----------------- Test Add Tags -----------------')
  -- GIVEN
  local line = '- [ ] Foo'
  local tags = ':foo:bar:'
  --WHEN
  local actual = tasks.set_tags(line,tags)
  --THEN
  local expected = '- [ ] Foo :foo:bar:'
  t.assert_equals(expected,actual)
end

M.test_set_tags_set_tags = function()
  print('----------------- Test Set Tags -----------------')
  -- GIVEN
  local line = '- [ ] Foo :yo:lo:'
  local tags = ':foo:bar:'
  --WHEN
  local actual = tasks.set_tags(line, tags)
  --THEN
  local expected = '- [ ] Foo :foo:bar:'
  t.assert_equals(expected,actual)
end



print('=========================== Tasks ======================')
M.test_status_pattern()
M.test_ticked_pattern()
M.test_date_pattern()
M.test_deadline_pattern()
M.test_title_pattern()
M.test_level()
M.test_toggle_task_ticked_tick()
M.test_toggle_task_ticked_untick()
M.test_create_task()
M.test_set_date_add_date()
M.test_set_date_set_date()
M.test_set_deadline_add_deadline()
M.test_set_deadline_set_deadline()
M.test_set_status_add_status()
M.test_set_status_set_status()
M.test_set_tags_add_tags()
M.test_set_tags_set_tags()




return M
