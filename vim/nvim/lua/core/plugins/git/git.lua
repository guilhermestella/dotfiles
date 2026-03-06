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
    }
}
