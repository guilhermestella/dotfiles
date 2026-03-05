return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false, 
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
        },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },
            source_selector = {
                winbar = true
            },
            window = {
                width = 30,
                auto_expand_width = true,
                mappings = {
                    ["<space>"] = "none", 
                    ["l"] = "open",       
                    ["h"] = "close_node", 
                    ["J"] = "prev_source",
                    ["K"] = "next_source",
                },
            },
        },
    }
}
