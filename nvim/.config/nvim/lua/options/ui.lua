-- ════════════════════════════════════════════════════════════════════════════
-- UI
-- ════════════════════════════════════════════════════════════════════════════
vim.o.updatetime = 500
vim.o.termguicolors = true -- Enable 24-bit RBG colors in terminal
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4       -- Keep a consistent 4-column gutter
vim.o.wrap = false
vim.o.breakindent = true    -- Wrapped lines preserve indentation
vim.o.showmode = false      -- Don't show mode in command line (shown in statusline)
vim.o.ruler = false         -- Don't show ruler (shown in statusline)
vim.o.winbar = '%t'         -- Filename in winbar (navic will use it if available)
vim.o.winborder = 'rounded' -- Rounded window for neovim
vim.o.cmdheight = 1         -- Break visual block (https://github.com/neovim/neovim/issues/20635)
vim.o.colorcolumn = "120"   -- Virtual Line at column 120
vim.opt.shortmess:append("I")
