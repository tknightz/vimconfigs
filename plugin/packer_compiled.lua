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
local package_path_str = "/home/tulen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tulen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tulen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tulen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tulen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  ["bufdelete.nvim"] = {
    commands = { "Bdelete", "Bwipeout" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/bufdelete.nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins._galaxyline\frequire\0" },
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins._gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins._go\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/go.nvim"
  },
  ["indent-blankline.nvim"] = {
    commands = { "IndentBlanklineToggle", "IndentBlanklineEnable" },
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins._indentline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["is.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/is.vim"
  },
  kommentary = {
    keys = { { "", "<Plug>kommentary_line_default" }, { "", "<Plug>kommentary_visual_default" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins._lspkind\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["neoscroll.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins._bufferline\frequire\0" },
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins._colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/tulen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins._comp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins._lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    commands = { "ToggleTerm" },
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins._toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins._treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins._telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ["vim-closetag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/vim-closetag"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easy-align"] = {
    commands = { "EasyAlign" },
    keys = { { "", "<Plug>{EasyAlign)" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-fugitive"] = {
    commands = { "Git" },
    loaded = false,
    needs_bufread = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-instant-markdown"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/vim-instant-markdown"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-maximizer"] = {
    commands = { "MaximizerToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/vim-maximizer"
  },
  ["vim-mundo"] = {
    commands = { "MundoShow", "MundoToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/vim-mundo"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["window-jumping.lua"] = {
    commands = { "WindowJumping" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tulen/.local/share/nvim/site/pack/packer/opt/window-jumping.lua"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins._nvimtree\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins._bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins._galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file IndentBlanklineEnable lua require("packer.load")({'indent-blankline.nvim'}, { cmd = "IndentBlanklineEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file EasyAlign lua require("packer.load")({'vim-easy-align'}, { cmd = "EasyAlign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Bdelete lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bdelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file MundoShow lua require("packer.load")({'vim-mundo'}, { cmd = "MundoShow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file MundoToggle lua require("packer.load")({'vim-mundo'}, { cmd = "MundoToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file IndentBlanklineToggle lua require("packer.load")({'indent-blankline.nvim'}, { cmd = "IndentBlanklineToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file ToggleTerm lua require("packer.load")({'nvim-toggleterm.lua'}, { cmd = "ToggleTerm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Bwipeout lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bwipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file MaximizerToggle lua require("packer.load")({'vim-maximizer'}, { cmd = "MaximizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file WindowJumping lua require("packer.load")({'window-jumping.lua'}, { cmd = "WindowJumping", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>{EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>{EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>kommentary_visual_default <cmd>lua require("packer.load")({'kommentary'}, { keys = "<lt>Plug>kommentary_visual_default", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>kommentary_line_default <cmd>lua require("packer.load")({'kommentary'}, { keys = "<lt>Plug>kommentary_line_default", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-instant-markdown', 'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'emmet-vim', 'vim-closetag'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'emmet-vim', 'vim-closetag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-python-pep8-indent'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim', 'vim-closetag'}, { ft = "html" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'lspkind-nvim', 'nvim-lspconfig', 'nvim-treesitter'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'is.vim', 'nvim-colorizer.lua', 'playground', 'trouble.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'neoscroll.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe', 'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/tulen/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/tulen/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/tulen/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
