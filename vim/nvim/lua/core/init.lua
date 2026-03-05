require('core.keymaps')
require('core.options')
require('core.autocmds')
require('lazy').setup({
    spec = {
        { import = 'core.plugins.ui' },
        { import = 'core.plugins.code' },
        { import = 'core.plugins.nav' },
        { import = 'core.plugins.git' },
    },
})
