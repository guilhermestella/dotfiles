return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
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
      layouts = {
        vertical_buffers = {
          layout = {
            box = "vertical",
            width = 0.5,
            height = 0.7,
            border = "rounded",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", height = 0.55, border = "none" },
            { win = "preview", border = "top" },
          },
        },
      },
      sources = {
        files = {
          hidden = true,
        },
        buffers = {
          sort_lastused = true,
          current = false,
          layout = { preset = "vertical_buffers" },
          win = {
            input = {
              keys = {
                ["<c-d>"] = { "bufdelete", mode = { "i", "n" } },
              },
            },
          },
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
  },
  keys = {

    -- IDE Shortcuts

    -- Uncategorized
    {
      "/",
      function()
        Snacks.picker.grep_word { live = true }
      end,
      desc = "➜ Grep Selection",
      mode = "x",
    },

    -- General
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "➜ Grep",
    },
    {
      "<leader><Tab>",
      function()
        Snacks.picker.buffers()
      end,
      desc = "➜ Grep",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "➜ Smart Find Files",
    },

    -- Find
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "➜ Projects",
    },

    -- Search
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "➜ Commands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "➜ Buffer Diagnostics",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "➜ Diagnostics",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "➜ Quickfix List",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "➜ Undo History",
    },

    -- Go To (LSP)
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "➜ Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "➜ Declaration",
    },
    {
      "grr",
      function()
        Snacks.picker.lsp_references()
      end,
      desc = "➜ References",
    },
    {
      "gri",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "➜ Implementation",
    },

    -- Go To Calls (LSP)
    {
      "gci",
      function()
        Snacks.picker.lsp_incoming_calls()
      end,
      desc = "➜ Incoming",
    },
    {
      "gco",
      function()
        Snacks.picker.lsp_outgoing_calls()
      end,
      desc = "➜ Outgoing",
    },
  },
}
