local dap = require("dap")
local adapters = dap.adapters
local configs = dap.configurations

return {
	function(source_name)
		-- all sources with no handler get passed here

		-- Keep original functionality of `automatic_setup = true`
		require("mason-nvim-dap.automatic_setup")(source_name)
	end,
	python = function(source_name)
		require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python3")
	end,
	cppdbg = function(source_name)
		adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/enrique/.local/share/nvim/mason/bin/OpenDebugAD7",
			name = "cppdbg",
		}
		configs.cpp = {
			{
				type = "cppdbg",
				name = "Launch",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				runInTerminal = false,
			},
		}
	end,
}
