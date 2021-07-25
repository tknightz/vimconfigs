local actions = require('telescope.actions')
local previewers = require("telescope.previewers")

local ok, telescope = pcall(require, "telescope")

local M = {}

telescope.setup {
    defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<S-Up>"] = actions.preview_scrolling_up,
            ["<S-Down>"] = actions.preview_scrolling_down
          },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        layout_config = {
          prompt_position = "bottom",
          width = 0.8,
          preview_cutoff = 120,
          horizontal = {
              mirror = false,
              preview_width = 0.5
          },
          vertical = {
              mirror = false
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
        file_ignore_patterns = {"node_modules"},
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
    extensions = {
        fzf = {
          override_generic_sorter = true,
          override_file_sorter = true,
        },
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
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

M.grep_prompt = function()
  require("telescope.builtin").grep_string({
    shorten_path = true,
    search       = vim.fn.input("Grep String > "),
  })
end

M.files = function()
  require("telescope.builtin").find_files({
    file_ignore_patterns = { "%.png", "%.jpg", "%.webp" },
  })
end

local no_preview = function()
  return require("telescope.themes").get_dropdown({
    borderchars = {
      { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      prompt  = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    width = 0.8,
    previewer = false,
  })
end

M.frecency = function()
  require("telescope").extensions.frecency.frecency(no_preview())
end

M.buffer_fuzzy = function()
  require("telescope.builtin").current_buffer_fuzzy_find(no_preview())
end

M.code_actions = function()
  require("telescope.builtin").lsp_code_actions(no_preview())
end


local opt = {noremap = true, silent = true}

vim.g.mapleader = " "

-- mappings
vim.api.nvim_set_keymap("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)
