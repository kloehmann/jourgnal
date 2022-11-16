local utils = require('jourgnal.utils')

-- TODO next: remove this and load config values 
local inbox_file = 'inbox.md'

local function setup(parameters)
end

local function add_task_to_inbox()
  local task_title = ''
  repeat
   task_title = vim.fn.input('Task title: ')
   print('')
  until (task_title ~= '')
  local task_line = '- [ ] ' .. task_title
  utils.append_to_file(inbox_file, task_line)
end

return {
  add_task_to_inbox = add_task_to_inbox
}
