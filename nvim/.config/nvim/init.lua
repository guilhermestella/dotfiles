local plugin_path = vim.fn.stdpath "config" .. "/lua/plugins"
local plugin_files = vim.fn.glob(plugin_path .. "/*.lua", true, true)
for _, file in ipairs(plugin_files) do
  local plugin_name = file:match "lua/(.+).lua$"
  if plugin_name then
    require(plugin_name)
  end
end

require "core.dev"
require "core.tool"
require "core.ui"
