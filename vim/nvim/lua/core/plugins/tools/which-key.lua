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
            separator = "➜",
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
        filter = function(mapping) return mapping.desc ~= nil and mapping.desc ~= "" end,
    },
    config = function(_, opts)
        local wk = require("which-key")
        local gitsigns = require("gitsigns")
        wk.setup(opts)
        wk.add({
            -- Uncategorized
            { "/", function() Snacks.picker.grep_word({ live = true }) end, desc = "Grep Selection", mode = "x" },

            -- General
            { "<leader>", group = "General" },
            { "<leader>q", "<cmd>qa<cr>", desc = "Quit" },
            { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
            { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
            { "<leader>,", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
            { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>?", function() wk.show({ global = false }) end, desc = "Keymaps" },
            { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },

            -- Buffer
            { "<leader>b", group = "Buffer" },
            { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete" },
            { "<leader>bn", "<cmd>enew<cr>", desc = "New" },

            -- Find
            { "<leader>f", group = "Find" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config File" },
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Files" },
            { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Git Files" },
            { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
            { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

            -- Git
            { "<leader>g", group = "Git" },
            { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Branches" },
            { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Diff (Hunks)" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Log File" },
            { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Log Line" },
            { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Status" },
            { "<leader>ge", function() Snacks.picker.git_stash() end, desc = "Stash" },

            -- Hunk
            { "<leader>h", group = "Hunk" },
            { "<leader>hp", function() gitsigns.preview_hunk() end, desc = "Preview" },
            { "<leader>hr", function() gitsigns.reset_hunk() end, desc = "Reset" },
            { "<leader>hr", function() 
                                gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) 
                            end, desc = "Reset", mode = "v" },
            { "<leader>hR", function() gitsigns.reset_buffer() end, desc = "Reset All" },

            -- Search
            { "<leader>s", group = "Search" },
            { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
            { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
            { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
            { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
            { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },

            -- Temp File
            { "<leader>t", group = "Temp File" },
            { "<leader>ts", function() Snacks.scratch.select() end, desc = "Select" },
            { "<leader>tn",
                function() vim.ui.input({ prompt = "Scratch name: " }, function(name)
                    if name then
                        local ext = name:match("%.(%w+)$")
                        Snacks.scratch({ name = name, ft = ext or "markdown" })
                    end end)
                end, desc = "New"
            },

            -- Previous
            { "[", group = "Previous" },
            { "[b", "<cmd>bprevious<cr>", desc = "Buffer" },
            { "[d", function()
                        vim.diagnostic.goto_prev({ float = { focusable = false } })
                    end, desc = "Diagnostic" },
            { "[h", function() gitsigns.nav_hunk("prev") end, desc = "Hunk" },

            -- Next
            { "]", group = "Next" },
            { "]b", "<cmd>bnext<cr>", desc = "Buffer" },
            { "]d", function()
                        vim.diagnostic.goto_next({ float = { focusable = false } })
                    end, desc = "Diagnostic" },
            { "]h", function() gitsigns.nav_hunk("next") end, desc = "Hunk" },

            -- Go To (LSP)
            { "g", group = "Go to" },
            { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Definition" },
            { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Declaration" },
            { "gr", function() Snacks.picker.lsp_references() end, desc = "References" },
            { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Implementation" },
            { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Type Definition" },

            -- Go To Calls (LSP)
            { "ga", group = "Calls" },
            { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "Incoming" },
            { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "Outgoing" },
        })
    end,
}
