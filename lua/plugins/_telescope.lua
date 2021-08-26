local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
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
            ["<cr>"] = custom_actions.fzf_multi_select
          },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--no-ignore",
            "--hidden",
            "--column",
            "--smart-case"
        },
        layout_config = {
          prompt_position = "bottom",
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
        prompt_prefix = " 🔍 ",
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
            file_ignore_patterns = { "%.gif", "%.png", "%.jpg", "%.webp", "%.ico", "%.min.js", "%.min.css", "%.map", ".git/.*" },
        },
        buffers = {
            sort_lastused = true,
            theme = "dropdown"
        },
    },
    extensions = {
        fzf = {
          override_generic_sorter = true,
          override_file_sorter = true,
        },
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg", "svg", "gif"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        },
        frecency = {
          show_scores     = false,
          show_unindexed  = true,
          ignore_patterns = { "*.git/*", "*/tmp/*" },
          workspaces = {
            ["nvim"]      = "/home/tulen/.config/nvim",
            ["alacritty"] = "/home/tulen/.config/alacritty",
          },
        },
    }
}



pcall(require("telescope").load_extension, "fzf") -- superfast sorter
pcall(require("telescope").load_extension, "media_files") -- media preview
pcall(require("telescope").load_extension, "frecency") -- frecency


local opt = {noremap = true, silent = true}
vim.g.mapleader = " "

-- mappings
vim.api.nvim_set_keymap("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)
