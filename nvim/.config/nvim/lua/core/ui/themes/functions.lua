local M = {}

function M.setup_colorscheme(colorscheme)
  local function gruvbox_material()
    vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
    vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none" })
  end

  local function jellybeans()
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
  end

  local function dracula()
    -- dracula highlights
  end

  local function catppuccin_latte()
    vim.o.guicursor = "n-v-c:block,i:beam"
  end

  local function vscode()
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  end

  local handlers = {
    ["gruvbox-material"] = gruvbox_material,
    ["jellybeans"] = jellybeans,
    ["dracula"] = dracula,
    ["catppuccin_latte"] = catppuccin_latte,
    ["vscode"] = vscode,
  }

  local setup = handlers[colorscheme]
  vim.cmd.colorscheme(colorscheme)
  if setup then
    setup()
  end
end

return M
