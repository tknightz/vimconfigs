local bar_fg = "#565c64"
local activeBuffer_fg = "#c8ccd4"

require "bufferline".setup {
  options = {
    offsets = {{filetype = "NvimTree", text = "Explorer"}},
    buffer_close_icon = "",
    modified_icon = "",
    indicator_icon = '',
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = false,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thin",
    mappings = "true",
    diagnostics = "nvim_lsp",
    custom_areas = {
      right = function()
        local result = {}
        local error = vim.lsp.diagnostic.get_count(0, [[Error]])
        local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
        local info = vim.lsp.diagnostic.get_count(0, [[Information]])
        local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

        if error ~= 0 then
          table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
        end

        if warning ~= 0 then
          table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
        end

        if hint ~= 0 then
          table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
        end

        if info ~= 0 then
          table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
        end
        return result
      end,
    },
  },

  highlights = {
    fill = {
      guifg = "#546E7A",
      guibg = "#212C31",
    },
    background = {
      guibg = "#212C31",
    },
    tab = {
      guifg = "#546E7A",
      guibg = "#212C31",
    },
    tab_selected = {
      guifg = "#ffffff",
      guibg = "#1f2020",
    },
    close_button = {
      guifg = '#546E7A',
      guibg = '#212C31',
    },
    close_button_visible = {
      guifg = '#ffffff',
      guibg = '#1f2020',
    },
    close_button_selected = {
      guifg = '#ffffff',
      guibg = '#1f2020',
    },
    modified = {
      guifg = '#97B36D',
      guibg = '#212C31',
    },
    modified_visible = {
      guifg = '#97B36D',
      guibg = '#212C31',
    },
    modified_selected = {
      guifg = '#c3e88d',
      guibg = '#1f2020',
    },
    separator_selected = {
      guifg = '#ffffff',
      guibg = 'none'
    },
    separator_visible = {
      guifg = '#384B53',
      guibg = 'none'
    },
    separator = {
      guifg = '#384B53',
      guibg = 'none'
    },
  }
}

local opt = {silent = true}
local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

-- MAPPINGS
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
