vim.pack.add {
  { src = "https://github.com/folke/snacks.nvim" },
}
require("snacks").setup {
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    preset = {
      lazy = false,
      keys = {
        { icon = " ", key = "<Space>", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "/", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = "󰒲 ", key = "u", desc = "Update", action = ":lua vim.pack.update()" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
    },
  },
  explorer = { enabled = false },
  indent = {
    enabled = true,
    animate = { enabled = false },
  },
  input = { enabled = true },
  notifier = {
    enabled = true,
    top_down = false,
    margin = { top = 0, right = 1, bottom = 2 },
  },
  picker = {
    enabled = true,
    hidden = true,
    sources = {
      files = {
        hidden = true,
      },
    },
    win = {
      input = {
        keys = {
          ["<a-h>"] = false,
          ["<c-w>"] = { "cycle_win", mode = { "i", "n" } },
        },
      },
      preview = {
        keys = {
          ["<c-w>"] = { "cycle_win", mode = { "i", "n" } },
        },
      },
      list = {
        keys = {
          ["<a-h>"] = false,
          ["<c-w>"] = { "cycle_win", mode = { "i", "n" } },
        },
      },
    },
  },
  quickfile = { enabled = true },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = {
    enabled = true,
    left = { "mark", "sign" },
    right = { "fold", "git" },
    folds = {
      open = true,
      git_hl = false,
    },
    git = {
      patterns = { "GitSign", "MiniDiffSign" },
    },
    refresh = 50,
  },
  words = { enabled = true },
  toggle = { enabled = false },
  terminal = { enabled = false },
  zen = { enabled = false },
}
