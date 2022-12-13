local status_ok, startup = pcall(require, "nvim-startup")

if not status_ok then
	return
end

startup.setup()
require "impatient"
