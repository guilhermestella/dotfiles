-- ════════════════════════════════════════════════════════════════════════════
-- Create Scratch File
-- ════════════════════════════════════════════════════════════════════════════
local set = vim.keymap.set
local scratch = require "utils.scratch"

set("n", "<M-i>", scratch.new_scratch)
