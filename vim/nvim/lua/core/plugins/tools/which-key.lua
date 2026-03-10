return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "echasnovski/mini.icons"
    },
    opts = {
        delay = 1000,
        preset = "helix",
        icons = {
            mappings = false,
            rules = false,
            breadcrumb = "»",
            separator = "",
        },
        win = {
            border = "rounded",
            padding = { 1, 2 },
        },
        plugins = {
            marks = false,
            registers = false,
            spelling = { enabled = false },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = false,
                nav = false,
                z = false,
                g = false
            }
        },
        -- Trick to show only my defined mappings
        filter = function(mapping) return mapping.desc ~= nil and vim.startswith(mapping.desc, "➜") end,
    },
    config = function(_, opts)
        local wk = require("which-key")
        local gitsigns = require("gitsigns")
        wk.setup(opts)
        wk.add({
            -- General
            { "<leader>", group = "General" },
            { "<leader>q", "<cmd>qa<cr>", desc = "➜ Quit" },
            { "<leader>?", function() wk.show({ global = false }) end, desc = "➜ Keymaps" },

            -- Buffer
            { "<leader>b", group = "Buffer" },
            { "<leader>bn", "<cmd>enew<cr>", desc = "➜ New" },

            -- Hunk
            { "<leader>h", group = "Hunk" },
            { "<leader>hp", function() gitsigns.preview_hunk() end, desc = "➜ Preview" },
            { "<leader>hr", function() gitsigns.reset_hunk() end, desc = "➜ Reset" },
            { "<leader>hr", function()
                                gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                            end, desc = "➜ Reset", mode = "v" },
            { "<leader>hR", function() gitsigns.reset_buffer() end, desc = "➜ Reset All" },

            -- Previous
            { "[", group = "Previous" },
            { "[b", "<cmd>bprevious<cr>", desc = "➜ Buffer" },
            { "[d", function()
                        vim.diagnostic.goto_prev({ float = { focusable = false } })
                    end, desc = "➜ Diagnostic" },
            { "[h", function() gitsigns.nav_hunk("prev") end, desc = "➜ Hunk" },

            -- Next
            { "]", group = "Next" },
            { "]b", "<cmd>bnext<cr>", desc = "➜ Buffer" },
            { "]d", function()
                        vim.diagnostic.goto_next({ float = { focusable = false } })
                    end, desc = "➜ Diagnostic" },
            { "]h", function() gitsigns.nav_hunk("next") end, desc = "➜ Hunk" },
        })
    end,
}
