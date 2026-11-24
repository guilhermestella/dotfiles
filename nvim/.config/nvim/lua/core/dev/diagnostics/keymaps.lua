local set = vim.keymap.set
local fn = require "core.dev.diagnostics.functions"

set("n", "<C-w>d", fn.open_diagnostic)
set("n", "[d", fn.goto_previous_diagnostic)
set("n", "]d", fn.goto_next_diagnostic)
set("n", "<M-p>", fn.show_buffer_diagnostics)
set("n", "<M-S-p>", fn.show_diagnostics)
