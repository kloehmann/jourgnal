local t = require('test.assert')
local mock = require('test.mock')


-- imports
local tasks = require('jourgnal.task')


----------------------------------------------- Tests
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
