local fn = require "core.dev.marks.functions"
local set = vim.keymap.set

set("n", "m", fn.toggle_mark)
set("n", "<M-m>", fn.show_marks, { desc = "➜ Marks" })
