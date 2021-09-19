local gl = require("galaxyline")
local gls = gl.section
local fileinfo = require('galaxyline.provider_fileinfo')
local condition = require('galaxyline.condition')
local buffer_not_empty = require('galaxyline.provider_fileinfo').buffer_not_empty

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'toggleterm', 'minimap'}


local colors = {
  bg          = "#27343A",
  fg          = "black",
  inactive_fg = "#323232",
  black       = "#000000",
  green       = "#67D745",
  red         = "#ed3b44",
  altbg       = "#545454",
  orange      = "#ff8e0c",
  blue        = "#7797b7",
  violet      = "#FF2F9E",
  yellow      = "#e0a85a",
  grey        = "#6f737b",
  white       = "#ffffff",
  none = "NONE"
}


local modes = {
  n = {"NORMAL", colors.white, colors.violet},
  i = {"INSERT", colors.fg, colors.green},
  v = {"VISUAL", colors.fg, colors.orange},
  V={"V-LINE", colors.white, colors.orange},
  c = {"COMMAND", colors.white, colors.blue},
  no = {"", colors.white, colors.red},
  s = {"", colors.white, colors.orange},
  S= {"", colors.white, colors.orange},
  [''] = {"VISUAL", colors.fg, colors.orange},
  [''] = {"V-BLOCK", colors.fg, colors.orange},
  ic = {"", colors.bg, colors.green},
  R = {"REPLACE", colors.white, colors.violet},
  Rv = {"", colors.white, colors.violet},
  cv = {"", colors.white, colors.red},
  ce={"", colors.white, colors.red},
  r = {"REPLACE", colors.bg, colors.cyan},
  rm = {"", colors.bg, colors.cyan},
  ['r?'] = {"", colors.bg, colors.blue},
  ['!']  = {"", colors.white, colors.red},
  t = {"", colors.white, colors.red}
}

local get_mode_style = function()
  local vim_mode = vim.fn.mode()
  return modes[vim_mode]
end



gls.left[2] = {
  ViMode = {
    provider = function()
      local mode_style = get_mode_style()
      vim.api.nvim_command('hi GalaxyViMode guifg='.. mode_style[2].. ' guibg='..mode_style[3]..' gui=bold')
      vim.api.nvim_command('hi GalaxyViModeInv guifg='.. mode_style[3].. ' guibg='..colors.altbg..' gui=none')

      local current_Mode = mode_style[1]

      if current_Mode == nil then
        return "  Terminal "
      else
        return "    "..current_Mode .. " "
      end
    end,
    separator = " ",
    separator_highlight = "GalaxyViModeInv"
  },
}


gls.left[6] = {
  FileIcon = {
    provider = function()
      return fileinfo.get_file_icon().." "
    end,
    condition = buffer_not_empty,
    highlight = {colors.white, colors.altbg}
  }
}

gls.left[7] = {
  FileName = {
    provider = "FileName",
    condition = buffer_not_empty,
    highlight = {colors.white, colors.altbg},
    separator = " ",
    separator_highlight = {colors.altbg, colors.bg}
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "   ",
    highlight = {colors.red, colors.bg}
  }
}

gls.left[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "   ",
    highlight = {colors.yellow, colors.bg}
  }
}


gls.right[1] = {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.orange, colors.altbg},
    separator = "",
    separator_highlight = {colors.altbg, colors.bg}
  }
}

gls.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    highlight = {colors.orange, colors.altbg}
  }
}

gls.right[3] = {
  DiffAdd = {
    provider = "DiffAdd",
    -- condition = condition.check_git_workspace,
    icon = "   ",
    highlight = {colors.green, colors.black},
    separator = " ",
    separator_highlight = function()
        if condition.check_git_workspace() then
            return {colors.black, colors.altbg}
        else
            return {colors.black, colors.bg}
        end
    end
  }
}

gls.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.check_git_workspace,
    icon = "    ",
    highlight = {colors.yellow, colors.black}
  }
}

gls.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.check_git_workspace,
    icon = "   ",
    highlight = {colors.red, colors.black},
  }
}

gls.right[6] = {
  time_icon = {
    provider = function()
      return "  "
    end,
    highlight = {colors.grey, colors.green},
    separator = " ",
    separator_highlight = {colors.green, colors.black},
  }
}

gls.right[7] = {
  time = {
    provider = function()
      return "  " .. os.date("%H:%M") .. " "
    end,
    highlight = {colors.grey, colors.green}
  }
}

-- Short status line
gls.short_line_left[0] = {
  Indicator = {
    provider = function()
      return " "
    end,
    highlight = {colors.grey, colors.altbg}
  }
}

gls.short_line_left[1] = {
  FileIcon = {
    provider = function()
      return " "..fileinfo.get_file_icon().." "
    end,
    highlight = {colors.inactive_fg, colors.altbg}
  }
}

gls.short_line_left[2] = {
  FileName = {
    provider = 'FileName',
    highlight = { colors.inactive_fg, colors.altbg },
  }
}
