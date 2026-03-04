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

            vim.keymap.set('n', '<C-w>t', builtin.find_files, { desc = 'Find files' })
            vim.keymap.set('n', '<C-w>f', builtin.live_grep, { desc = 'Find in files' })
            vim.keymap.set('n', '<C-w>b', builtin.buffers, { desc = 'Find in buffers' })
            vim.keymap.set('n', '<C-w>?', builtin.keymaps, { desc = 'Find keymaps' })

            -- Git
            vim.keymap.set('n', '<C-g>s', builtin.git_status, { desc = 'Git status' })
            vim.keymap.set('n', '<C-g>c', builtin.git_commits, { desc = 'Git commits' })
        end
    },
}
