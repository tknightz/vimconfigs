local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then scopes["o"][key] = value end
end

vim.cmd("set signcolumn=yes")
vim.cmd("set undodir=~/.vim/undo-dir")
vim.cmd("set undofile")
vim.cmd("set noswapfile")
vim.cmd("set nobackup")
vim.cmd("set list listchars=tab:│·,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣")
vim.cmd("set termguicolors")

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
opt("b", "ts", 2)
opt("b", "sw", 2)
opt("w", "number", true)
opt("w", "wrap", false)
opt("w", "cursorline", true)
