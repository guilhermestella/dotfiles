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

require "core.options"
require "core.keymaps"
require("lazy").setup {
  spec = {
    { import = "plugins" },
    { import = "plugins.lsp" },
    { import = "plugins.tools" },
  },
}
require "core.completion"
require "core.debug"
require "core.editor"
require "core.explorer"
require "core.format"
require "core.notifications"
require "core.scratch"
require "core.ui"
require "core.vcs"
require "core.window"
