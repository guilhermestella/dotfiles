local hl = vim.api.nvim_set_hl

local M = {}

function M.setup_colorscheme(light, dark)
    local colorscheme
    if vim.o.background == "dark" then
        colorscheme = dark
    else
        colorscheme = light
    end

    local function vscode()
        hl(0, "BufferTabpageFill", { bg = "#1f1f1f" })
        hl(0, "BufferInactiveSign", { bg = "#1f1f1f" })
    end

    local function gruvbox_material()
        hl(0, "WinBar", { bg = "none" })
        hl(0, "WinBarNC", { bg = "none" })
    end

    local function jellybeans()
        hl(0, "ColorColumn", { bg = "#303030" })
    end

    local function catppuccin_latte()
        vim.o.guicursor = "n-v-c:block,i:beam"
    end

    local handlers = {
        ["gruvbox-material"] = gruvbox_material,
        ["jellybeans"] = jellybeans,
        ["catppuccin_latte"] = catppuccin_latte,
        ["vscode"] = vscode,
    }

    vim.cmd.colorscheme(colorscheme)
    local setup = handlers[colorscheme]
    if setup then
        setup()
    end
end

return M
