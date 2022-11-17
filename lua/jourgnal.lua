-- public API
local utils = require('jourgnal.utils')
local conf = require('jourgnal.config')
local tasks = require('jourgnal.tasks')

local M = { }

function M.setup(config)
  conf.init(config)
end

-- TODO move this into a module and create a wrapper function 
function M.add_task_to_inbox()
  local task_title = ''
  repeat
    task_title = vim.fn.input('Task title: ')
    print('')
  until (task_title ~= '')
  local task_line = '- [ ]'
  task_line = utils.concat_if_not_empty(task_line, conf.default_status(), ' ')
  task_line = utils.concat_if_not_empty(task_line, task_title, ' ')
  task_line = utils.concat_if_not_empty(task_line, conf.default_when(), ' ')
  task_line = utils.concat_if_not_empty(task_line, conf.default_deadline(), ' ')
  task_line = utils.concat_if_not_empty(task_line, conf.default_tags(), ' ')
  utils.append_to_file(conf.inbox_file(), task_line)
end


function M.toggle_task()
  tasks.toggle_tickmark()
end

return M
