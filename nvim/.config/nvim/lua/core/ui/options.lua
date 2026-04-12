-- ════════════════════════════════════════════════════════════════════════════
-- UI
-- ════════════════════════════════════════════════════════════════════════════
local set = vim.o
local seto = vim.opt

set.updatetime = 500
set.number = true
set.relativenumber = true
set.numberwidth = 4 -- Keep a consistent 4-column gutter
set.wrap = false
set.breakindent = true -- Wrapped lines preserve indentation
set.showmode = false -- Don't show mode in command line (shown in statusline)
set.ruler = false -- Don't show ruler (shown in statusline)
set.colorcolumn = "120" -- Virtual Line at column 120
set.linebreak = true -- Wrap lines at word boundaries
seto.shortmess:append "I"
seto.fillchars:append { eob = " " }
seto.signcolumn = "yes:2"
