local scopes = {o = vim.o, b = vim.bo, w = vim.wo, opt = vim.opt}

local home = os.getenv("HOME")
local undodir = home .. '/.vim/undo-dir'

local function opt(scope, key, value)
  scopes[scope][key] = value
end

-- opt("opt", "listchars", {
-- 	-- tab = "│·",
-- 	trail = "·",
-- 	precedes = "←",
-- 	extends = "→",
-- 	eol = "↲",
-- 	nbsp = "␣"
-- })

opt("o", "termguicolors", true)
opt("o", "list", false)
-- opt("o", "swapfile", false)
-- opt("o", "backup", false)
opt("o", "undofile", true)
opt("o", "undodir", undodir)
opt("o", "signcolumn", "yes")
opt("o", "encoding","UTF-8")
opt("o", "background","dark")
opt("o", "ignorecase", true)
opt("o", "cmdheight", 1)
opt("o", "tw", 79)
opt("o", "foldmethod", "indent")
opt("o", "foldlevel", 99)
opt("o", "updatetime", 100)
opt("o", "timeoutlen", 500)
opt("o", "hidden", true)
opt("o", "inccommand", "nosplit")
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "ts", 2)
opt("o", "sw", 2)
opt("w", "number", true)
opt("w", "wrap", false)
opt("w", "cursorline", true)
