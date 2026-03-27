return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "echasnovski/mini.icons",
  },
  opts = {
    delay = 500,
    preset = "helix",
    sort = { "group", "alphanum" },
    icons = {
      mappings = false,
      rules = false,
      breadcrumb = "»",
      separator = "",
    },
    win = {
      border = "rounded",
      padding = { 1, 2 },
    },
    plugins = {
      marks = false,
      registers = false,
      spelling = { enabled = false },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    spec = {
      { "<leader>", group = "General" },
      { "<leader>b", group = "Buffer" },
      { "<leader>d", group = "Debug" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Hunk" },
      { "<leader>j", group = "Java" },
      { "<leader>l", group = "Lsp Actions" },
      { "<leader>s", group = "Search" },
      { "<leader>S", group = "Scratch" },
      { "<leader>t", group = "Test" },
      { "<leader>T", group = "Toggle" },
      { "g", group = "Goto" },
      { "gc", group = "Goto Calls" },
      { "z", group = "Fold" },
      { "[", group = "Previous" },
      { "]", group = "Next" },

      -- Override native mappings
      { "zo", desc = "➜ Open" },
      { "zO", desc = "➜ Open All" },
      { "zc", desc = "➜ Close" },
      { "zC", desc = "➜ Close All" },
    },
    -- Trick to show only my defined mappings
    filter = function(mapping)
      return mapping.desc ~= nil and vim.startswith(mapping.desc, "➜")
    end,
  },
}
