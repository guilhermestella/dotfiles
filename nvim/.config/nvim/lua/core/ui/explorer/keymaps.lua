local set = vim.keymap.set
local fn = require "core.ui.explorer.functions"

set("n", "<M-q>", fn.focus_filesystem)
set("n", "<M-1>", fn.toggle_filesystem)
set("n", "<M-2>", fn.toggle_buffers)
set("n", "<M-3>", fn.toggle_git_status)
