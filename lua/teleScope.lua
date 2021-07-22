local actions = require('telescope.actions')

require("telescope").setup {
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
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = {"node_modules"},
        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
    },
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

require("telescope").load_extension("media_files")

local opt = {noremap = true, silent = true}

vim.g.mapleader = " "

-- mappings
vim.api.nvim_set_keymap("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fp",
    [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]],
    opt
)

vim.api.nvim_set_keymap("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fh", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fo", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)
