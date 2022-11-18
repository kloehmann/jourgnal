-- public API
local utils = require('jourgnal.utils')
local conf = require('jourgnal.config')
local tasks = require('jourgnal.tasks')

local M = { }

M.setup = function(config) conf.init(config) end
M.add_task_to_inbox = function() tasks.add_task_to_inbox() end
M.toggle_task = function() tasks.toggle_tickmark() end
M.add_task_here = function() tasks.add_task_here() end

return M
