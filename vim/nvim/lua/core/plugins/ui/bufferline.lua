return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
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
            },
        }
    end,
}
