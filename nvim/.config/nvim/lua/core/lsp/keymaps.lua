local set = vim.keymap.set
local fn = require "core.lsp.functions"

-- ════════════════════════════════════════════════════════════════════════════
-- References
-- ════════════════════════════════════════════════════════════════════════════
set("n", "gd", fn.show_definitions, { desc = "➜ Goto definitions" })
set("n", "gD", fn.show_declarations, { desc = "➜ Goto declarations" })
set("n", "grr", fn.show_references, { desc = "➜ Goto related references" })
set("n", "<M-f>", fn.show_references, { desc = "➜ Goto related references" })
set("n", "gri", fn.show_implementations, { desc = "➜ Goto related implementations" })
set("n", "grt", fn.show_type_definitions, { desc = "➜ Goto related types" })

-- ════════════════════════════════════════════════════════════════════════════
-- Refactor
-- ════════════════════════════════════════════════════════════════════════════
set({ "n", "v" }, "<C-M-m>", fn.extract_method, { desc = "➜ Extract Method" })
set({ "n", "v" }, "<C-M-v>", fn.extract_variable, { desc = "➜ Extract Variable" })
set({ "n", "v" }, "<C-M-c>", fn.extract_constant, { desc = "➜ Extract Constant" })

set("n", "grn", fn.rename, { desc = "➜ Rename Symbol" })
set("n", "<F2>", fn.rename, { desc = "➜ Rename Symbol" })
set({ "n", "v" }, "gra", fn.actions, { desc = "➜ LSP Code Action" })
set({ "n", "v" }, "<M-CR>", fn.actions, { desc = "➜ LSP Code Action" })

-- ════════════════════════════════════════════════════════════════════════════
-- Test
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<leader>tm", fn.test_function, { desc = "➜ Test Method" })
set("n", "<leader>tc", fn.test_file, { desc = "➜ Test Method" })

-- ════════════════════════════════════════════════════════════════════════════
-- Other
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<C-M-o>", fn.organize_imports, { desc = "➜ Organize Imports" })
set("n", "K", fn.show_documentation, { desc = "➜ Show documentation" })
