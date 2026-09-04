local snacks = require "snacks"
local events = require "neo-tree.events"
local barbar_api = require "barbar.api"
local get_width = vim.api.nvim_win_get_width

local M = {}

local source_map = {
    ["filesystem"] = "󰉓 Files",
    ["buffers"] = "󰈚 Buffers",
    ["git_status"] = "󰊢 Git",
}

local function toggle(source, reveal)
    local rev = reveal and " reveal " or ""

    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)

    if buf_name:match "neo%-tree" and buf_name:match(source) then
        vim.cmd("Neotree " .. source .. " close")
    else
        vim.cmd("Neotree " .. source .. " focus " .. rev .. " left")
    end
end

function M.focus_filesystem()
    toggle("filesystem", true)
end

function M.toggle_filesystem()
    toggle("filesystem", false)
end

function M.toggle_buffers()
    toggle("buffers", true)
end

function M.toggle_git_status()
    toggle("git_status", true)
end

function M.delete_buffer(bufnr)
    vim.notify "test"
    snacks.bufdelete(bufnr)
end

function M.on_move(data)
    snacks.rename.on_rename_file(data.source, data.destination)
end

function M.on_open(args)
    if args.position == "left" or args.position == "right" then
        local window_width = get_width(args.winid)
        local source_name = source_map[args.source]
        barbar_api.set_offset(window_width, source_name, nil, args.position)
    end
end

function M.on_close(args)
    barbar_api.set_offset(0, nil, nil, args.position)
end

M.explorer_events = events

return M
