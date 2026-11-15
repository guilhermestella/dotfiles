require("catppuccin").setup {
    transparent_background = true,
    background = {
        light = "latte",
        dark = "mocha",
    },
}

require("dracula").setup {
    transparent_bg = true,
}

require("jellybeans").setup {
    transparent = true,
    background = {
        dark = "jellybeans_hc",
        light = "jellybeans_light",
    },
}

require("vscode").setup {
    transparent = true,
    group_overrides = {
        NeoTreeDimText = { fg = "NONE", bg = require("vscode.colors").get_colors().vscBack },
        BufferCurrentSign = { fg = "#1f1f1f", bg = "#1f1f1f" },
        BufferTabpageFill = { fg = "#1f1f1f", bg = "#1f1f1f" },
        BufferInactiveSign = { fg = "#2d2d2d", bg = "#2d2d2d" },
        BufferOffset = { fg = "#ffffff", bg = "#1f1f1f", bold = true },
        ColorColumn = { bg = "#303030" },
    },
}

vim.g.gruvbox_transparent_bd = 1
vim.g.gruvbox_material_transparent_background = 2

vim.cmd.colorscheme "jellybeans"
