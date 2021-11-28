local wk = require('which-key')
local util = require('util')
local orgmode = require('plugins._orgmode')


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
  operators = { gc = "Comments", ["v"] = "Visual Mode" },
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
    width = { min = 25, max = 35 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = {"<leader>", "<C-r>"} -- or specifiy a list manually
}

wk.register({
  -- Files
  f = {
    name = "File",
    f = { "<cmd>Telescope find_files hidden=true<cr>", "Find File" },
    s = { "<cmd>update<cr>",                           "Save File" },
    n = { "<cmd>new<cr>",                              "New File" },
    m = { "<cmd>Telescope media_files<cr>",            "media_files" },
    r = { "<cmd>Telescope live_grep<cr>",              "Grep" }
  },

  -- Windows
  w = {
    name = '+windows' ,
    w     = {'<C-W>w',                     'other-window'          },
    d     = {'<C-W>c',                     'delete-window'         },
    ["-"] = {'<C-W>s',                     'split-window-below'    },
    ["/"] = {'<C-W>v',                     'split-window-right'    },
    [2]   = {'<C-W>v',                     'layout-double-columns' },
    h     = {'<C-W>h',                     'window-left'           },
    i     = {'<cmd>Telescope windows<cr>', 'iWindows'              },
    j     = {'<C-W>j',                     'window-below'          },
    l     = {'<C-W>l',                     'window-right'          },
    k     = {'<C-W>k',                     'window-up'             },
    H     = {'<C-W>5<',                    'expand-window-left'    },
    J     = {'<cmd>resize +5<cr>',         'expand-window-below'   },
    L     = {'<C-W>5>',                    'expand-window-right'   },
    K     = {'<cmd>resize -5<cr>',         'expand-window-up'      },
    ["="] = {'<C-W>=',                     'balance-window'        },
    s     = {'<C-W>x',                     'swap window'           },
    v     = {'<C-W>v',                     'split-window-below'    },
    m     = {'<cmd>MaximizerToggle<cr>',   'Max-min toggle'        },
    t = {
      name    = 'transform',
      j       = {'<cmd>wincmd J<cr>'       , 'swap-window-vertical' },
      h       = {'<cmd>wincmd H<cr>'       , 'swap-window-horizontal' },
    },
  },

  -- Git
  g = {
    name = "Git",
    f = {"<cmd>Telescope git_files<cr>",    "files"},
    s = {"<cmd>Telescope git_status<cr>",   "status"},
    S = {"<cmd>Telescope git_stash<cr>",    "stash"},
    b = {"<cmd>Telescope git_branches<cr>", "branches"},
    c = {"<cmd>Telescope git_commits<cr>",  "commits"},
    d = {
      name = "diff",
      o = {"<cmd>DiffviewOpen<cr>",         "open"},
      c = {"<cmd>DiffviewClose<cr>",        "close"},
      f = {"<cmd>Telescope git_status<cr>", "files"},
      h = {"<cmd>DiffviewFileHistory<cr>",  "history"},
    },
    n = {"<cmd>Gitsigns next_hunk<cr>",     "next hunk"},
    p = {"<cmd>Gitsigns previous_hunk<cr>", "previous hunk"},
    v = {"<cmd>Gitsigns preview_hunk<cr>",  "view hunk"},
    w = {"<cmd>Gitsigns blame_line<cr>",    "who code it"},
    h = {"<cmd>Gitsigns toggle_linehl<cr>", "highlight toggle"}
  },

  -- Buffers
  b = {
    name = "Buffers",
    n = {"<cmd>bnext<cr>",                                   "next"},
    p = {"<cmd>bprevious<cr>",                               "previous"},
    d = {"<cmd>Bdelete<cr>",                                 "delete"},
    ["/"] = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "search"},
    i = {"<cmd>Telescope buffers<cr>",                       "iBuffers"},
    j = {"<cmd>BufferLinePick<cr>",                          "jump"},
    s = {"<cmd>BufferLineSortByRelativeDirectory<cr>",       "sort"}
  },

	e = {
		name = "editor",
		r = {util.replace, "replacement"},
		h = {"<cmd>set hlsearch!<cr>", "highlight"}
	},

  -- Packer
  p = {
    name = "Plugins",
    i = {"<cmd>PackerInstall<cr>", "install"},
    c = {"<cmd>PackerClean<cr>",   "clean"},
    C = {"<cmd>PackerCompile<cr>", "compile"},
    s = {"<cmd>PackerSync<cr>",    "sync"},
    S = {"<cmd>PackerStatus<cr>",  "status"},
    u = {"<cmd>PackerUpdate<cr>",  "update"},
    l = {"<cmd>PackerLoad<cr>",    "load"}
  },

  t = {
    name = "terminal",
    k = { "<cmd>Ezterm top<cr>", "top" },
    j = { "<cmd>Ezterm bottom<cr>", "bottom" },
    l = { "<cmd>Ezterm right<cr>", "right" },
    h = { "<cmd>Ezterm left<cr>", "left" },
    c = { "<cmd>Ezterm<cr>", "center" },
    i = { "<cmd>lua require('ezterm').ezterm_command()<cr>", "i-term" },
  },

  u = {
    name = "Unittest",
    r = {"<cmd>Ultest<cr>",            "run"},
    a = {"<cmd>UltestAttach<cr>",      "attach"},
    s = {"<cmd>UltestSummary<cr>",     "summary"},
    o = {"<cmd>UltestOutput<cr>",      "output"},
    d = {"<cmd>UltestDebug<cr>",       "debug"},
    x = {"<cmd>UltestStop<cr>",        "stop"},
    j = {"<Plug>(ultest-output-jump)", "jump"}
  },
  j = {"<cmd>WindowJumping<cr>",   "jump"},
  y = { "<cmd>%y+<cr>",            "yank to clipboard"},
  n = { "<cmd>NvimTreeToggle<cr>", "nvimtree" },


  -- Spelling
  S = {
    name = "Spelling",
    t = {"<cmd>set spell!<cr>", "toggle"},
    f = {"<cmd>Telescope spell_suggest<cr>", "fix"}
  },

  -- Searcher Telescope
  s = {
    name = "Search",
    s = { "<cmd>Telescope<cr>",                              "searcher" },
    f = { "<cmd>Telescope find_files<cr>",                   "file" },
    m = { "<cmd>Telescope media_files<cr>",                  "media_files" },
    r = { "<cmd>Telescope live_grep<cr>",                    "grep" },
    ['.'] = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "current_buffer"},
    b = {"<cmd>Telescope buffers<cr>",                       "buffers"},
    o = {"<cmd>Telescope oldfiles<cr>",                      "oldfiles"},
    p = {"<cmd>Telescope project project<cr>",               "project"},
		e = {"<cmd>Telescope symbols<cr>",                       "emoji"},
		['/'] = {"<cmd>Telescope<cr>", "overview"},
    l = {
      name = "LSP",
      a = {"<cmd>Telescope lsp_code_actions<cr>", "actions"},
      d = {"<cmd>Telescope lsp_definitions<cr>",  "definitions"},
      r = {"<cmd>Telescope lsp_references<cr>",   "references"},
    },
    h = {
      name = "History",
      s = {"<cmd>Telescope search_history<cr>",  "search"},
      c = {"<cmd>Telescope command_history<cr>", "command"},
    },
    t = {
      name = "Tag",
      h = {"<cmd>Telescope help_tags<cr>",               "help"},
      ['.'] = {"<cmd>Telescope current_buffer_tags<cr>", "current_buffer"},
    },
    w = {"<cmd>Telescope arecibo websearch previewer=false<CR>", "web"},
  },

  l = {
    name = "lsp",
    a = {"<cmd>lua vim.lsp.buf.implementation()<CR>",               "actions"},
    s = {"<cmd>lua vim.lsp.buf.signature_help()<CR>",               "signature_help"},
    r = {"<cmd>lua vim.lsp.buf.rename()<CR>",                       "rename"},
    d = {"<cmd>lua vim.lsp.buf.type_definition()<CR>",              "definitions"},
    i = {"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "issues"},
    n = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",             "next"},
    p = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",             "prev"},
    f = {"<cmd>lua vim.lsp.buf.formatting()<CR>",                   "format"},
    t = {util.toggle_lsp,                                           "toggle"},
  },

	o = orgmode.mappings,

  c = {
    "<cmd>Telescope find_files cwd=$HOME/.config/nvim/lua<CR>", "config"
  },

  v = {
    name = "view",
    i = {"<cmd>PreviewImpl<CR>", "Implementation"},
    d = {"<cmd>PreviewDef<CR>", "Definition"},
    c = {"<cmd>PreviewClose<CR>", "Close"}
  },

  q = {"<cmd>q<cr>", "quit" },
  Q = {"<cmd>qa<cr>", "Quit all"}
},
{
  prefix = "<Leader>",
  mode = "n"
})


-- visual mode
wk.register({
  y = { "\"+y", "yank to clipboard"},
  l = {
    name = "lsp",
    a = {"<cmd>Lspsaga range_code_action<CR>", "actions"},
  },
  a = { ":EasyAlign<CR>", "align"},
	r = { util.replace, "replacement" },
  c = { ":CommentToggle<cr>", "comment"}
}, {
  prefix = "<Leader>",
  mode = "v"
})
