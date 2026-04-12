local set = vim.keymap.set
local fn = require "core.lsp.markdown.functions"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function(args)
    set("n", "<leader>Tm", fn.toggle, { buffer = args.buf, desc = "➜ Render Markdown Toggle" })
  end,
})
