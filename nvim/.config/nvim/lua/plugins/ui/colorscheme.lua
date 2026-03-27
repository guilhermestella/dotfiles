return {
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme "jellybeans-hc"
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
    end,
  },
}
