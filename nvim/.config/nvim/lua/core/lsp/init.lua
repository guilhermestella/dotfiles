-- order matters
require "core.lsp.plugins"
require "core.lsp.keymaps"

local lsps_path = vim.fn.stdpath "config" .. "/lua/core/lsp"
for _, module in ipairs(vim.fn.readdir(lsps_path)) do
  local path = lsps_path .. "/" .. module
  if vim.fn.isdirectory(path) == 1 then
    require("core.lsp." .. module)
  end
end
