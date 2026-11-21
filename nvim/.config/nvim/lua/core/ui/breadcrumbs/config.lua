local barbecue = require "barbecue"
local navic = require "nvim-navic"

barbecue.setup {
    attach_navic = false,
}

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("core.ui.breadcrumbs", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or not client.server_capabilities.documentSymbolProvider then
            return
        end

        if not navic.is_available(args.buf) then
            navic.attach(client, args.buf)
        end
    end,
})
