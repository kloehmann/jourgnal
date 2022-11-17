-- functions for handling tasks
local conf = require('jourgnal.config')
-- local functions

local match_pattern = '^.*- %[(.)%].*$'
local sub_pattern = '^(.*- %[)(.)(%].*)$'

local tick_val = function(line) return string.match(line, match_pattern) end
local tick_task = function(line) return string.gsub(line, sub_pattern, '%1' .. conf.task_tick_char() .. '%3') end
local untick_task = function(line) return string.gsub(line, sub_pattern, '%1 %3') end

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

return M
