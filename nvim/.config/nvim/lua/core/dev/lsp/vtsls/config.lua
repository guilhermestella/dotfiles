local mason_packages_path = vim.fn.stdpath "data" .. "/mason/packages"
local vue_ls_path = mason_packages_path .. "/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_ls_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

vim.lsp.config("vtsls", {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
