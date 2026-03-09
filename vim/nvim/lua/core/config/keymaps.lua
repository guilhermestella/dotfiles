-- ════════════════════════════════════════════════════════════════════════════
-- Essential Operations
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true, desc = "Clear highlight" })

-- ════════════════════════════════════════════════════════════════════════════
-- Window Navigation (no prefix for speed)
-- ════════════════════════════════════════════════════════════════════════════

-- Tab navigation is defined in tmux.lua plugin

-- Resize
vim.keymap.set('n', '<C-Up>',       ':resize -2<CR>', { desc = 'Increase height' })
vim.keymap.set('n', '<C-Down>',     ':resize +2<CR>', { desc = 'Decrease height' })
vim.keymap.set('n', '<C-Left>',     ':vertical resize -2<CR>', { desc = 'Decrease width' })
vim.keymap.set('n', '<C-Right>',    ':vertical resize +2<CR>', { desc = 'Increase width' })

-- ════════════════════════════════════════════════════════════════════════════
-- Buffer Navigation (no prefix for speed)
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- ════════════════════════════════════════════════════════════════════════════
-- Move Block (Visual Mode)
-- ════════════════════════════════════════════════════════════════════════════

vim.keymap.set("n", "<A-J>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-K>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-J>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move block down" })
vim.keymap.set("v", "<A-K>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move block up" })

-- ════════════════════════════════════════════════════════════════════════════
-- Editing
-- ════════════════════════════════════════════════════════════════════════════

-- Some formatter maps are in conform.lua

-- Better indenting (stay in visual mode)
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- ════════════════════════════════════════════════════════════════════════════
-- Diagnostics
-- ════════════════════════════════════════════════════════════════════════════
local diagnostic_opts = { focusable = false }
local float_opts = { float =  diagnostic_opts }
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next(float_opts) end, { desc = "Go to next Diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev(float_opts) end, { desc = "Go to prev Diagnostic" })
vim.keymap.set("n", "<C-w>d", function() vim.diagnostic.open_float(diagnostic_opts) end, { desc = "Show Diagnostic" })

-- ════════════════════════════════════════════════════════════════════════════
-- LSP
-- ════════════════════════════════════════════════════════════════════════════
local hover_opts = { focusable = false, max_height = 25, max_width = 120 }
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover(hover_opts)
end, { desc = "Hover documentation" })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" })
vim.keymap.set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- ════════════════════════════════════════════════════════════════════════════
-- Marks
-- ════════════════════════════════════════════════════════════════════════════
-- Better add/remove marks
vim.keymap.set("n", "m", function()
	local line = vim.fn.line(".")
	local next_char = vim.fn.getcharstr()
	local mark = vim.fn.getpos("'" .. next_char)
	if mark[2] == line then
		vim.cmd("delmarks " .. next_char)
	else
		vim.cmd("mark " .. next_char)
	end
	vim.cmd("redraw!")
end)
