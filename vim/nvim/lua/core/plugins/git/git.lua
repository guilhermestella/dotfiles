return {
    {
        'tpope/vim-fugitive',
        cmd = {'G', 'Git'},
        keys = {
            { '<leader>gc', ':G<CR>', desc = 'Fugitive Dashboard' }
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map('n', '<leader>hr', gitsigns.reset_hunk)
                    map('v', '<leader>hr', function()
                        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)
                end
            }
        end
    }
}
