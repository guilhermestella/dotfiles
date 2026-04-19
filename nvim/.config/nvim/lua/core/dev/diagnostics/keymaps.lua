local set = vim.keymap.set
local fn = require "core.dev.diagnostics.functions"

set("n", "<C-w>d", fn.open_diagnostic, { desc = "➜ Open Diagnostic" })
set("n", "[d", fn.goto_previous_diagnostic, { desc = "➜ Diagnostic" })
set("n", "]d", fn.goto_next_diagnostic, { desc = "➜ Diagnostic" })
set("n", "<M-p>", fn.show_buffer_diagnostics, { desc = "➜ Show Diagnostics" })
