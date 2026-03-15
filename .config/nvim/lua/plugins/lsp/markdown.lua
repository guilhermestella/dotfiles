return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-mini/mini.icons' },
        opts = {
            enabled = false,
            anti_conceal = {
                enabled = false
            },
            completions = {
                lsp = {
                    enabled = true
                }
            },
        },
        keys = {
            { "<leader>Tm", "<cmd>RenderMarkdown toggle<cr>", desc = "➜ Render Markdown Toggle", ft = "markdown" }
        }
    }
}
