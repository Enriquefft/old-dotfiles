local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- C/C++
  b.formatting.clang_format,

  -- python
  b.formatting.autopep8,

  -- Lua
  b.formatting.stylua,

  -- Arduino
  b.formatting.astyle.with {
    filetypes = { "arduino" },
  },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {

        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  debug = true,
  sources = sources,
}
