local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require "options"
require "keymaps"
require "cmds"
require "autocmds"
require("lazy").setup {
  spec = {
    { import = "plugins.code" },
    { import = "plugins.debug" },
    { import = "plugins.git" },
    { import = "plugins.lsp" },
    { import = "plugins.tools" },
    { import = "plugins.ui" },
  },
}
