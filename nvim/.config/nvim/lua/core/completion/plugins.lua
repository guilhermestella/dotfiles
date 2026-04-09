local luasnip = require "luasnip"
local vscode = require "luasnip.loaders.from_vscode"
local blink = require "blink.cmp"

vscode.lazy_load()
vscode.lazy_load { paths = vim.fn.stdpath "config" .. "/lua/core/completion/snippets" }

luasnip.setup()
luasnip.filetype_extend("htmlangular", { "html" })

blink.setup {
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
}
