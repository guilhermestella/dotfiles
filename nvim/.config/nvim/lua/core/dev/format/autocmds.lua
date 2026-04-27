vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "md", "yaml", "yml", "xml", "lua", "json", "javascript" },
  callback = function(args)
    local ft = args.match
    local opts = {
      markdown = { wrap = true, linebreak = true, spell = true, textwidth = 80 },
      yaml = { expandtab = true, shiftwidth = 2, tabstop = 2, textwidth = 0 },
      xml = { expandtab = true, shiftwidth = 2, tabstop = 2, textwidth = 0 },
      lua = { expandtab = true, shiftwidth = 2, tabstop = 2 },
      json = { expandtab = true, shiftwidth = 2, tabstop = 2 },
      javascript = { expandtab = true, shiftwidth = 2, tabstop = 2 },
    }

    if opts[ft] then
      for k, v in pairs(opts[ft]) do
        vim.opt_local[k] = v
      end
    end
  end,
})
