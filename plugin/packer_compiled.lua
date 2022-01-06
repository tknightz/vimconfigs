-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/tknightz/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/tknightz/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/tknightz/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/tknightz/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tknightz/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\1\2h\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\rmappings\1\0\0\1\0\3\nextra\2\nbasic\2\rextended\2\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["bufdelete.nvim"] = {
    commands = { "Bdelete", "Bwipeout" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["clever-f.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-emoji"] = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["colorful.vim"] = {
    after = { "lualine.nvim", "indent-blankline.nvim", "nvim-treesitter", "nvim-bufferline.lua" },
    config = { "\27LJ\1\2\0\0\2\0\6\0\n4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\3\0%\1\4\0>\0\2\0027\0\5\0>\0\1\1G\0\1\0\bset\rcolorful\frequire7\t\t\t\t\tsyntax on\n\t\t\t\t\tfiletype plugin indent on\n\t\t\t\t\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/colorful.vim",
    url = "https://github.com/tknightz/colorful.vim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen", "DiffviewToggleFiles" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["ezterm.nvim"] = {
    commands = { "Ezterm", "EztermFind" },
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20plugins._ezterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/ezterm.nvim",
    url = "https://github.com/tknightz/ezterm.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\1\2�\1\0\0\4\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\4\0003\3\3\0:\3\5\2:\2\a\1>\0\2\1G\0\1\0\14overrides\1\0\0\fliteral\1\0\0\1\0\2\14__Mundo__\nMundo\22__Mundo_Preview__\14MundoDiff\nsetup\rfiletype\frequire\0" },
    loaded = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["fine-cmdline.nvim"] = {
    keys = { { "", ":" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/fine-cmdline.nvim",
    url = "https://github.com/VonHeikemen/fine-cmdline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins._gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16plugins._go\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["goto-preview"] = {
    commands = { "PreviewDef", "PreviewImpl", "PreviewClose" },
    config = { "\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25plugins.lsp._preview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  ["headlines.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14headlines\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/headlines.nvim",
    url = "https://github.com/lukas-reineke/headlines.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24plugins._indentline\frequire\0" },
    load_after = {
      ["colorful.vim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["is.vim"] = {
    keys = { { "", "/" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/is.vim",
    url = "https://github.com/haya14busa/is.vim"
  },
  ["lightspeed.nvim"] = {
    keys = { { "", "s" }, { "", "S" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21plugins._lualine\frequire\0" },
    load_after = {
      ["colorful.vim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["minimap.vim"] = {
    commands = { "Minimap", "MinimapToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/minimap.vim",
    url = "https://github.com/wfxr/minimap.vim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nui.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24plugins._bufferline\frequire\0" },
    load_after = {
      ["colorful.vim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp", "cmp-buffer", "cmp-path", "cmp-emoji" },
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18plugins._comp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins._colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    commands = { "LspStart" },
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17plugins._lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\1\2U\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\22background_colour\f#000000\nsetup\vnotify\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile" },
    config = { "\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\22plugins._nvimtree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "sphinx.nvim", "nvim-ts-rainbow", "nvim-treesitter-textobjects" },
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24plugins._treesitter\frequire\0" },
    load_after = {
      ["colorful.vim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    commands = { "TSContextToggle", "TSContextEnable" },
    config = { "\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\23treesitter-context\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    config = { "\27LJ\1\2I\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\28nvim-treesitter.configs\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins._fileicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["org-bullets.nvim"] = {
    config = { "\27LJ\1\2d\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\fsymbols\1\0\0\1\5\0\0\b◉\b○\b✸\b✿\nsetup\16org-bullets\frequire\0" },
    load_after = {
      ["orgmode.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/org-bullets.nvim",
    url = "https://github.com/akinsho/org-bullets.nvim"
  },
  ["orgmode.nvim"] = {
    after = { "org-bullets.nvim" },
    config = { "\27LJ\1\2n\0\0\2\0\6\0\n4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\3\0%\1\4\0>\0\2\0027\0\5\0>\0\1\1G\0\1\0\nsetup\21plugins._orgmode\frequire\28packadd nvim-treesitter\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/orgmode.nvim",
    url = "https://github.com/kristijanhusak/orgmode.nvim"
  },
  ["packer.nvim"] = {
    commands = { "PackerCompile", "PackerStatus", "PackerInstall", "PackerUpdate", "PackerLoad", "PackerClean" },
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20plugins._packer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  sniprun = {
    commands = { "SnipRun", "SnipInfo", "SnipReset" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["sphinx.nvim"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/sphinx.nvim",
    url = "https://github.com/stsewd/sphinx.nvim"
  },
  ["sqlupper.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/sqlupper.vim",
    url = "https://github.com/tknightz/sqlupper.vim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["tagalong.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/tagalong.vim",
    url = "https://github.com/AndrewRadev/tagalong.vim"
  },
  ["telescope-arecibo.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/telescope-arecibo.nvim",
    url = "https://github.com/nvim-telescope/telescope-arecibo.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-arecibo.nvim", "telescope-project.nvim" },
    commands = { "Telescope", "EztermFind" },
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins._telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "LspTrouble", "LspTroubleToggle", "LspTroubleOpen", "LspWorkplaceOpen" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-dadbod"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUI", "DBUIAddConnection", "DBUIToggle" },
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\23packadd vim-dadbod\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-easy-align"] = {
    commands = { "EasyAlign" },
    keys = { { "", "<Plug>{EasyAlign)" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fugitive"] = {
    commands = { "Git" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-instant-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-instant-markdown",
    url = "https://github.com/instant-markdown/vim-instant-markdown"
  },
  ["vim-jsx-pretty"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-jsx-pretty",
    url = "https://github.com/maxmellon/vim-jsx-pretty"
  },
  ["vim-matchup"] = {
    after_files = { "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-maximizer"] = {
    commands = { "MaximizerToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-mundo"] = {
    commands = { "MundoShow", "MundoToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-sandwich"] = {
    config = { "\27LJ\1\2O\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0000runtime macros/sandwich/keymap/surround.vim\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-sql-syntax"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/vim-sql-syntax",
    url = "https://github.com/shmup/vim-sql-syntax"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins._whichkey\frequire\0" },
    keys = { { "", "<leader>" }, { "", "<Space>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["window-jumping.lua"] = {
    commands = { "WindowJumping" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tknightz/.local/share/nvim/site/pack/packer/opt/window-jumping.lua",
    url = "https://github.com/tknightz/window-jumping.lua"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^lsp_signature"] = "lsp_signature.nvim",
  ["^notify"] = "nvim-notify",
  ["^nui"] = "nui.nvim",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: vim-dadbod-ui
time([[Setup for vim-dadbod-ui]], true)
try_loadstring("\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18plugins._dbui\frequire\0", "setup", "vim-dadbod-ui")
time([[Setup for vim-dadbod-ui]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21plugins._matchup\frequire\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Setup for: minimap.vim
time([[Setup for minimap.vim]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21plugins._minimap\frequire\0", "setup", "minimap.vim")
time([[Setup for minimap.vim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\22plugins._nvimtree\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\1\2�\1\0\0\4\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\4\0003\3\3\0:\3\5\2:\2\a\1>\0\2\1G\0\1\0\14overrides\1\0\0\fliteral\1\0\0\1\0\2\14__Mundo__\nMundo\22__Mundo_Preview__\14MundoDiff\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspTrouble lua require("packer.load")({'trouble.nvim'}, { cmd = "LspTrouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoToggle lua require("packer.load")({'vim-mundo'}, { cmd = "MundoToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerUpdate lua require("packer.load")({'packer.nvim'}, { cmd = "PackerUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PreviewDef lua require("packer.load")({'goto-preview'}, { cmd = "PreviewDef", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerInstall lua require("packer.load")({'packer.nvim'}, { cmd = "PackerInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSContextEnable lua require("packer.load")({'nvim-treesitter-context'}, { cmd = "TSContextEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspWorkplaceOpen lua require("packer.load")({'trouble.nvim'}, { cmd = "LspWorkplaceOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewToggleFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewToggleFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspTroubleOpen lua require("packer.load")({'trouble.nvim'}, { cmd = "LspTroubleOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MaximizerToggle lua require("packer.load")({'vim-maximizer'}, { cmd = "MaximizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipInfo lua require("packer.load")({'sniprun'}, { cmd = "SnipInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIToggle lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WindowJumping lua require("packer.load")({'window-jumping.lua'}, { cmd = "WindowJumping", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PreviewClose lua require("packer.load")({'goto-preview'}, { cmd = "PreviewClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerStatus lua require("packer.load")({'packer.nvim'}, { cmd = "PackerStatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerLoad lua require("packer.load")({'packer.nvim'}, { cmd = "PackerLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EztermFind lua require("packer.load")({'ezterm.nvim', 'telescope.nvim'}, { cmd = "EztermFind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoShow lua require("packer.load")({'vim-mundo'}, { cmd = "MundoShow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspStart lua require("packer.load")({'nvim-lspconfig'}, { cmd = "LspStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIAddConnection lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIAddConnection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspTroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "LspTroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PreviewImpl lua require("packer.load")({'goto-preview'}, { cmd = "PreviewImpl", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Minimap lua require("packer.load")({'minimap.vim'}, { cmd = "Minimap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUI lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUI", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipReset lua require("packer.load")({'sniprun'}, { cmd = "SnipReset", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bdelete lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bdelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bwipeout lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bwipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EasyAlign lua require("packer.load")({'vim-easy-align'}, { cmd = "EasyAlign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerCompile lua require("packer.load")({'packer.nvim'}, { cmd = "PackerCompile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ezterm lua require("packer.load")({'ezterm.nvim'}, { cmd = "Ezterm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSContextToggle lua require("packer.load")({'nvim-treesitter-context'}, { cmd = "TSContextToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PackerClean lua require("packer.load")({'packer.nvim'}, { cmd = "PackerClean", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Space> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>{EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>{EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> s <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> : <cmd>lua require("packer.load")({'fine-cmdline.nvim'}, { keys = ":", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> / <cmd>lua require("packer.load")({'is.vim'}, { keys = "/", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> S <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'tagalong.vim', 'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType sql ++once lua require("packer.load")({'sqlupper.vim', 'vim-sql-syntax'}, { ft = "sql" }, _G.packer_plugins)]]
vim.cmd [[au FileType org ++once lua require("packer.load")({'headlines.nvim', 'orgmode.nvim'}, { ft = "org" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'tagalong.vim'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'tagalong.vim', 'emmet-vim', 'vim-jsx-pretty'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType mysql ++once lua require("packer.load")({'vim-sql-syntax'}, { ft = "mysql" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'sphinx.nvim', 'vim-python-pep8-indent'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'emmet-vim', 'vim-jsx-pretty'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'headlines.nvim', 'vim-instant-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim'}, { ft = "css" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'colorful.vim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-matchup', 'neoscroll.nvim', 'vim-sandwich', 'gitsigns.nvim', 'Comment.nvim', 'nvim-colorizer.lua', 'todo-comments.nvim', 'clever-f.vim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/tknightz/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]], true)
vim.cmd [[source /home/tknightz/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]]
time([[Sourcing ftdetect script at: /home/tknightz/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]], false)
time([[Sourcing ftdetect script at: /home/tknightz/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]], true)
vim.cmd [[source /home/tknightz/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]]
time([[Sourcing ftdetect script at: /home/tknightz/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
