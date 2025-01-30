require('plugins')

local palette = require 'nordic.colors'

require('nordic').setup {
  bold_keywords = true,
  italic_comments = false,
  transparent_bg = false,
  bright_border = false,
  reduced_blue = true,
  swap_background = false,
  override = {
  },
  cursorline = {
    bold = false,
    bold_number = true,
    theme = 'dark',
    blend = 1.0,
  },
  noice = {
    style = 'classic',
  },
  telescope = {
    style = 'classic',
    TelescopePromptTitle = {
      fg = palette.red.bright, -- no effect ??
      ff = palette.red.bright,
    },
  },
  leap = {
    dim_backdrop = false,
  },
  ts_context = {
    dark_background = true,
  },
}
