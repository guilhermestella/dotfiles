local snacks = require "snacks"
local trouble = require "trouble"

local M = {}

-- ════════════════════════════════════════════════════════════════════════════
-- Show LSP references
-- ════════════════════════════════════════════════════════════════════════════
local _lsp_ref_view = nil

function M.toggle_find()
    if not _lsp_ref_view then
        return
    end

    if _lsp_ref_view then
        if _lsp_ref_view:is_open() then
            _lsp_ref_view:close()
        else
            _lsp_ref_view.win:open()
            _lsp_ref_view:update()
            if _lsp_ref_view.opts.focus then
                _lsp_ref_view.win:focus()
            end
        end
        return
    end
end

function M.show_references()
    _lsp_ref_view = trouble.open "lsp_references"
end

function M.show_implementations()
    _lsp_ref_view = trouble.open "lsp_implementations"
end

function M.show_definitions()
    local view = trouble.open "lsp_definitions"
    if not view then
        return
    end

    view.first_update:next(function()
        if view:count() == 0 then
            view:close()
            _lsp_ref_view = trouble.open "lsp_references"
            return
        end
        _lsp_ref_view = view
    end)
end

function M.show_type_definitions()
    _lsp_ref_view = trouble.open "lsp_type_definitions"
end

function M.show_documentation()
    vim.lsp.buf.hover { focusable = true, max_height = 25, max_width = 120 }
end

-- ════════════════════════════════════════════════════════════════════════════
-- LSP Actions
-- ════════════════════════════════════════════════════════════════════════════
local extract_method =
    { context = { only = { "refactor.extract.function" }, diagnostics = {} }, apply = true }
local extract_variable =
    { context = { only = { "refactor.extract.variable" }, diagnostics = {} }, apply = true }
local extract_constant =
    { context = { only = { "refactor.extract.constant" }, diagnostics = {} }, apply = true }
local organize_imports =
    { context = { only = { "source.organizeImports" }, diagnostics = {} }, apply = true }

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
