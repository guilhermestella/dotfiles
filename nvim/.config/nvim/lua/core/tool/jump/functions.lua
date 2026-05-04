local flash = require "flash"

local M = {}

function M.jump()
  flash.jump()
end

function M.select()
  flash.treesitter()
end

return M
