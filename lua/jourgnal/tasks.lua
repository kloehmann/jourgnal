-- functions for handling tasks
local conf = require('jourgnal.config')
local utils = require('jourgnal.utils')
local fn = vim.fn
-- local functions

local match_pattern = '^.*- %[(.)%].*$'
local sub_pattern = '^(.*- %[)(.)(%].*)$'

local tick_val = function(line) return string.match(line, match_pattern) end
local tick_task = function(line) return string.gsub(line, sub_pattern, '%1' .. conf.task_tick_char() .. '%3') end
local untick_task = function(line) return string.gsub(line, sub_pattern, '%1 %3') end

local function task_input()
  local task_title = ''
  repeat
    task_title = fn.input('Task title: ')
    print('')
  until (task_title ~= '')
  local task_line = '- [ ]'
  task_line = utils.concat_if_not_empty(task_line, conf.default_status(), ' ')
  task_line = utils.concat_if_not_empty(task_line, task_title, ' ')
  task_line = utils.concat_if_not_empty(task_line, conf.default_when(), ' ')
  task_line = utils.concat_if_not_empty(task_line, conf.default_deadline(), ' ')
  task_line = utils.concat_if_not_empty(task_line, conf.default_tags(), ' ')
  return task_line
end
-- global functions
M = {}

function M.toggle_tickmark()
  local line = vim.api.nvim_get_current_line()
  local ticked = tick_val(line)
  if (ticked and ticked == ' ') then
    line = tick_task(line)
  else
    line = untick_task(line)
  end
  vim.api.nvim_set_current_line(line)
end

function M.add_task_to_inbox()
  local task_line = task_input()
  utils.append_to_file(conf.inbox_file(), task_line)
end

function M.add_task_here()
  local task_line = task_input()
  fn.append(fn.line('.')-1,task_line)
  fn.cursor(fn.line('.')-1, fn.col('.'))
end

return M

