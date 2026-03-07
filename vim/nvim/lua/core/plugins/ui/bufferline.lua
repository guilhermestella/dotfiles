return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = function()
        return {
            { "<leader>bq", "<cmd>bdelete<cr>", desc = "Close buffer" },
            { "<leader>bn", "<cmd>enew<cr>", desc = "New buffer" },
        }
    end,
    config = function()
        require("bufferline").setup {
            options = {
                numbers = "ordinal",
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                separator_style = "thin",
                indicator = {
                    style = "icon",
                    icon = "▎",
                },
                buffer_close_icon = "󰅖",
                modified_icon = "●",
                left_trunc_marker = "󰜌",
                right_trunc_marker = "󰜌",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "left",
                        highlight = "Directory",
                        separator = true,
                    }
                }
            },
        }
    end,
}
