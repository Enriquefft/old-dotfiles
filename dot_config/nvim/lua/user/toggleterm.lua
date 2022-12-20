local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = function(term) -- Varidic terminal size
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  insert_mappings = true, -- Works on insert mode
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  persist_size = true,
  --direction = 'vertical' | 'horizontal' | 'tab' | 'float',
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
  },
  winbar = {
    enabled = true,
  }
})


-- Easy switch from terminal to buffer
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  -- Close terminals
  vim.api.nvim_buf_set_keymap(0, "t", "<M-1>", [[<Cmd>ToggleTerm<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<M-2>", [[<Cmd>ToggleTerm<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<M-3>", [[<Cmd>ToggleTerm<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })


-- function _LAZYGIT_TOGGLE()
--   lazygit:toggle()
-- end
