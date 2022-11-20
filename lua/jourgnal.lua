-- public API
local conf = require('jourgnal.config')
local tasks = require('jourgnal.tasks')
local v = require('jourgnal.vim_helpers')

local M = { }

M.setup = function(config) conf.init(config) end

M.toggle_task = function()
  local line = v.current_line()
  line = tasks.toggle_task_ticked(line)
  v.set_line(line)
end

M.add_task_to_inbox = function(title)
  if (title:len() == 0) then
    title = v.request_input('Task title')
  end
  local line = tasks.create_task(title, 0)
  v.append_to_file(conf.inbox_file(), line)
end

M.add_task = function(title)
  if (title:len() == 0) then
    title = v.request_input('Task title')
  end
  local current_line = v.current_line()
  local level = tasks.task_level(current_line)
  local line = tasks.create_task(title, level)
  v.append_line(line)
end

M.add_subtask = function(title)
  if (title:len() == 0) then
    title = v.request_input('Subtask title')
  end
  local current_line = v.current_line()
  local level = tasks.task_level(current_line)
  local line = tasks.create_task(title, level+1)
  v.append_line(line)
end

M.set_date = function(date)
  local line = v.current_line()
  if (date:len() == 0) then
    date = v.request_input('Date')
  end
  line = tasks.set_date(line, date)
  v.set_line(line)
end

M.set_deadline = function(deadline)
  local line = v.current_line()
  if (deadline:len() == 0) then
    deadline = v.request_input('Deadline')
  end
  line = tasks.set_deadline(line, deadline)
  v.set_line(line)
end

M.set_tags = function(tags)
  local line = v.current_line()
  if (tags:len() == 0) then
    tags = v.request_input('Tags')
  end
  line = tasks.set_tags(line, tags)
  v.set_line(line)
end

M.set_status = function(tags)
  local line = v.current_line()
  if (tags:len() == 0) then
    status = v.request_input('Status')
  end
  line = tasks.set_status(line, status)
  v.set_line(line)
end

return M
