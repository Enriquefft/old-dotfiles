local settings = {
	ui = {
		border = "solid",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},

	log_level = vim.log.levels.INFO,
	--log_level = vim.log.levels.DEBUG,
	max_concurrent_installers = 4,
}
require("mason").setup(settings)

local masonServers = require("user.mason.masonServers")

require("mason-lspconfig").setup({
	ensure_installed = masonServers.lsp_sources,
	automatic_setup = true,
})
require("mason-nvim-dap").setup({
	ensure_installed = masonServers.dap_sources,
	automatic_setup = true,
})
require("mason-null-ls").setup({
	ensure_installed = masonServers.null_sources,
	automatic_setup = true,
})

local lsp_handlers = require("user.mason.lsp_handlers")
local null_ls_handlers = require("user.mason.null_ls_handlers")
local dap_handlers = require("user.mason.dap_handlers")

-- Auto-handlers
require("mason-lspconfig").setup_handlers(lsp_handlers)
require("mason-null-ls").setup_handlers(null_ls_handlers)
require("mason-nvim-dap").setup_handlers(dap_handlers)

-- Setups
require("user.mason.null-ls")
