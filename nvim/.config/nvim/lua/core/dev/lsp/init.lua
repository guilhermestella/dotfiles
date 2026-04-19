require "core.dev.lsp.plugins"
require "core.dev.lsp.keymaps"

local lsps_path = vim.fn.stdpath "config" .. "/lua/core/dev/lsp"
for _, module in ipairs(vim.fn.readdir(lsps_path)) do
  local path = lsps_path .. "/" .. module
  if vim.fn.isdirectory(path) == 1 then
    require("core.dev.lsp." .. module)
  end
end
