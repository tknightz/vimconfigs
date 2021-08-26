local lspconf = require("lspconfig")

local pythonlint = {
    formatCommand = "black --quiet -",
    formatStdin = true,
    lintCommand = "flake8 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {'%f:%l:%c: %m'}
}

local eslint = {
  lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}


-- For efm : general linting (eslint)
lspconf.efm.setup {
    init_options = {documentFormatting = true},
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            javascript = {eslint},
            javascriptreact = {eslint},
            ["javascript.jsx"] = {eslint},
            typescript = {eslint},
            ["typescript.tsx"] = {eslint},
            typescriptreact = {eslint},
            python = {pythonlint}
        }
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "python"
    },
}
