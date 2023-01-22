require("user.mason.lsp_config").setup()
local on_attach = require("user.mason.lsp_config").on_attach
local capabilities = require("user.mason.lsp_config").capabilities

local lsp_config = require("lspconfig")

return {
	function(server_name)
		lsp_config[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	["pylsp"] = function()
		lsp_config.pylsp.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						autopep8 = {
							enabled = false,
						},
						yapf = {
							enabled = false,
						},
						pycodestyle = {
							select = {
								"E",
								"W505",
							},
						},
						pydocstyle = {
							enabled = false,
							convention = "google",
						},
						pylsp_mypy = {
							enabled = true,
							live_mode = true,
						},
					},
				},
			},
		})
	end,

	["clangd"] = function()
		-- change offset_encodings
		local clangd_capabilities = capabilities
		clangd_capabilities.offsetEncoding = { "utf-16" }
		lsp_config.clangd.setup({
			on_attach = on_attach,
			capabilities = clangd_capabilities,
		})
	end,
}
