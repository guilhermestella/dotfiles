local set = vim.keymap.set
local fn = require "core.tool.git.functions"

fn.setup {
  on_attach = function(buf)
    -- ════════════════════════════════════════════════════════════════════════════
    -- Hunk
    -- ════════════════════════════════════════════════════════════════════════════
    set("n", "ghp", fn.preview_hunk, { buffer = buf, desc = "➜ Preview" })
    set("n", "ghr", fn.reset_hunk, { buffer = buf, desc = "➜ Reset" })
    set("v", "ghr", fn.reset_hunk_block, { buffer = buf, desc = "➜ Reset" })
    set("n", "ghR", fn.reset_buffer, { buffer = buf, desc = "➜ Reset All" })
    set("n", "]h", fn.nav_next_hunk, { buffer = buf, desc = "➜ Hunk" })
    set("n", "[h", fn.nav_prev_hunk, { buffer = buf, desc = "➜ Hunk" })

    -- ════════════════════════════════════════════════════════════════════════════
    -- Blame
    -- ════════════════════════════════════════════════════════════════════════════
    set("n", "<M-y>", fn.toggle_blame, { buffer = buf, desc = "➜ Toggle Blame" })

    -- ════════════════════════════════════════════════════════════════════════════
    -- Show, find, search
    -- ════════════════════════════════════════════════════════════════════════════
    set("n", "<leader>`", fn.show_status, { buffer = buf, desc = "➜ Status" })
    set("n", "<leader>gb", fn.show_branches, { buffer = buf, desc = "➜ Branches" })
    set("n", "<leader>gd", fn.show_diff, { buffer = buf, desc = "➜ Diff (Hunks)" })
    set("n", "<leader>gs", fn.show_stash, { buffer = buf, desc = "➜ Stash" })
    set("n", "<leader>gla", fn.show_log, { buffer = buf, desc = "➜ Log All" })
    set("n", "<leader>glf", fn.show_file_log, { buffer = buf, desc = "➜ Log File" })
    set("n", "<leader>gll", fn.show_line_log, { buffer = buf, desc = "➜ Log Line" })
  end,
}
