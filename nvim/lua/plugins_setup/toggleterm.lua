require('plugins')

require('toggleterm').setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  autochdir = false,
  insert_mappings = true,
  terminal_mappings = true,
  float_opts = {
    border = 'single',
  },
  winbar = {
    enabled = false,
  },
})

