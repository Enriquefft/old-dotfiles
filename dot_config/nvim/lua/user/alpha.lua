local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

-- Use dashboard as base theme
local base = require "alpha.themes.dashboard"

local buttons = base.section.buttons

buttons.val = {
  base.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  base.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  base.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  base.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  base.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  base.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
  base.button("q", " " .. " Quit", ":qa<CR>"),
}

local header = base.section.header

header.val = require("user.headers")

local footer = base.section.footer

footer.val = "HybridZ"

local config = {
  layout = {
    { type = "padding", val = 2 },
    header,
    { type = "padding", val = 2 },
    buttons,
    footer,
  },
  opts = {
    margin = 5,
  },
}

--[[

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
--alpha.setup(dashboard.opts)
--]]

alpha.setup(config)
