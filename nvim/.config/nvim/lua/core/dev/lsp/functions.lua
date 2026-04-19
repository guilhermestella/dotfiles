local snacks = require "snacks"

local M = {}

-- ════════════════════════════════════════════════════════════════════════════
-- Show LSP references
-- ════════════════════════════════════════════════════════════════════════════
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
        ["<M-f>"] = { "close", mode = { "i", "n" } },
        ["<Esc>"] = { "unfocus", mode = "i" },
      },
    },
  },
}

local function toggle_lsp_picker(source)
  local pickers = snacks.picker.get { source = source }
  if pickers[1] then
    if pickers[1]:is_focused() then
      pickers[1]:close()
    else
      pickers[1]:focus()
    end
  else
    snacks.picker[source](opts)
  end
end

function M.show_references()
  toggle_lsp_picker "lsp_references"
end

local fast_opts = {
  layout = {
    preset = "dropdown",
    layout = {
      box = "vertical",
      border = "rounded",
      width = 0.5,
      height = 0.5,
      { win = "input", height = 1, border = "bottom" },
      { win = "list", height = 0.4 },
      { win = "preview", border = "top", height = 0.6 },
    },
  },
}

function M.show_definitions()
  snacks.picker.lsp_definitions(fast_opts)
end

function M.show_declarations()
  snacks.picker.lsp_declarations(fast_opts)
end

function M.show_implementations()
  snacks.picker.lsp_implementations(fast_opts)
end

function M.show_type_definitions()
  snacks.picker.lsp_type_definitions(fast_opts)
end

function M.show_documentation()
  vim.lsp.buf.hover { focusable = true, max_height = 25, max_width = 120 }
end

-- ════════════════════════════════════════════════════════════════════════════
-- LSP Actions
-- ════════════════════════════════════════════════════════════════════════════
local extract_method = { context = { only = { "refactor.extract.function" }, diagnostics = {} }, apply = true }
local extract_variable = { context = { only = { "refactor.extract.variable" }, diagnostics = {} }, apply = true }
local extract_constant = { context = { only = { "refactor.extract.constant" }, diagnostics = {} }, apply = true }
local organize_imports = { context = { only = { "source.organizeImports" }, diagnostics = {} }, apply = true }

function M.extract_method()
  vim.lsp.buf.code_action(extract_method)
end

function M.extract_variable()
  vim.lsp.buf.code_action(extract_variable)
end

function M.extract_constant()
  vim.lsp.buf.code_action(extract_constant)
end

function M.organize_imports()
  vim.lsp.buf.code_action(organize_imports)
end

M.rename = vim.lsp.buf.rename
M.actions = vim.lsp.buf.code_action

-- ════════════════════════════════════════════════════════════════════════════
-- LSP Custom Actions (not standard by lsp servers)
-- ════════════════════════════════════════════════════════════════════════════
local function run_custom_command(command)
  local ok, _ = pcall(function()
    vim.lsp.commands[command]()
  end)

  if not ok then
    vim.notify("LSP not started or does not implements " .. command, vim.log.INFO)
  end
end

function M.test_function()
  run_custom_command "test.run.function"
end

function M.test_file()
  run_custom_command "test.run.file"
end

-- ════════════════════════════════════════════════════════════════════════════
-- LSP Helpers
-- ════════════════════════════════════════════════════════════════════════════
function M.toggle_inlay_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

return M
