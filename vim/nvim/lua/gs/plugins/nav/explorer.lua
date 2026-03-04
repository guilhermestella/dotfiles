return {
    {
        'nvim-tree/nvim-tree.lua',
        cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFocus' },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        keys = {
            { "<C-w>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
        },
        config = function()
            local builtin = require('nvim-tree')

            builtin.setup {
                sync_root_with_cwd = false,
                respect_buf_cwd = false,
                disable_netrw = true,
                hijack_netrw = true,
                sort_by = 'case_sensitive',
                update_focused_file = {
                    enable = false,
                    update_root = false,
                },
                view = {
                    width = 30,
                    side = 'right',
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
                on_attach = function(bufnr)
                    local api = require('nvim-tree.api')

                    local function opts(desc)
                        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                    end

                    -- default mappings
                    api.map.on_attach.default(bufnr)

                    -- custom mappings
                    vim.keymap.set("n", "?", api.tree.toggle_help,   opts("Help"))
                    vim.keymap.set('n', 'l', api.node.open.edit,    opts('Expand/Open'))
                    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
                end,
            }
        end,
    }
}
