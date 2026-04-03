return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "SmiteshP/nvim-navic",
        dependencies = {
          "neovim/nvim-lspconfig",
        },
        opts = {
          lsp = { auto_attach = true },
          highlight = true,
          separator = " » ",
          depth_limit = 8,
          depth_limit_indicator = "...",
          lazy_update_context = false,
        },
      },
    },
    config = function()
      vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
      vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none" })

      require("lualine").setup {
        options = {
          icons_enabled = true,
          disabled_filetypes = {
            "neo-tree",
            "dap-repl",
            "dapui_watches",
            "dapui_stacks",
            "dapui_breakpoints",
            "dapui_scopes",
            "dapui_console",
          },
          section_separators = { left = " ", right = " " },
          component_separators = { left = "|", right = "|" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics", "filename" },
          lualine_c = {},
        },
        inactive_sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics", "filename" },
          lualine_c = {},
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        winbar = {
          lualine_a = { "filename" },
          lualine_c = { "navic" },
        },
        inactive_winbar = {
          lualine_a = { "filename" },
          lualine_c = { "navic" },
        },
      }
    end,
  },
}
