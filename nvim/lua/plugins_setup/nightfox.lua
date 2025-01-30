require('plugins')

require('nightfox').setup {
  specs = {
    nordfox = { -- can be all = {...
      syntax = {
      },
    },
  },
}

vim.cmd.colorscheme 'nordfox'
