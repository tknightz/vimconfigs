local function shorten_str(str, size)
  local len = size and size or 27

  local strlen = string.len(str)
  if string.len(str) < len then
    return str
  end

  local head = string.sub(str, 0, math.floor(len/2))
  local tail = string.sub(str, strlen - math.floor(len/2), strlen)

  return head .. '...' .. tail
end

local function shorten_bufname()
  local path = vim.api.nvim_buf_get_name(0)
  local filename = vim.api.nvim_call_function('fnamemodify', {path, ':t'})
  return shorten_str(filename)
end

require'lualine'.setup {
    options = {
    icons_enabled = true,
    theme = 'material',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {"NvimTree", "packer", "minimap", "dbui"}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{shorten_bufname}, 'branch'},
    lualine_c = {
      {
        'diff',
        -- symbols = {added = ' ', modified = ' ', removed = ' '},
        color_added = '#75bb3f',
        color_modified = '#ff722e',
        color_removed = '#DC1616',
      },
      {
        "diagnostics",
        sources = {"nvim_lsp"},
        sections = {'error', 'warn', 'info'},
        symbols = { error = " ", warning = " ", hint = "", info = " " }
      }
    },
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
