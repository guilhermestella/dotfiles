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
        -- Uncategorized
        { "/", function() Snacks.picker.grep_word({ live = true }) end, desc = "➜ Grep Selection", mode = "x" },

        -- General
        { "<leader>e", function() Snacks.explorer() end, desc = "➜ Explorer" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "➜ Find Buffers" },
        { "<leader>.", function() Snacks.picker.git_status() end, desc = "➜ Git Status" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "➜ Grep" },
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "➜ Smart Find Files" },

        -- Buffer
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "➜ Delete" },

        -- Find
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "➜ Config File" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "➜ Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "➜ Git Files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "➜ Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "➜ Recent" },

        -- Git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "➜ Branches" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "➜ Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "➜ Log File" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "➜ Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "➜ Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "➜ Status" },
        { "<leader>ge", function() Snacks.picker.git_stash() end, desc = "➜ Stash" },

        -- Search
        { "<leader>sc", function() Snacks.picker.command_history() end, desc = "➜ Commands" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "➜ Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "➜ Buffer Diagnostics" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "➜ Marks" },
        { "<leader>sn", function() Snacks.picker.notifications() end, desc = "➜ Notifications" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "➜ Quickfix List" },
        { "<leader>su", function() Snacks.picker.undo() end, desc = "➜ Undo History" },

        -- Temp File
        { "<leader>ts", function() Snacks.scratch.select() end, desc = "➜ Select" },
        { "<leader>tn",
            function() vim.ui.input({ prompt = "Scratch name: " }, function(name)
                if name then
                    local ext = name:match("%.(%w+)$")
                    Snacks.scratch({ name = name, ft = ext or "markdown" })
                end end)
            end, desc = "➜ New"
        },

        -- Go To (LSP)
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "➜ Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "➜ Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, desc = "➜ References" },
        { "gi", function() Snacks.picker.lsp_implementations() end, desc = "➜ Implementation" },
        { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "➜ Type Definition" },

        -- Go To Calls (LSP)
        { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "➜ Incoming" },
        { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "➜ Outgoing" },
    }
}
