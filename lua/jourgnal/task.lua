-- for handling tasks
local t = require('jourgnal.model.task')

M = {}

M.toggle_task_ticked = function(line)
  line = line
  local task = t.Task:from_line(line)
  assert(task, 'Current line is not a task')
  task:toggle_ticked()
  return task:to_line()
end

M.create_task = function(title, level)
  local task = t.Task:new(title)
  assert(task, "Task could not be created")
  level = level or 0
  task:set_level(level)
  return task:to_line()
end

M.set_date = function(line, date)
  local task = t.Task:from_line(line)
  assert(task, "Current line is not a task")
  task:set_date(date)
  return task:to_line()
end

M.set_deadline = function(line, deadline)
  local task = t.Task:from_line(line)
  assert(task, "Current line is not a task")
  task:set_deadline(deadline)
  return task:to_line()
end

M.set_status = function(line, status)
  local task = t.Task:from_line(line)
  assert(task, "Current line is not a task")
  task:set_status(status)
  return task:to_line()
end

M.set_tags = function(line, tags)
  local task = t.Task:from_line(line)
  assert(task, "Current line is not a task")
  task:set_tags(tags)
  return task:to_line()
end


return M

