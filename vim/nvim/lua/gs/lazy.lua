require('lazy').setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	"christoomey/vim-tmux-navigator",
	"lewis6991/gitsigns.nvim",
})
