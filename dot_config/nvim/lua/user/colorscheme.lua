-- Installed colorschemes: solarized
local colorscheme = "solarized"

-- Solarized variants: _none_ low, high, flat
local variation = ""

variation = "-" .. variation


-- Default colorscheme
local default = "murphy"

if variation ~= nil and variation ~= "-" and variation ~= "" then
		colorscheme = colorscheme .. variation
end


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		pcall(vim.cmd, "colorscheme " .. default)
		return
end
