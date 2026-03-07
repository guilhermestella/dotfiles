return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"bash",
					"c",
					"css",
					"html",
					"java",
					"javascript",
					"json",
					"latex",
					"lua",
					"luadoc",
					"luap",
					"markdown",
					"markdown_inline",
					"proto",
					"python",
					"query",
					"regex",
					"rust",
					"scss",
					"svelte",
					"swift",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				},
				auto_install = true,
			})
			-- Enable treesitter-based highlighting and indentation
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
			vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	},
}
