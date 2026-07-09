local lualine = require "lualine"

lualine.setup {
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
    lualine_b = { "branch" },
    lualine_c = { "diff", "diagnostics" },
    lualine_x = { "location", "progress", "encoding", "lsp_status" },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "diff", "diagnostics" },
    lualine_x = { "location", "progress", "encoding", "lsp_status" },
    lualine_y = {},
    lualine_z = {},
  },
}
