-- public API
local utils = require('jourgnal.utils')
local conf = require('jourgnal.config')
local tasks = require('jourgnal.tasks')
local inbox = require('jourgnal.inbox')

local M = { }

M.setup = function(config) conf.init(config) end
M.add_task_to_inbox = function() inbox.add_task_to_inbox() end
M.toggle_task = function() tasks.toggle_tickmark() end

return M
