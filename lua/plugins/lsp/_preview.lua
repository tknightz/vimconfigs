require('goto-preview').setup {
    width = 120; -- Width of the floating window
    height = 15; -- Height of the floating window
    default_mappings = false; -- Bind default mappings
    debug = false; -- Print debug information
    opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
    post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
}

vim.cmd[[command! PreviewDef :lua require('goto-preview').goto_preview_definition()<CR>]]
vim.cmd[[command! PreviewImpl :lua require('goto-preview').goto_preview_implementation()<CR>]]
vim.cmd[[command! PreviewClose :lua require('goto-preview').close_all_win()<CR>]]
