--     .___________. __  ___
--     |           ||  |/  /
--     `---|  |----`|  '  /
--         |  |     |    <
--         |  |     |  .  \
--         |__|     |__|\__\
--       ______   ______   .__   __.  _______  __    _______
--      /      | /  __  \  |  \ |  | |   ____||  |  /  _____|
--     |  ,----'|  |  |  | |   \|  | |  |__   |  | |  |  __
--     |  |     |  |  |  | |  . `  | |   __|  |  | |  | |_ |
--     |  `----.|  `--'  | |  |\   | |  |     |  | |  |__| |
--      \______| \______/  |__| \__| |__|     |__|  \______|
--
--
--     This is my personal configurations for vim, nvim.
--     You can customize it to solve your problems.
--

require('plugins')
require('mappings')
require('settings')
require "statusline"
require "topbufferline"
require("neoscroll").setup()

vim.g.colorful_transparent = 1
vim.cmd("colorscheme colorful")

require "treeSitter"
require "teleScope"
require "nvimTree"
require("nvim-autopairs").setup()
require 'colorizer'.setup {
  'css',
  'javascript',
  'vim',
  html = {
    mode = 'background'
  }
}

require "gitsignConfig"
require "nvim-lspconfig"
require "lspConfigs"
require "completion"

require "whichKey"
