local set = vim.keymap.set
local fn = require "core.tool.git.functions"

fn.setup {
    on_attach = function(buf)
        -- ════════════════════════════════════════════════════════════════════════════
        -- Hunk
        -- ════════════════════════════════════════════════════════════════════════════
        set("n", "ghp", fn.preview_hunk, { buffer = buf })
        set("n", "ghr", fn.reset_hunk, { buffer = buf })
        set("v", "ghr", fn.reset_hunk_block, { buffer = buf })
        set("n", "ghR", fn.reset_buffer, { buffer = buf })
        set("n", "]h", fn.nav_next_hunk, { buffer = buf })
        set("n", "[h", fn.nav_prev_hunk, { buffer = buf })

        -- ════════════════════════════════════════════════════════════════════════════
        -- Blame
        -- ════════════════════════════════════════════════════════════════════════════
        set("n", "<M-y>", fn.toggle_blame, { buffer = buf })

        -- ════════════════════════════════════════════════════════════════════════════
        -- Show, find, search
        -- ════════════════════════════════════════════════════════════════════════════
        set("n", "<leader>gs", fn.show_status, { buffer = buf })
        set("n", "<leader>gb", fn.show_branches, { buffer = buf })
        set("n", "<leader>gd", fn.show_diff, { buffer = buf })
        set("n", "<leader>gS", fn.show_stash, { buffer = buf })
        set("n", "<M-S-g>", fn.show_log, { buffer = buf })
        set("n", "<M-g>", fn.show_file_log, { buffer = buf })
        set("v", "<M-g>", fn.show_line_log, { buffer = buf })
    end,
}
