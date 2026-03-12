-- ════════════════════════════════════════════════════════════════════════════
-- General
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "➜ Quit All" })

-- ════════════════════════════════════════════════════════════════════════════
-- <Esc> Action
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<Esc>", function()
	local closed = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative ~= "" then
			vim.api.nvim_win_close(win, false)
			closed = true
		end
	end
	if not closed then
		vim.cmd("nohlsearch")
	end
end, { noremap = true, silent = true, desc = "Esc Action" })

-- ════════════════════════════════════════════════════════════════════════════
-- Buffer Navigation
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<leader>bn","<cmd>enew<cr>",{ desc = "➜ New" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "➜ Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "➜ Buffer" })

-- ════════════════════════════════════════════════════════════════════════════
-- Window Navigation (no prefix for speed)
-- ════════════════════════════════════════════════════════════════════════════

-- Tab navigation is defined in tmux.lua plugin

-- Resize
vim.keymap.set({ "t", "n" }, "<M-k>", ":resize -2<CR>", { desc = "Increase height" })
vim.keymap.set({ "t", "n" }, "<M-j>", ":resize +2<CR>", { desc = "Decrease height" })
vim.keymap.set({ "t", "n" }, "<M-h>", ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set({ "t", "n" }, "<M-l>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- ════════════════════════════════════════════════════════════════════════════
-- Move Block (Visual Mode)
-- ════════════════════════════════════════════════════════════════════════════

vim.keymap.set("n", "<A-J>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-K>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-J>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move block down" })
vim.keymap.set("v", "<A-K>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move block up" })

-- ════════════════════════════════════════════════════════════════════════════
-- Indentation
-- ════════════════════════════════════════════════════════════════════════════
-- Better indenting (stay in visual mode)
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- ════════════════════════════════════════════════════════════════════════════
-- Diagnostics
-- ════════════════════════════════════════════════════════════════════════════
local diagnostic_opts = { focusable = false }
vim.keymap.set("n", "<C-w>d", function()
	vim.diagnostic.open_float(diagnostic_opts)
end, { desc = "➜ Show Diagnostic" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ float = { focusable = false } })
end, { desc = "➜ Diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ float = { focusable = false } })
end, { desc = "➜ Diagnostic" })

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
