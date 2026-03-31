return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          local ls = require "luasnip"
          local from_vscode = require "luasnip.loaders.from_vscode"

          from_vscode.lazy_load()
          from_vscode.lazy_load { paths = vim.fn.stdpath "config" .. "/snippets" }

          ls.filetype_extend("htmlangular", { "html" })
        end,
      },
    },
    opts = {
      keymap = {
        preset = "enter",
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = { auto_show = true },
      },

      snippets = { preset = "luasnip" },
      signature = { enabled = true },
      cmdline = {
        enabled = false,
        completion = { menu = { auto_show = true } },
        keymap = {
          ["<CR>"] = { "accept_and_enter", "fallback" },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust" },
    },
  },
}
