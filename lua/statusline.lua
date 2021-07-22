local gl = require("galaxyline")
local gls = gl.section
local fileinfo = require('galaxyline.provider_fileinfo')

local colors = {
    bg = "none",
    fg = "black",
    green = "#67D745",
    red = "#d47d85",
    lightbg = "#D1D1D1",
    orange = "#ff8e0c",
    blue = "#7797b7",
    violet = "#FF2F9E",
    yellow = "#e0c080",
    grey = "#6f737b",
    white = "#ffffff",
}

if vim.g.colorful_dark == 1 then
  colors.bg = "#27343a"
  colors.lightbg = "#435A64"
  colors.fg = "#abb2bf"
end


local modes = {
  n = {"NORMAL", colors.bg, colors.violet}, 
  i = {"INSERT", colors.bg, colors.green},
  v = {"VISUAL", colors.white, colors.orange},
  V={"V-LINE", colors.white, colors.orange},
  c = {"COMMAND", colors.white, colors.blue},
  no = {"", colors.white, colors.red},
  s = {"", colors.white, colors.orange},
  S= {"", colors.white, colors.orange},
  [''] = {"VISUAL", colors.bg, colors.orange},
  [''] = {"V-BLOCK", colors.bg, colors.orange},
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

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'toggleterm'}


gls.left[2] = {
    ViMode = {
        provider = function()
          mode_style = get_mode_style()
          vim.api.nvim_command('hi GalaxyViMode guifg='.. mode_style[2].. ' guibg='..mode_style[3]..' gui=bold')
          vim.api.nvim_command('hi GalaxyViModeInv guifg='.. mode_style[3].. ' guibg='..colors.lightbg..' gui=none')

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

gls.left[3] = {
    FileIcon = {
        provider = function()
          return " "..fileinfo.get_file_icon().." "
        end,
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.lightbg}
    }
}

gls.left[4] = {
    FileName = {
        provider = "FileName",
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.lightbg},
        separator = " ",
        separator_highlight = {colors.lightbg, colors.bg}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gls.left[5] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.green, colors.bg}
    }
}

gls.left[6] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.yellow, colors.bg}
    }
}

gls.left[7] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.red, colors.bg}
    }
}

gls.left[8] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.bg}
    }
}

gls.left[9] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.yellow, colors.bg}
    }
}

gls.right[1] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.orange, colors.lightbg},
        separator = "",
        separator_highlight = {colors.lightbg, colors.bg}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.orange, colors.lightbg}
    }
}

gls.right[3] = {
    time_icon = {
        provider = function()
            return "  "
        end,
        separator = " ",
        separator_highlight = {colors.green, colors.lightbg},
        highlight = {colors.grey, colors.green}
    }
}

gls.right[4] = {
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
    highlight = {colors.grey, colors.lightbg}
  }
}

gls.short_line_left[1] = {
  FileIcon = {
    provider = function()
      return "   "..fileinfo.get_file_icon().." "
    end,
    highlight = {colors.fg, colors.lightbg}
  }
}

gls.short_line_left[2] = {
  FileName = {
    provider = 'FileName',
    highlight = { colors.fg, colors.lightbg },
  }
}
