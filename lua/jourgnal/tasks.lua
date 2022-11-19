-- for handling tasks
local conf = require('jourgnal.config')
local u = require('jourgnal.utils')

M = {}

--------------------------------------------------------------- local functions
-- decomposing string into task parts
local tick_pattern = '^%s*-%s%[(.)%]%s+.*$' -- most generic pattern, used to check if this is a task
local title_pattern = '^%s*-%s%[.%]%s?%u*%s+(.*)$'
local title_ext_pattern = '^%s*-%s%[.%]%s?%u*%s+(.-)%s[<:%[].*$'
local date_pattern = '^%s*-.*%s(<.+>).*$'
local deadline_pattern = '^%s*-%s%[.%]%s+.+%s(%[.+%]).*$'
local tags_pattern = '^%s*-.*%s(:.+:)$'
local status_pattern = '^%s*- %[.%] (%u+%s).*$'

local task_ticked = function(line) -- will return nil if line is not a task
  local ticked = string.match(line, tick_pattern)
  if (ticked == nil) then
    return nil
  else
    return ticked ~= ' ' --string.gsub(line, tick_pattern, '%2') ~= ' '
  end
end

local task_status = function(line)
  local has_status = string.match(line, status_pattern)
  local status = has_status or ''
  return status:sub(1,-2)
end

local task_date = function(line)
  local has_date = string.match(line, date_pattern)
  local date = has_date or ''
  return date
end

local task_deadline = function(line)
  local has_deadline = string.match(line, deadline_pattern)
  local deadline = has_deadline or ''
  return deadline
end

local task_tags = function(line)
  local has_tags = string.match(line, tags_pattern)
  local tags = has_tags or ''
  return tags
end

local task_title = function(line)
  local has_title = string.match(line, title_ext_pattern)
  has_title = has_title or string.match(line, title_pattern)
  local title = has_title or ''
  return title
end

M.task_ticked = function(line) return task_ticked(line) end
M.task_status = function(line) return task_status(line) end
M.task_title = function(line) return task_title(line) end
M.task_date = function(line) return task_date(line) end
M.task_deadline = function(line) return task_deadline(line) end
M.task_tags = function(line) return task_tags(line) end

-- Task class
Task = {
  ticked = false,
  status = '',
  title = '',
  date = '',
  deadline = '',
  tags = ''
}

function Task:new(o, title)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.ticked = false
  self.status = conf.default_status()
  self.title = title
  self.date = conf.default_date():len() > 0 and string.format('<%s>', conf.default_date())
  self.deadline = conf.default_deadline():len() > 0 and string.format('[%s]', conf.default_deadline())
  self.tags = conf.default_tags()
  return o
end

function Task:from_line(o , line)
  o = o or {}
  setmetatable(o , self)
  self.__index = self

  local ticked = task_ticked(line)
  assert(ticked ~= nil, 'Line is not a task')
  self.ticked = ticked
  self.status = task_status(line) or nil
  self.title = task_title(line) or nil
  self.date = task_date(line) or nil
  self.deadline = task_deadline(line) or nil
  self.tags = task_tags(line) or nil
  return o
end

function Task:to_line()
  local task_line = '- ['
  local tick_char = self.ticked and conf.tick_char() or ' '
  task_line = u.concat_if_not_empty(task_line, tick_char, '')
  task_line = u.concat_if_not_empty(task_line, ']', '')
  task_line = u.concat_if_not_empty(task_line, self.status, ' ')
  task_line = u.concat_if_not_empty(task_line, self.title, ' ')
  task_line = u.concat_if_not_empty(task_line, self.date, ' ')
  task_line = u.concat_if_not_empty(task_line, self.deadline, ' ')
  task_line = u.concat_if_not_empty(task_line, self.tags, ' ')
  return task_line
end

function Task:toggle_ticked()
  self.ticked = not self.ticked
end

function Task:set_date(date)
  self.date = string.format('<%s>', date)
end

function Task:set_deadline(deadline)
  self.deadline = string.format('[%s]',deadline)
end

function Task:set_tags(tags)
  self.tags = tags
end

function Task:set_status(status)
  self.status = status
end

-------------------------------------------------------------- global functions

M.toggle_task_ticked = function(line)
  line = line
  local task = Task:from_line(nil, line)
  assert(task, 'Current line is not a task')
  task:toggle_ticked()
  return task:to_line()
end

M.create_task = function(title)
  local task = Task:new(nil, title)
  assert(task, "Task could not be created")
  return task:to_line()
end

M.set_date = function(line, date)
  local task = Task:from_line(nil, line)
  assert(task, "Current line is not a task")
  task:set_date(date)
  return task:to_line()
end

M.set_deadline = function(line, deadline)
  local task = Task:from_line(nil, line)
  assert(task, "Current line is not a task")
  task:set_deadline(deadline)
  return task:to_line()
end

M.set_status = function(line, status)
  local task = Task:from_line(nil, line)
  assert(task, "Current line is not a task")
  task:set_status(status)
  return task:to_line()
end

M.set_tags = function(line, tags)
  local task = Task:from_line(nil, line)
  assert(task, "Current line is not a task")
  task:set_tags(tags)
  return task:to_line()
end


return M

