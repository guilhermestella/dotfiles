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


            -- Find files
            vim.keymap.set('n', '<C-t>', builtin.find_files, { desc = 'Find files' })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files'})

            -- Search by text
            vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Find in files' })
            vim.keymap.set('n', '<leader>ft', builtin.live_grep, { desc = 'Find in files' })

            -- Find in buffer
            vim.keymap.set('n', '<M-e>', builtin.buffers, { desc = 'Find in buffers' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find in buffers' })

            -- Find in git status
            vim.keymap.set('n', '<M-c>', builtin.git_status, { desc = 'Find in git status' })
            vim.keymap.set('n', '<leader>fg', builtin.git_status, { desc = 'Find in git status' })

            -- Help
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
        end
    } 
}
