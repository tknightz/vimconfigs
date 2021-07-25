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
      
require('plugins._packer')
require("settings._preload")

-- Customization
require('settings._mappings')
require('settings._system')
require("plugins._bufferline")
require("plugins._tabline")
require("plugins._treesitter")
require("plugins._telescope")
require("plugins._nvimtree")
require("plugins._comp")
require("plugins._whichkey")
require("plugins._lsp")
require("plugins._lspkind")
require("plugins._lspsaga")
require("plugins._colorizer")

-- Default
require("neoscroll").setup()
require("nvim-autopairs").setup()

require("settings._postload")
