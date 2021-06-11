local gl = require("galaxyline")
local gls = gl.section
local fileinfo = require('galaxyline.provider_fileinfo')

local colors = {
    bg = "#2e323a",
    fg = "#abb2bf",
    green = "#67D745",
    red = "#d47d85",
    lightbg = "#515866",
    orange = "#ff8e0c",
    blue = "#7797b7",
    violet = "#FF2F9E",
    yellow = "#e0c080",
    grey = "#6f737b",
    white = "#ffffff"
}

gl.short_line_list = {'NvimTree', 'vista', 'dbui'}


gls.left[2] = {
    ViMode = {
        provider = function()
            local alias = {
                n = "NORMAL",
                i = "INSERT",
                c = "COMMAND",
                V = "VISUAL",
                [""] = "VISUAL",
                v = "VISUAL",
                R = "REPLACE"
            }
            local mode_color = {
              n = {colors.bg, colors.violet}, 
              i = {colors.bg, colors.green},
              v = {colors.white, colors.orange},
              [''] = {colors.white, colors.orange},
              V={colors.white, colors.orange},
              c = {colors.white, colors.blue},
              no = {colors.white, colors.red},
              s = {colors.white, colors.orange},
              S= {colors.white, colors.orange},
              [''] = {colors.bg, colors.orange},
              ic = {colors.bg, colors.green},
              R = {colors.white, colors.violet},
              Rv = {colors.white, colors.violet},
              cv = {colors.white, colors.red},
              ce={colors.white, colors.red},
              r = {colors.bg, colors.cyan},
              rm = {colors.bg, colors.cyan},
              ['r?'] = {colors.bg, colors.blue},
              ['!']  = {colors.white, colors.red},
              t = {colors.white, colors.red}
            }
            if mode_color[vim.fn.mode()] == nil then
              vim.api.nvim_command('hi GalaxyViMode guifg=white guibg=red gui=bold')
            else
              vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()][1]..' guibg='..mode_color[vim.fn.mode()][2]..' gui=bold')
            end

            local current_Mode = alias[vim.fn.mode()]


            if current_Mode == nil then
                return "  Terminal "
            else
                return "  硫 " .. current_Mode .. " "
            end
        end,
    }
}

gls.left[3] = {
    FileIcon = {
        provider = function()
          return "   "..fileinfo.get_file_icon().." "
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
        highlight = {colors.lightbg, colors.green}
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
