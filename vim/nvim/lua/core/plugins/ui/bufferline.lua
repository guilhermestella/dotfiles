return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				middle_mouse_command = "bdelete! %d",
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				separator_style = "thick",
				indicator = {
					style = "underline",
					icon = "▎",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				left_trunc_marker = "󰜌",
				right_trunc_marker = "󰜌",
			},
		})
	end,
}
