local lspconfig = require "lspconfig"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
capabilities.offsetEncoding = { "utf-16" }

local servers = { "texlab", "clangd", "pyright", "sqls", "tailwindcss", "eslint", "cmake", "cssls", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.ltex.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ltex = {
      language = "es",
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "es",
      },
      checkFrequency = "edit",
      diagnosticsDelay = 300,
      setenceCacheSize = 2000,
      dictionary = {
        "/home/enrique/.config/nvim/spell/dictionary.txt",
      },
      disabledRules = {
        -- "WHITESPACE_RULE",
      },
      hiddenFalsePositives = {
        -- "HUNSPELL_RULE",
      },
      additionalCommands = {
        -- "addBadWord",
        -- "removeBadWord",
      },
      additionalEnvironments = {
        -- "newenvironment",
      },
      additionalLatexCommands = {
        -- "newcommand",
        -- "renewcommand",
      },
      additionalLatexEnvironments = {
        -- "newenvironment",
      },
    },
  },
}

lspconfig.arduino_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "arduino-language-server",
    "-cli-config",
    "/home/enrique/.arduino15/arduino-cli.yaml",
    "-fqbn",
    "arduino:avr:uno",
    "-cli",
    "arduino-cli",
    "-clangd",
    "clangd",
  },
}

lspconfig.sumneko_lua.setup {

  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

--[[
local function get_typescript_server_path(root_dir)
  local util = require "lspconfig.util"

  local global_ts = "/home/enrique/.local/share/pnpm/global/5/node_modules/typescript/lib"
  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ""

  local function check_dir(path)
    found_ts = util.path.join(path, "node_modules", "typescript", "lib")
    if util.path.exists(found_ts) then
      return path
    end
  end

  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

lspconfig.volar.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "typescript", "javascript", "vue", "json" },
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
}
--]]
