return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                { section = "keys",   gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
        explorer = { enabled = true },
        indent = { enabled = false },
        input = { enabled = true },
        notifier = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                buffers = {
                    win = {
                        input = {
                            keys = {
                                ["<c-d>"] = { "bufdelete", mode = { "i", "n" } },
                            }
                        }
                    }
                }
            }

        },
        quickfile = { enabled = true },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = {
            enabled = true,
            left = { "mark", "sign" },
            right = { "fold", "git" },
            folds = {
                open = false,
                git_hl = false,
            },
            git = {
                patterns = { "GitSign", "MiniDiffSign" },
            },
            refresh = 50,
        },
        words = { enabled = true },
        toggle = { enabled = false },
        terminal = { enabled = false },
        zen = { enabled = false },
    },
    -- keys = {
    --     -- LSP
    --     { "gd",         function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    --     { "gD",         function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    --     { "gr",         function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    --     { "gI",         function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    --     { "gy",         function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    --     { "gai",        function() Snacks.picker.lsp_incoming_calls() end,                      desc = "C[a]lls Incoming" },
    --     { "gao",        function() Snacks.picker.lsp_outgoing_calls() end,                      desc = "C[a]lls Outgoing" },
    -- }
}
