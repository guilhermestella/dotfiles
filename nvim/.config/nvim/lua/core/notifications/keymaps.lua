local set = vim.keymap.set
local fn = require "core.notifications.functions"

set("n", "<M-n>", fn.show_notifications, { desc = "➜ Notifications" })
