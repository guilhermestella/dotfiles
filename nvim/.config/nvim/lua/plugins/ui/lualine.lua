return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'gruvbox',
          disabled_filetypes = { "neo-tree" },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
        },
        tabline = { lualine_a = { 'buffers' } },
        winbar = { lualine_c = { { 'navic', } } },
        inactive_winbar = { lualine_c = { { 'navic', } } }
      }
    end
  }
}
