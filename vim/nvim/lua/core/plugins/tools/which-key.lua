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
        wk.register({
            mode = "x",
            ["/"] = { function() Snacks.picker.grep_word({ live = true }) end, "Grep Selection" },
        })
        wk.register({
            mode = "n",
            ["<leader>"] = {
                name = "General",
                ["e"] = { function() Snacks.explorer() end, "Explorer" },
                ["n"] = { function() Snacks.picker.notifications() end, "Notification History" },
                ["q"] = { "<cmd>qa<cr>", "Quit" },
                [","] = { function() Snacks.picker.buffers() end, "Find Buffers" },
                ["/"] = { function() Snacks.picker.grep() end, "Grep" },
                [":"] = { function() Snacks.picker.command_history() end, "Command History" },
                ["?"] = { function() wk.show({ global = false }) end, "Keymaps" },
                ["<space>"] = { function() Snacks.picker.smart() end, "Smart Find Files" },
                ["b"] = {
                    name = "Buffer",
                    ["d"] = { function() Snacks.bufdelete() end, "Delete" },
                    ["n"] = { "<cmd>enew<cr>", "New" },
                },
                ["f"] = {
                    name = "Find",
                    ["c"] = { function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, "Config File" },
                    ["f"] = { function() Snacks.picker.files() end, "Files" },
                    ["g"] = { function() Snacks.picker.git_files() end, "Git Files" },
                    ["p"] = { function() Snacks.picker.projects() end, "Projects" },
                    ["r"] = { function() Snacks.picker.recent() end, "Recent" },
                },
                ["g"] = {
                    name = "Git",
                    ["b"] = { function() Snacks.picker.git_branches() end, "Branches" },
                    ["d"] = { function() Snacks.picker.git_diff() end, "Diff (Hunks)" },
                    ["f"] = { function() Snacks.picker.git_log_file() end, "Log File" },
                    ["l"] = { function() Snacks.picker.git_log() end, "Log" },
                    ["L"] = { function() Snacks.picker.git_log_line() end, "Log Line" },
                    ["s"] = { function() Snacks.picker.git_status() end, "Status" },
                    ["S"] = { function() Snacks.picker.git_stash() end, "Stash" },
                },
                ["h"] = {
                    name = "Hunk",
                    ["p"] = { function() gitsigns.preview_hunk() end, "Preview" },
                    ["r"] = { function() gitsigns.reset_hunk() end, "Reset" },
                    ["R"] = { function() gitsigns.reset_buffer() end, "Reset All" },
                },
                ["s"] = {
                    name = "Search",
                    ["d"] = { function() Snacks.picker.diagnostics() end, "Diagnostics" },
                    ["D"] = { function() Snacks.picker.diagnostics_buffer() end, "Buffer Diagnostics" },
                    ["m"] = { function() Snacks.picker.marks() end, "Marks" },
                    ["q"] = { function() Snacks.picker.qflist() end, "Quickfix List" },
                    ["u"] = { function() Snacks.picker.undo() end, "Undo History" },
                },
                ["t"] = {
                    name = "Temp File",
                    ["s"] = { function() Snacks.scratch.select() end, "Select" },
                    ["n"] = {
                        function()
                            vim.ui.input({ prompt = "Scratch name: " }, function(name)
                            if (name) then
                                local ext = name:match("%.(%w+)$")
                                Snacks.scratch({ name = name, ft = ext or "markdown" })
                            end
                        end)
                    end, "New"}
                },
            },
            ["["] = {
                name = "Previous",
                ["b"] = { "<cmd>bprevious<cr>", "Buffer" },
                ["d"] = {
                    function()
                        vim.diagnostic.goto_prev({ float = { focusable = false } })
                    end, "Diagnostic"
                },
                ["h"] = { function() gitsigns.nav_hunk("prev") end, "Hunk" },
            },
            ["]"] = {
                name = "Next",
                ["b"] = { "<cmd>bnext<cr>", "Buffer" },
                ["d"] = {
                    function()
                        vim.diagnostic.goto_next({ float = { focusable = false } })
                    end, "Diagnostic"
                },
                ["h"] = { function() gitsigns.nav_hunk("next") end, "Hunk" }
            },
            ["g"] = {
                name = "Go to",
                ["d"] = { function() Snacks.picker.lsp_definitions() end, "Definition" },
                ["D"] = { function() Snacks.picker.lsp_declarations() end, "Declaration" },
                ["r"] = { function() Snacks.picker.lsp_references() end, "References" },
                ["i"] = { function() Snacks.picker.lsp_implementations() end, "Implementation" },
                ["t"] = { function() Snacks.picker.lsp_type_definitions() end, "Type Definition" },
                ["a"] = {
                    name = "Calls",
                    ["i"] = { function() Snacks.picker.lsp_incoming_calls() end, "Incoming" },
                    ["o"] = { function() Snacks.picker.lsp_outgoing_calls() end, "Outgoing" },
                },
            },
        })
        wk.register({
            mode = "v",
            ["<leader>"] = {
                name = "General",
                ["h"] = {
                    name = "Hunk",
                    ["r"] = { function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset" }
                },
            },
        })
    end,
}
