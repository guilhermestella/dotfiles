-- check: https://github.com/neovim/nvim-lspconfig/issues/3189
local filter_libs = function(d)
  return not d:match(vim.fn.stdpath('config') .. '/?a?f?t?e?r?')
end

return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.tbl_filter(filter_libs, vim.api.nvim_get_runtime_file('', true)),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
