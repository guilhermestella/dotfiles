require('gitsigns').setup({
	-- Actions
    on_attach = function(bufnr)
		local gitsigns = require('gitsigns')

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map('n', '<leader>y', function()
			gitsigns.blame({ full = true })
		end)
	end
})
