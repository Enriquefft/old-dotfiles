return {

  ["NTBBloodbath/rest.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("rest-nvim").setup {
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        -- Jump to request line on run
        jump_to_request = false,
      }
    end,
  },

  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {

        -- Frontend
        "vue-language-server",
        "html-lsp",
        "tailwindcss-language-server",
        "eslint-lsp",
        "emmet-ls",
        "prettier",

        -- Python
        "pyright",
        "autopep8",

        -- Lua
        "lua-language-server",
        "stylua",

        -- CPP
        "clangd",
        "clang-format",

        "sqls",
        "bash-language-server",
        "arduino-language-server",
        "cmake-language-server",
        "texlab",
        "textlint",
      },
    },
  },

  ["iamcco/markdown-preview.nvim"] = {

    ft = "markdown",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      require "custom.plugins.markdown-preview"
    end,
  },

  ["zbirenbaum/copilot.lua"] = {
    event = "InsertEnter",
    config = function()
      vim.schedule(function()
        require("copilot").setup()
      end)
    end,
  },

  ["mfussenegger/nvim-dap"] = {
    config = function()
      require "custom.plugins.dap"
    end,
  },

  ["rcarriga/nvim-dap-ui"] = {
    requires = "mfussenegger/nvim-dap",
  },

  ["zbirenbaum/copilot-cmp"] = {
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  ["hrsh7th/nvim-cmp"] = {
    override_options = {
      sources = {
        { name = "copilot" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      ensure_installed = {
        "lua",
        "http",
        "json",
      },
    },
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["fladson/vim-kitty"] = {
    ft = "kitty",
  },
}
