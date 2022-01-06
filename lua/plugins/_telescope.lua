local actions = require('telescope.actions')
local finders = require('telescope.finders')
local action_state = require('telescope.actions.state')
local action_set = require('telescope.actions.set')
local previewers = require("telescope.previewers")

local _, telescope = pcall(require, "telescope")

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = table.getn(picker:get_multi_selection())

  if num_selections > 1 then
    picker = action_state.get_current_picker(prompt_bufnr)
    for _, entry in ipairs(picker:get_multi_selection()) do
      vim.cmd(string.format("%s %s", ":e!", entry.value))
    end
    vim.cmd('stopinsert')
  else
    actions.file_edit(prompt_bufnr)
  end
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<S-Up>"] = actions.preview_scrolling_up,
        ["<S-Down>"] = actions.preview_scrolling_down,
        ["<C-v>"] = actions.file_vsplit,
        ["<C-s>"] = actions.file_split,
        ["Tab"] = actions.toggle_selection + actions.send_to_qflist,
        -- ["<cr>"] = actions.file_edit,
        -- ["<cr>"] = custom_actions.fzf_multi_select
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--ignore-files",
      "--hidden",
      "--column",
      "--smart-case"
    },
    layout_config = {
      prompt_position = "top",
      width = 0.8,
      preview_cutoff = 120,
      horizontal = {
        mirror = false,
        preview_width = 0.6
      },
      vertical = {
        mirror = false,
        preview_width = 0.5
      }
    },
    prompt_prefix = " 🧭 ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require "telescope.sorters".get_fzy_sorter,
    file_ignore_patterns = {"node_modules", ".git/.*", "%.min.js", "%.min.css", "%.map"},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = previewers.buffer_previewer_maker
  },
  pickers = {
    find_files = {
      previewer = false,
      theme = "dropdown",
      file_ignore_patterns = { "%.gif", "%.png", "%.jpg", "%.jpeg", "%.webp", "%.ico", "%.min.js", "%.min.css", "%.map", ".git/.*" },
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      default_selection_index = 1,
      attach_mappings = function(prompt_bufnr, map)
        local ok_ez, ezterm = pcall(require, 'ezterm')
        local ok_eza, ezaction = pcall(require, 'ezterm.actions')

        if ok_ez then
          map('i', '<C-t>', ezaction.change_direction_top)
          map('i', '<C-l>', ezaction.change_direction_left)
          map('i', '<C-r>', ezaction.change_direction_right)
          map('i', '<C-b>', ezaction.change_direction_bottom)
        end

        action_set.select:replace(function(prompt_bufnr, type)
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if pcall(function() vim.api.nvim_buf_get_var(entry.bufnr, "ezterm") end) then
            ezterm.open_term(entry.bufnr)
          else
            vim.api.nvim_win_set_buf(0, entry.bufnr)
          end
        end)
        return true
      end 
    },
  },
	symbols = {
		sources = {'emoji', 'kaomoji', 'gitmoji', 'math', 'latex'}
	},
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg", "svg", "gif"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
    frecency = {
      show_scores     = true,
      show_unindexed  = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      workspaces = {
        ["nvim"]      = "/home/tulen/.config/nvim",
        ["alacritty"] = "/home/tulen/.config/alacritty",
      },
    },
    arecibo = {
      previewer = false,
      ["selected_engine"]   = 'google',
      ["url_open_command"]  = 'xdg-open',
      ["show_http_headers"] = false,
      ["show_domain_icons"] = false,
    },
    ezterm = {
      theme = "dropdown",
      enter_insert = true,
      previewer = true
    },
    project = {
      hidden_files = true
    }
  }
}


pcall(require("telescope").load_extension, "fzf") -- superfast sorter
pcall(require("telescope").load_extension, "media_files") -- media preview
pcall(require("telescope").load_extension, "arecibo") -- arecibo
pcall(require("telescope").load_extension, "project") -- project
pcall(require("telescope").load_extension, "ezterm") -- ezterm


-- highlights
vim.cmd[[highlight TelescopeAreciboNumber guifg=#9bca68]]
vim.cmd[[highlight TelescopeAreciboUrl guifg=#555d86]]
vim.cmd[[highlight TelescopeAreciboPrompt guifg=#ff6c22]]
vim.cmd[[highlight TelescopeAreciboPromptPrefix guifg=#ff6c22]]
