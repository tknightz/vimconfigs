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

local base16 = require 'base16'
base16(base16.themes['material-darker'], true)
-- vim.cmd("colorscheme ikolor")

require "treeSitter"
require "teleScope"
require "nvimTree"
require("nvim-autopairs").setup()

require "gitsignConfig"
require "nvim-lspconfig"
require "lspConfigs"
require "completion"

require "whichKey"
