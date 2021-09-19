local M = {}

M.toggle_lsp = function()
  if next(vim.lsp.buf_get_clients()) == nil then
    vim.cmd[[LspStart]]
  else
    vim.cmd[[LspStop]]
  end
end


M.substitute = function(word, new_word)
	if word == "" or new_word == "" then
		return
	end

	local cmd = string.format("%%s/\\<%s\\>/%s/g", word, new_word)
	vim.cmd(cmd)
end


M.replace = function()
	local mode = vim.api.nvim_get_mode()['mode']
	local word = ""

	if mode == 'n' then
		word = vim.api.nvim_call_function('expand', {'<cword>'})

	elseif mode == 'v' then
		vim.cmd('noau normal! "vy"')
    word = vim.fn.getreg('v')
	end

	local msg = string.format("Replace (%s) with : ", word)
	local new_word = vim.fn.input(msg)

	return M.substitute(word, new_word)
end


return M
