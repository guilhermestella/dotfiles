return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "echasnovski/mini.icons"
    },
    opts = {
        delay = 500,
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
        wk.setup(opts)
        wk.add({
            { "<leader>",  group = "General" },
            { "<leader>b", group = "Buffer" },
            { "<leader>f", group = "Find" },
            { "<leader>g", group = "Git" },
            { "<leader>h", group = "Hunk" },
            { "<leader>s", group = "Search" },
            { "<leader>S", group = "Scratch" },
            { "<leader>t", group = "Temp File" },
            { "g", group = "Goto" },
            { "ga", group = "Goto Calls" },
            { "[", group = "Previous" },
            { "]", group = "Next" },
        })
    end,
}
