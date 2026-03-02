return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            local builtin = require('telescope.builtin')

            require('telescope').setup {
                pickers = {
                    find_files = {
                        theme = 'ivy'
                    }
                }
            }

            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Search buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
            vim.keymap.set('n', '<leader>ft', builtin.live_grep, { desc = 'Search text' })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search files'})
            vim.keymap.set('n', '<leader>fg', builtin.git_status, { desc = 'Search git status' })
        end
    } 
}
