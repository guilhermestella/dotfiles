local set = vim.keymap.set
local fn = require "core.diagnostics.functions"

set("n", "<C-w>d", fn.open_diagnostic, { desc = "➜ Open Diagnostic" })
set("n", "[d", fn.goto_previous_diagnostic, { desc = "➜ Previous Diagnostic" })
set("n", "]d", fn.goto_next_diagnostic, { desc = "➜ Next Diagnostic" })
set("n", "<M-p>", fn.show_buffer_diagnostics, { desc = "➜ Show Buffer Diagnostics" })
set("n", "<M-P>", fn.show_diagnostics, { desc = "➜ Show Diagnostics" })
