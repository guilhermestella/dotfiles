local set = vim.keymap.set
local fn = require "core.dev.lsp.functions"

-- ════════════════════════════════════════════════════════════════════════════
-- References
-- ════════════════════════════════════════════════════════════════════════════
set("n", "gd", fn.show_definitions)
set("n", "grr", fn.show_references)
set("n", "gri", fn.show_implementations)
set("n", "grt", fn.show_type_definitions)
set("n", "<M-f>", fn.toggle_find)

-- ════════════════════════════════════════════════════════════════════════════
-- Refactor
-- ════════════════════════════════════════════════════════════════════════════
set({ "n", "v" }, "<C-M-m>", fn.extract_method)
set({ "n", "v" }, "<C-M-v>", fn.extract_variable)
set({ "n", "v" }, "<C-M-c>", fn.extract_constant)

set("n", "grn", fn.rename)
set("n", "<F2>", fn.rename)
set({ "n", "v" }, "gra", fn.actions)
set({ "n", "v" }, "<M-CR>", fn.actions)

-- ════════════════════════════════════════════════════════════════════════════
-- Other
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<C-M-o>", fn.organize_imports)
set("n", "K", fn.show_documentation)
set("n", "<F1>", fn.toggle_inlay_hints)
