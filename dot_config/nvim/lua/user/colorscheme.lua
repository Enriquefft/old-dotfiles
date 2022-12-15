local scheme = "solarized"
local variant = "flat"
local opts = {}

-- scheme must be present
if not scheme then
  print("No colorscheme provided")
  return
end

-- Defaults
opts = opts or {}
variant = variant or ""

if variant ~= "" then
  variant = "-" .. variant
end

-- if opts is empty
if not vim.tbl_isempty(opts) then
  require(scheme).setup(opts)
end

-- catch error
if not pcall(function()
  vim.cmd("colorscheme " .. scheme .. variant)
end)
then
  -- Default
  vim.cmd("colorscheme habamax")
  vim.api.nvim_echo({ {"Colorscheme does not exists, defaulting to habamax"} }, false, {})
end
