local set = vim.keymap.set
local fn = require "core.ui.notifications.functions"

set("n", "<M-n>", fn.show_notifications, { desc = "➜ Notifications" })
