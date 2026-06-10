local trouble = require "trouble"

local M = {}

-- ════════════════════════════════════════════════════════════════════════════
-- Show LSP references
-- ════════════════════════════════════════════════════════════════════════════
local _trouble_view = nil

function M.show_find()
  if not trouble.last_mode then
    trouble.toggle {
      mode = "qflist",
      open_no_results = true,
      warn_no_results = false,
      refresh = false,
    }
    return
  end

  if _trouble_view and _trouble_view.opts.mode == trouble.last_mode then
    if _trouble_view:is_open() then
      _trouble_view:close()
    else
      _trouble_view.win:open()
      _trouble_view:update()
      if _trouble_view.opts.focus then
        vim.api.nvim_set_current_win(_trouble_view.win.win)
      end
    end
    return
  end

  -- First call (or different mode): open normally
  _trouble_view = trouble.toggle { mode = trouble.last_mode }
end

function M.show_references()
  trouble.open "lsp_references"
end

function M.show_implementations()
  trouble.open "lsp_implementations"
end

function M.show_definitions()
  trouble.open "lsp_definitions"
end

function M.show_declarations()
  trouble.open "lsp_declarations"
end

function M.show_type_definitions()
  trouble.open "lsp_type_definitions"
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
-- LSP Helpers
-- ════════════════════════════════════════════════════════════════════════════
function M.toggle_inlay_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

return M
