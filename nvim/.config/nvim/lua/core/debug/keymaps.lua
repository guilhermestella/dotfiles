local set = vim.keymap.set
local fn = require "core.debug.functions"

-- ════════════════════════════════════════════════════════════════════════════
-- Run Test
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<leader>tf", fn.test_function)
set("n", "<leader>tF", fn.test_file)

-- Key maps with F keys: M-F7 = <F19>, C-F7 = <F31>, C-F8 = <F32>
set("n", "<F31>", fn.toggle_conditional_breakpoint)
set("n", "<F32>", fn.toggle_breakpoint)

set("n", "<F9>", fn.continue)
set("n", "<F8>", fn.step_over)
set("n", "<F7>", fn.step_into)
set("n", "<F19>", fn.step_out)

set({ "n", "v" }, "<M-e>", fn.eval)
set("n", "<M-d>", fn.toggle_console)
set("n", "<M-D>", fn.toggle_debug)
