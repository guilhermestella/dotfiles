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

-- lazy requires leader key to be defined before
-- this is temporary as lazy will be replaced by pack
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("plugins", {
  defaults = { lazy = false },
})

require "core.dev"
require "core.tool"
require "core.ui"
