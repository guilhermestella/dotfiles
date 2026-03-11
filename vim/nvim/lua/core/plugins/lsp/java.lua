return {
	{
		"nvim-java/nvim-java",
		config = function()
			require("java").setup({
				vim.lsp.enable("jdtls"),
		})
			vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
				pattern = "*.java",
				callback = function()
					-- Only trigger if file is empty
					local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
					local is_empty = #lines == 0 or (#lines == 1 and lines[1] == "")
					if not is_empty then
						return
					end

					local filepath = vim.fn.expand("%:p")
					local package = filepath:match("java/(.+)/[^/]+%.java$")
					if package then
						package = package:gsub("/", ".")
					end

					local classname = vim.fn.expand("%:t:r")

					local new_lines = {}
					if package then
						table.insert(new_lines, "package " .. package .. ";")
						table.insert(new_lines, "")
					end
					table.insert(new_lines, "public class " .. classname .. " {")
					table.insert(new_lines, "    ")
					table.insert(new_lines, "}")

					vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
					vim.api.nvim_win_set_cursor(0, { #new_lines - 1, 4 })
				end,
			})
		end,
	},
}
