local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local conf_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not conf_status_ok then
  return
end

configs.setup({
  ensure_installed = require("user.TSlangs"),
  -- ensure_installed = "all", -- one of "all" or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true, -- install languages automatically when entering buffer

  highlight = {
    enable = true, -- false will disable the whole extension
    -- disable = { "" }, -- list of language that will be disabled
    disable = function(lang, buf) -- Disable automatically for very large files
      local max_filesize = 200 * 1024 -- 200 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = { -- TODO
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  autopairs = {
    enable = true,
    disable = "",
  },

  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  indent = {
    enable = true,

  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },


})
