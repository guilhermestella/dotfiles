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
                    },
                    git_status = {
                        previewer = true,
                        layout_strategy = 'vertical',
                        layout_config = {
                            vertical = {
                                preview_height = 0.6,
                            }
                        }
                    }
                }
            }

            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search in files' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find in buffers' })

            -- Git
            vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })
            vim.keymap.set('n', '<leader>gh', builtin.git_commits, { desc = 'Git commits' })
        end
    },
}
