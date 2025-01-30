require('plugins')

local theme = require('lualine.themes.catppuccin')
theme.normal.c.bg = nil

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { 'buffers', },
    },
  },
}
