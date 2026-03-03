return {
     {
         'tpope/vim-fugitive',
         cmd = {'G', 'Git'},
         keys = {
             { '<C-g>c', ':G<CR>', desc = 'Fugitive Dashboard' }
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
 
                     map('n', '<C-g>b', gitsigns.blame)
                     map('n', '<C-g>d', gitsigns.diffthis)
                     map('n', '<C-g>p', gitsigns.preview_hunk)

                     -- reset hunk
                     map('n', '<C-g>r', gitsigns.reset_hunk)
                     map('v', '<C-g>r', function()
                         gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                     end)
 
                     -- Navigation
                     map('n', '<C-g>]', function()
                         if vim.wo.diff then
                             vim.cmd.normal({'<C-g>n', bang = true})
                         else
                             gitsigns.nav_hunk('next')
                         end
                     end)
 
                     map('n', '<C-g>[', function()
                         if vim.wo.diff then
                             vim.cmd.normal({'<C-g>p', bang = true})
                         else
                             gitsigns.nav_hunk('prev')
                         end
                     end)
                 end
             }
         end
      }
}
