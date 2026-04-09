-- ════════════════════════════════════════════════════════════════════════════
-- Create Scratch File
-- ════════════════════════════════════════════════════════════════════════════
local set = vim.keymap.set
local fn = require "core.scratch.functions"

set("n", "<M-i>", fn.new_scratch)
