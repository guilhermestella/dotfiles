-- local catppuccin = require "catppuccin"
-- catppuccin.setup {
--   flavour = "latte",
--   color_overrides = {
--     latte = {
--       base = "#ffffff",
--     },
--   },
-- }

local fn = require "core.ui.themes.functions"
local vscode_colors = require("vscode.colors").get_colors()

require("vscode").setup {
    transparent = true,
    group_overrides = {
        NeoTreeDimText = { fg = "NONE", bg = vscode_colors.vscBack },
    },
}

fn.setup_colorscheme("vscode", "vscode")

vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = function()
        fn.setup_colorscheme("vscode", "vscode")
    end,
})
