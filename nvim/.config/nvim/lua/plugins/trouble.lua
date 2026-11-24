vim.pack.add {
    { src = "https://github.com/folke/trouble.nvim" },
}

require("trouble").setup {
    auto_refresh = false,
    focus = true,
    restore = true,
    follow = false,
    warn_no_results = false,
    modes = {
        diagnostics = {
            open_no_results = true,
            auto_refresh = true,
        },
    },
    preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.4,
    },
    win = {
        size = 25,
    },
    keys = {
        ["<M-f>"] = "close",
        ["<M-p>"] = "close",
        ["<M-S-p>"] = "close",
    },
}
