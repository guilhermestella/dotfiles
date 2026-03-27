return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "*",

    opts = {
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<c-j>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<c-k>"] = { "select_prev", "fallback" },
      },
      snippets = { preset = "default" },
      signature = { enabled = true },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "normal",
      },
      cmdline = {
        enabled = false,
        completion = { menu = { auto_show = true } },
        keymap = {
          ["<CR>"] = { "accept_and_enter", "fallback" },
        },
      },
      completion = {
        menu = {
          border = "rounded",
          scrolloff = 1,
          scrollbar = false,
          draw = {
            padding = 1,
            gap = 1,
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
              { "source_name" },
            },
          },
        },
        documentation = {
          window = {
            border = "rounded",
            scrollbar = false,
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
          },
          auto_show = true,
          auto_show_delay_ms = 500,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
