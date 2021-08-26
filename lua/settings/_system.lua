local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then scopes["o"][key] = value end
end

vim.cmd("set signcolumn=yes")
vim.cmd("set undodir=~/.vim/undo-dir")
vim.cmd("set undofile")
vim.cmd("let &fcs='eob: '")

--[[ opt("o", "signcolumn", "yes")
opt("o", "undofile", true)
opt("o", "undodir", "~/.vim/undo-dir") ]]
opt("o", "encoding","UTF-8")
opt("o", "background","dark")
opt("o", "ignorecase", true)
opt("o", "cmdheight", 1)
opt("o", "tw", 79)
opt("o", "relativenumber", true)
opt("o", "foldmethod", "indent")
opt("o", "foldlevel", 99)
opt("o", "updatetime", 300)
opt("o", "lazyredraw", true)
opt("o", "hidden", true)
opt("o", "inccommand", "nosplit")
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("b", "tabstop", 4)
opt("b", "sw", 4)
opt("b", "expandtab", true)
opt("w", "number", true)
opt("w", "wrap", false)
opt("w", "cursorline", true)
