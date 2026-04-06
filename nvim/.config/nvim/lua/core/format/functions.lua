local conform = require "conform"

local M = {}

function M.format()
  conform.format {
    async = true,
    lsp_fallback = true,
  }
end

function M.paste_and_format(key)
  return function()
    local start_line = vim.fn.line "."
    vim.cmd("normal! " .. key)
    local end_line = vim.fn.line "."

    -- ensure start <= end
    local range_start = math.min(start_line, end_line)
    local range_end = math.max(start_line, end_line)

    conform.format {
      async = true,
      lsp_fallback = true,
      range = {
        start = { range_start, 0 },
        ["end"] = { range_end, 0 },
      },
    }
  end
end

return M
