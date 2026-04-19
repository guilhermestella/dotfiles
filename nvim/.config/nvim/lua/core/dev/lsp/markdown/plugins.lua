local render = require "render-markdown"

render.setup {
  enabled = false,
  anti_conceal = {
    enabled = false,
  },
  completions = {
    lsp = {
      enabled = true,
    },
  },
}
