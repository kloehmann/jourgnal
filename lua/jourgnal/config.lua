-------------------------------------------------------- local variables

local c = {                 -- default config, will be overriden by user config

  org_root = os.getenv('HOME') .. '/org', -- root direcotory for orgfiles use os.getenv instead of tilde - will only be sanitized on external config
  inbox_file_dir = '00_inbox',            -- directory to be used as inbox
  file_extension = 'md',                  -- file extension for files, md is recommended
  index_file_name = '00_index',           -- name of index file in all directories
  default_tags = '',                      -- default tags to be assigned to task
  default_status = '',                    -- default status to be assigned to task
  default_deadline = '',                  -- default deadline to be assigned to task
  default_date = '',                      -- default date to be assigned to task
  tick_char = 'x'                -- character to indicate a task as completed
}

------------------------------------------------------- local functions

local _full_file_path = function(reldir, filename)
  return c.org_root .. '/' .. reldir .. '/' .. filename .. '.' .. c.file_extension
end

-- replace leading tilde with canonical path, lua does not like tilde
local _sanitize_org_root = function()
  if (string.sub(c.org_root, 1, 1) == '~') then
    c.org_root = os.getenv('HOME') .. string.sub(c.org_root, 2, string.len(c.org_root))
  end
end

------------------------------------------------------ global functions

M = { }

M.init = function(config)
  for key, _ in pairs(c) do
    if (config and config[key]) then
      c[key] = config[key]
    end
  end
  _sanitize_org_root()
end


M.inbox_file = function()
  return _full_file_path(c.inbox_file_dir, c.index_file_name)
end

M.default_status = function() return c.default_status end
M.default_date = function() return c.default_date end
M.default_deadline = function() return c.default_deadline end
M.default_tags = function() return c.default_tags end
M.tick_char = function() return c.tick_char end

return M
