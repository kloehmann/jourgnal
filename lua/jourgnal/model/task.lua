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
local level_pattern = '^(%s*)- %[.%] .*$'

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

local task_level = function(line)
  local prespaces = string.match(line, level_pattern)
  local level = 0
  if (prespaces ~= nil and prespaces:len() > 1) then
    level = (prespaces:len() / 2) - (prespaces:len() % 2)
  end
  return level
end

M.task_ticked = function(line) return task_ticked(line) end
M.task_status = function(line) return task_status(line) end
M.task_title = function(line) return task_title(line) end
M.task_date = function(line) return task_date(line) end
M.task_deadline = function(line) return task_deadline(line) end
M.task_tags = function(line) return task_tags(line) end
M.task_level = function(line) return task_level(line) end

-- Task class
M.Task = {
  ticked = false,
  status = '',
  title = '',
  date = '',
  deadline = '',
  tags = '',
  parent = nil,
  subtasks = {},
  level = 0
}

function M.Task:new(title)
  local o = {}
  setmetatable(o, self)
  self.__index = self

  self.ticked = false
  self.status = conf.default_status()
  self.title = title
  self.date = conf.default_date():len() > 0 and string.format('<%s>', conf.default_date())
  self.deadline = conf.default_deadline():len() > 0 and string.format('[%s]', conf.default_deadline())
  self.tags = conf.default_tags()
  self.parent = nil
  self.subtasks = {}
  self.level = 0
  return o
end

function M.Task:from_line(line)
  local o = {}
  setmetatable(o, self)
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

function M.Task:to_line()
  local task_line = ''
  for _ = 1, self.level, 1 do
    task_line = task_line .. '  '
  end
  task_line = task_line .. '- ['
  local tick_char = self.ticked and conf.tick_char() or ' '
  task_line = u.concat_if_not_empty(task_line, tick_char, '')
  task_line = u.concat_if_not_empty(task_line, '] ', '')
  task_line = u.concat_if_not_empty(task_line, self.status, '')
  if (self.status:len() > 0) then
    task_line = task_line .. ' '
  end
  task_line = u.concat_if_not_empty(task_line, self.title, '')
  task_line = u.concat_if_not_empty(task_line, self.date, ' ')
  task_line = u.concat_if_not_empty(task_line, self.deadline, ' ')
  task_line = u.concat_if_not_empty(task_line, self.tags, ' ')
  return task_line
end

function M.Task:toggle_ticked()
  self.ticked = not self.ticked
end

function M.Task:set_date(date)
  if (date ~= '') then
    self.date = string.format('<%s>', date)
  else
    self.date = date
  end
end

function M.Task:set_deadline(deadline)
  if (deadline ~= '') then
    self.deadline = string.format('[%s]',deadline)
  else
    self.deadline = deadline
  end
end

function M.Task:set_tags(tags)
  self.tags = tags
end

function M.Task:set_status(status)
  self.status = status
end

function M.Task:set_level(level)
  self.level = level
end

return M
