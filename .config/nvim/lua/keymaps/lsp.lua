-- ════════════════════════════════════════════════════════════════════════════
-- LSP
-- ════════════════════════════════════════════════════════════════════════════

local hover_opts = { focusable = true, max_height = 25, max_width = 120 }
local extract_method = { context = { only = { "refactor.extract.function" }, diagnostics = {} }, apply = true, }
local extract_variable = { context = { only = { "refactor.extract.variable" }, diagnostics = {} }, apply = true, }
local extract_constant = { context = { only = { "refactor.extract.constant" }, diagnostics = {} }, apply = true, }
local organize_imports = { context = { only = { "source.organizeImports" }, diagnostics = {} }, apply = true, }

local function fn_extract_method() vim.lsp.buf.code_action(extract_method) end
local function fn_extract_variable() vim.lsp.buf.code_action(extract_variable) end
local function fn_extract_constant() vim.lsp.buf.code_action(extract_constant) end
local function fn_organize_imports() vim.lsp.buf.code_action(organize_imports) end

-- Default LSP shortcuts with description override
vim.keymap.set("n", "K", function() vim.lsp.buf.hover(hover_opts) end, { desc = "Hover documentation" })
vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "➜ LSP Rename Symbol" })
vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "➜ LSP Code Action" })
vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "➜ LSP References" })
vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { desc = "➜ LSP Implementation" })
vim.keymap.set("n", "gO", vim.lsp.buf.document_symbol, { desc = "➜ LSP Document Symbols" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "➜ LSP Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "➜ LSP Declaration" })

-- Inheritance from my IntelliJ Keymaps
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "➜ LSP Rename Symbol" })
vim.keymap.set("n", "<C-M-o>", fn_organize_imports, { desc = "➜ Organize Imports" })
vim.keymap.set({ "n", "v" }, "<C-M-m>", fn_extract_method, { desc = "➜ Extract Method" })
vim.keymap.set({ "n", "v" }, "<C-M-v>", fn_extract_variable, { desc = "➜ Extract Variable" })
vim.keymap.set({ "n", "v" }, "<C-M-c>", fn_extract_constant, { desc = "➜ Extract Constant" })
vim.keymap.set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

