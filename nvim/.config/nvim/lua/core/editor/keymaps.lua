-- ════════════════════════════════════════════════════════════════════════════
-- Editing Keymaps
-- ════════════════════════════════════════════════════════════════════════════
local fn = require "core.editor.functions"
local set = vim.keymap.set

-- ════════════════════════════════════════════════════════════════════════════
-- Text objects behavior
-- ════════════════════════════════════════════════════════════════════════════
set({ "x", "o" }, "af", fn.select_around_function)
set({ "x", "o" }, "if", fn.select_inner_function)
set({ "x", "o" }, "ac", fn.select_around_class)
set({ "x", "o" }, "ic", fn.select_inner_class)
set({ "x", "o" }, "aa", fn.select_around_argument)
set({ "x", "o" }, "ia", fn.select_inner_argument)
set({ "x", "o" }, "as", fn.select_around_scope)

set({ "n", "x", "o" }, "]f", fn.goto_next_function, { desc = "➜ Function" })
set({ "n", "x", "o" }, "[f", fn.goto_previous_function, { desc = "➜ Function" })

-- ════════════════════════════════════════════════════════════════════════════
-- Search word without jump
-- ════════════════════════════════════════════════════════════════════════════
set("n", "*", "*N", { noremap = true })

-- ════════════════════════════════════════════════════════════════════════════
-- Indentation
-- ════════════════════════════════════════════════════════════════════════════
set("v", "<", "<gv", { desc = "Indent Left" })
set("v", ">", ">gv", { desc = "Indent Right" })

-- ════════════════════════════════════════════════════════════════════════════
-- Move Block (Visual Mode)
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<A-J>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
set("n", "<A-K>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
set("v", "<A-J>", ":m '>+1<CR><CR>gv=gv", { silent = true, desc = "Move block down" })
set("v", "<A-K>", ":m '<-2<CR><CR>gv=gv", { silent = true, desc = "Move block up" })

-- ════════════════════════════════════════════════════════════════════════════
-- Marks
-- ════════════════════════════════════════════════════════════════════════════
set("n", "m", fn.toggle_mark)
set("n", "<M-m>", fn.show_marks, { desc = "➜ Marks" })
