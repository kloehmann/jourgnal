-- public API
local conf = require('jourgnal.config')
local tasks = require('jourgnal.tasks')
local v = require('jourgnal.vim_helpers')

local M = { }

M.setup = function(config) conf.init(config) end

M.add_task_to_inbox = function()
  local title = v.request_input('Task title')
  local line = tasks.create_task(title)
  v.append_to_file(conf.inbox_file(), line)
end

M.toggle_task = function()
  local line = v.current_line()
  line = tasks.toggle_task_ticked(line)
  v.set_line(line)
end

M.add_task_here = function()
  local title = v.request_input('Task title')
  local line = tasks.create_task(title)
  v.prepend_line(line)
end

M.set_date = function()
  local line = v.current_line()
  local date = v.request_input('Date')
  line = tasks.set_date(line, date)
  v.set_line(line)

end

return M
