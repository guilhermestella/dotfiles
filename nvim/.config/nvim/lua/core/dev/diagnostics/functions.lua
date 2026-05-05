local snacks = require "snacks"

local M = {}

local opts = {
  layout = "ivy",
  show_empty = true,
  auto_close = false,
  actions = {
    unfocus = function(picker)
      vim.cmd "stopinsert"
      vim.schedule(function()
        if picker.main and vim.api.nvim_win_is_valid(picker.main) then
          vim.api.nvim_set_current_win(picker.main)
        end
      end)
    end,
  },
  win = {
    preview = { wo = { wrap = true } },
    input = {
      keys = {
        ["<M-p>"] = { "close", mode = { "i", "n" } },
        ["<M-P>"] = { "close", mode = { "i", "n" } },
        ["<Esc>"] = { "unfocus", mode = "i" },
      },
    },
  },
}

function M.show_diagnostics()
  local pickers = snacks.picker.get { source = "diagnostics" }
  if pickers[1] then
    if pickers[1]:is_focused() then
      pickers[1]:close()
    else
      pickers[1]:focus()
    end
  else
    snacks.picker.diagnostics(opts)
  end
end

function M.show_buffer_diagnostics()
  local pickers = snacks.picker.get { source = "diagnostics_buffer" }
  if pickers[1] then
    if pickers[1]:is_focused() then
      pickers[1]:close()
    else
      pickers[1]:focus()
    end
  else
    snacks.picker.diagnostics_buffer(opts)
  end
end

function M.open_diagnostic()
  vim.diagnostic.open_float()
end

function M.goto_next_diagnostic()
  vim.diagnostic.jump { count = 1 }
end

function M.goto_previous_diagnostic()
  vim.diagnostic.jump { count = -1 }
end

return M
