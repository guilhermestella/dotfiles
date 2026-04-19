local set = vim.keymap.set
local fn = require "core.dev.git.functions"

-- ════════════════════════════════════════════════════════════════════════════
-- Hunk
-- ════════════════════════════════════════════════════════════════════════════
set("n", "ghp", fn.preview_hunk, { desc = "➜ Preview" })
set("n", "ghr", fn.reset_hunk, { desc = "➜ Reset" })
set("v", "ghr", fn.reset_hunk_block, { desc = "➜ Reset" })
set("n", "ghR", fn.reset_buffer, { desc = "➜ Reset All" })
set("n", "]h", fn.nav_next_hunk, { desc = "➜ Hunk" })
set("n", "[h", fn.nav_prev_hunk, { desc = "➜ Hunk" })

-- ════════════════════════════════════════════════════════════════════════════
-- Blame
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<M-y>", fn.toggle_blame, { desc = "➜ Toggle Blame" })

-- ════════════════════════════════════════════════════════════════════════════
-- Show, find, search
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<leader>`", fn.show_status, { desc = "➜ Status" })
set("n", "<leader>gb", fn.show_branches, { desc = "➜ Branches" })
set("n", "<leader>gd", fn.show_diff, { desc = "➜ Diff (Hunks)" })
set("n", "<leader>gs", fn.show_stash, { desc = "➜ Stash" })
set("n", "<leader>gla", fn.show_log, { desc = "➜ Log All" })
set("n", "<leader>glf", fn.show_file_log, { desc = "➜ Log File" })
set("n", "<leader>gll", fn.show_line_log, { desc = "➜ Log Line" })
