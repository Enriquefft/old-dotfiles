-- Available Lsp Servers
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local lsp_sources = {
	--"arduino_language_server",
	--"asm_lsp",
	--"awk_ls",
	"bashls",
	"clangd",
	"neocmake",
	--"cssls",
	--"cssmodules_ls",
	--"dotls",
	--"emmet_ls",
	--"eslint",
	--"graphql",
	--"html",
	"jsonls",
	--"yamlls",
	"ltex",
	"pylsp",
	--"r_language_server",
	--"sqlls",
	"sumneko_lua",
	--"tailwindcss",
	--"tsserver",
	"texlab",
	--"volar",
}

local null_sources = {
	"stylua",
	"black",
	"shellharden",
	--"sql_formatter",
	--
	"gersemi",
	--"clang_format",
	"cmake_lint",
}

local dap_sources = {}

return {
	lsp_sources = lsp_sources,
	null_sources = null_sources,
	dap_sources = dap_sources,
}
