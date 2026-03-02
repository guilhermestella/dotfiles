return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
            require('nvim-autopairs').setup {
            }
        end
    },
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup {
            }
        end
    },
    {
        "pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup({
                enabled = true,
                trigger_events = {"InsertLeave", "TextChanged"},
            })
        end,
    } 
}
