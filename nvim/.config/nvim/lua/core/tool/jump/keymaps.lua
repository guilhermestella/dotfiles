local set = vim.keymap.set
local fn = require "core.tool.jump.functions"

set("n", "f", fn.jump)
set("n", "F", fn.select)
