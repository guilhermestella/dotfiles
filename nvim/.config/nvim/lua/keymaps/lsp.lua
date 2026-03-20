-- ════════════════════════════════════════════════════════════════════════════
-- LSP
-- ════════════════════════════════════════════════════════════════════════════

local hover_opts = { focusable = true, max_height = 25, max_width = 120 }
local extract_method = { context = { only = { "refactor.extract.function" }, diagnostics = {} }, apply = true }
local extract_variable = { context = { only = { "refactor.extract.variable" }, diagnostics = {} }, apply = true }
local extract_constant = { context = { only = { "refactor.extract.constant" }, diagnostics = {} }, apply = true }
local organize_imports = { context = { only = { "source.organizeImports" }, diagnostics = {} }, apply = true }

local function fn_extract_method() vim.lsp.buf.code_action(extract_method) end
local function fn_extract_variable() vim.lsp.buf.code_action(extract_variable) end
local function fn_extract_constant() vim.lsp.buf.code_action(extract_constant) end
local function fn_organize_imports() vim.lsp.buf.code_action(organize_imports) end

vim.keymap.set("n", "K", function() vim.lsp.buf.hover(hover_opts) end, { desc = "Hover documentation" })
vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" })
vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" })
vim.keymap.set("n", "<C-M-o>", fn_organize_imports, { desc = "Organize Imports" })
vim.keymap.set({ "n", "v" }, "<C-M-m>", fn_extract_method, { desc = "Extract Method" })
vim.keymap.set({ "n", "v" }, "<C-M-v>", fn_extract_variable, { desc = "Extract Variable" })
vim.keymap.set({ "n", "v" }, "<C-M-c>", fn_extract_constant, { desc = "Extract Constant" })
vim.keymap.set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- ════════════════════════════════════════════════════════════════════════════
-- Diagnostics
-- ════════════════════════════════════════════════════════════════════════════
vim.diagnostic.config({
  jump = {
    on_jump = function(bufnr)
      vim.diagnostic.open_float({
        bufnr = bufnr,
        scope = "cursor",
        focus = false,
        focusable = true,
      })
    end,
  },
})

vim.keymap.set("n", "<C-w>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next Diagnostic" })
