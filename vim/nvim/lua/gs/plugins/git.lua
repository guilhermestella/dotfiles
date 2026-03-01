return {
     {
         'tpope/vim-fugitive'
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
 
                     map('n', '<leader>gb', gitsigns.blame)
                     map('n', '<leader>gp', gitsigns.preview_hunk)
                     map('n', '<leader>gi', gitsigns.preview_hunk_inline)
                     map('n', '<leader>gr', gitsigns.reset_hunk)
                     map('n', '<leader>gd', gitsigns.diffthis)

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
