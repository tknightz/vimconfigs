local wk = require('which-key')


wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 25, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = {"<leader>", "<C-r>"} -- or specifiy a list manually
}

wk.register({
	f = {
		name = "file",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		s = { "<cmd>update<cr>", "Save File" },
		n = { "<cmd>new<cr>", "New File" },
    r = { "<cmd>Telescope live_grep<cr>", "Grep" }
	},

  n = { "<cmd>NvimTreeToggle<cr>", "nvimtree" },

  w = {
    name = '+windows' ,
    w = {'<C-W>w'     , 'other-window'          },
    d = {'<C-W>c'     , 'delete-window'         },
    ["-"] = {'<C-W>s'     , 'split-window-below'    },
    ["/"] = {'<C-W>v'     , 'split-window-right'    },
    [2] = {'<C-W>v'     , 'layout-double-columns' },
    h = {'<C-W>h'     , 'window-left'           },
    i = {'<cmd>Telescope windows<cr>', 'iWindows'},
    j = {'<C-W>j'     , 'window-below'          },
    l = {'<C-W>l'     , 'window-right'          },
    k = {'<C-W>k'     , 'window-up'             },
    H = {'<C-W>5<'    , 'expand-window-left'    },
    J = {'resize +5'  , 'expand-window-below'   },
    L = {'<C-W>5>'    , 'expand-window-right'   },
    K = {'resize -5'  , 'expand-window-up'      },
    ["="] = {'<C-W>='     , 'balance-window'        },
    s = {'<C-W>x'     , 'swap window'           },
    v = {'<C-W>v'     , 'split-window-below'    },
    m = {'<cmd>MaximizerToggle<cr>'     , 'Max-min toggle'    },
    t = {
      name    = 'transform',
      h       = {'<C-W>tH'       , 'swap-window-vertical' },
      k       = {'<C-W>tK'       , 'swap-window-horizontal' },
    },
  },

  y = { "<cmd>%y+<cr>", "yank to clipboard"},
  
  g = { 
    name = "Git",
    f = {"<cmd>Telescope git_files<cr>", "files"},
    s = {"<cmd>Telescope git_stash<cr>", "stash"},
    b = {"<cmd>Telescope git_branches<cr>", "branches"},
    c = {"<cmd>Telescope git_commits<cr>", "commits"},
    d = {"<cmd>Telescope git_status<cr>", "diff"},
  },

  b = {
    name = "Buffers",
    n = {"<cmd>bnext<cr>", "next"},
    p = {"<cmd>bprevious<cr>", "previous"},
    d = {"<cmd>bd<cr>", "delete"},
    ["/"] = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "search"},
    i = {"<cmd>Telescope buffers<cr>", "iBuffers"},
  },

  p = {
    name = "Plugins",
    i = {"<cmd>PackerInstall<cr>", "install"},
    c = {"<cmd>PackerClean<cr>", "clean"},
    C = {"<cmd>PackerCompile<cr>", "compile"},
    s = {"<cmd>PackerSync<cr>", "sync"},
    S = {"<cmd>PackerStatus<cr>", "status"},
    u = {"<cmd>PackerUpdate<cr>", "update"},
    l = {"<cmd>PackerLoad<cr>", "load"}
  },

  q = {
    name = "quit",
    a = {"<cmd>qa<cr>", "all"},
    q = {"<cmd>q<cr>", "current_file"},
    ['!'] = {"<cmd>q!<cr>", "no save"}
  },

}, { prefix = "<Leader>"})
