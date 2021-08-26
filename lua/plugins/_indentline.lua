require('indent_blankline').setup {
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_current_context = true,
    filetype_exclude = {'help', 'packer', 'txt'},
    buftype_exclude = {'terminal', 'packer'},
    term = 238,
    gui = '#1E272C',
    -- char_list = {'|', '¦', '┆', '┊'},
    char_list = {'│'},
    concealcursor = 'inc',
    conceallevel = 2,
    faster = 1,
    context_patterns = {'class', 'function', 'def', 'method', 'if', 'for', 'while'},
    space_char = '.',
    space_char_highlight_list = {'IndentBlanklineChar'},
}
