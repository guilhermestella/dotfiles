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
 
                     map('n', '<leader>gp', gitsigns.preview_hunk)

                     -- reset hunk
                     map('n', '<leader>gr', gitsigns.reset_hunk)
                     map('v', '<leader>gr', function()
                         gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                     end)
 
                     -- Navigation
                     map('n', '<leader>g]', function()
                         if vim.wo.diff then
                             vim.cmd.normal({'<leader>gn', bang = true})
                         else
                             gitsigns.nav_hunk('next')
                         end
                     end)
 
                     map('n', '<leader>g[', function()
                         if vim.wo.diff then
                             vim.cmd.normal({'<leader>gp', bang = true})
                         else
                             gitsigns.nav_hunk('prev')
                         end
                     end)
                 end
             }
         end
      }
}
