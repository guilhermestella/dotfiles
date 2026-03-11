return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "", -- "hard", "soft" or ""
                transparent_mode = true,
            })

            vim.cmd.colorscheme("gruvbox")
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "none" })
            vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "none" })
            vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "none" })
            vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "none" })
        end,
    },
}
