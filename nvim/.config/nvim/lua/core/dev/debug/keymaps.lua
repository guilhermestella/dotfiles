local set = vim.keymap.set
local fn = require "core.dev.debug.functions"

-- ════════════════════════════════════════════════════════════════════════════
-- Run Test
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<leader>tf", fn.test_function, { desc = "➜ Test Function" })
set("n", "<leader>tF", fn.test_file, { desc = "➜ Test File" })

-- Key maps with F keys: M-F7 = <F19>, C-F7 = <F31>, C-F8 = <F32>
set("n", "<F31>", fn.toggle_conditional_breakpoint, { desc = "➜ Toggle Conditional Breakpoint" })
set("n", "<F32>", fn.toggle_breakpoint, { desc = "➜ Toggle Breakpoint" })

set("n", "<F9>", fn.continue, { desc = "➜ Continue" })
set("n", "<F8>", fn.step_over, { desc = "➜ Step Next" })
set("n", "<F7>", fn.step_into, { desc = "➜ Step Into" })
set("n", "<F19>", fn.step_out, { desc = "➜ Step Out" })

set({ "n", "v" }, "<M-e>", fn.eval, { desc = "➜ Evaluate" })
set("n", "<M-d>", fn.toggle_console, { desc = "➜ Console" })
set("n", "<M-D>", fn.toggle_debug, { desc = "➜ Console" })
