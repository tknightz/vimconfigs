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
--
require("settings._preload")
require('settings._mappings')
require('settings._system')
require('plugins._packer')
require("plugins._whichkey")
require("settings._postload")
