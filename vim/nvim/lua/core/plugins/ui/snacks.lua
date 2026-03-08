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
    keys = {
        -- Top Pickers & Explorer
        { "<leader><space>", function() Snacks.picker.smart() end,   desc = "Smart Find Files" },
        { "<leader>,",       function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/",  function() Snacks.picker.grep_word({ live = true }) end, desc = "Grep" },
        { "<leader>:",  function() Snacks.picker.command_history() end,                         desc = "Command History" },
        { "<leader>n",  function() Snacks.picker.notifications() end,                           desc = "Notification History" },
        { "<leader>e",  function() Snacks.explorer() end,                                       desc = "File Explorer" },
        { "<leader>?",  function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
        { "<leader>fp", function() Snacks.picker.projects() end,                                desc = "Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end,                              desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
        -- search
        { "<leader>sd", function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
        { "<leader>sm", function() Snacks.picker.marks() end,                                   desc = "Marks" },
        { "<leader>sq", function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
        { "<leader>su", function() Snacks.picker.undo() end,                                    desc = "Undo History" },
        -- LSP
        { "gd",         function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
        { "gI",         function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
        { "gai",        function() Snacks.picker.lsp_incoming_calls() end,                      desc = "C[a]lls Incoming" },
        { "gao",        function() Snacks.picker.lsp_outgoing_calls() end,                      desc = "C[a]lls Outgoing" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
        { "<leader>bd", function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
        { "<leader>un", function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
    }
}
