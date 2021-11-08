vim.o.completeopt = "menu,menuone,noselect"

local cmp = require'cmp'

cmp.setup({
	enabled = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = {
		border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		--[[ max_width = 120,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1, ]]
	},
	snippet = {
		expand = function(args)
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
		['('] = cmp.mapping(function(fallback)
			cmp.mapping.complete()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("()<left>", true, false, true), "n", true)
		end, { 'i', 's' }),
		-- ['<ESC>'] = cmp.mapping(function(fallback)
		-- 	if cmp.get_active_entry() ~= nil then
		-- 		cmp.abort()
		-- 	else
		-- 		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>',true,false,true), "n", true)
		-- 	end
		-- end, { 'i', 's' }),
		-- ['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'path' },
			{ name = 'buffer' },
			{ name = 'emoji' },
			{ name = 'nvim_lua' },
			{ name = 'vsnip' },
	}),
	formatting = {
    format = function(entry, vim_item)
			vim_item.kind = require('plugins.lsp._kind').icons[vim_item.kind] .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        emoji = "[Emoji]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
        spell = "[Spell]",
        treesitter = "[Treesitter]",
        nvim_lua = "[Neovim]",
      })[entry.source.name]

      return vim_item
    end,
  },
	experimental = {
		ghost_text = false
	}
})

-- require("nvim-autopairs.completion.cmp").setup({
-- 	map_cr = true, --  map <CR> on insert mode
-- 	map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
-- 	auto_select = true, -- automatically select the first item
-- 	insert = false, -- use insert confirm behavior instead of replace
-- 	map_char = { -- modifies the function or method delimiter by filetypes
-- 		all = '(',
-- 		tex = '{'
-- 	}
-- })


-- local g = vim.g
-- -- speeden up compe
-- g.loaded_compe_calc = 0
-- g.loaded_compe_emoji = 0
--
-- g.loaded_compe_luasnip = 0
-- g.loaded_compe_nvim_lua = 0
--
-- g.loaded_compe_path = 0
-- g.loaded_compe_spell = 0
-- g.loaded_compe_tags = 0
-- g.loaded_compe_treesitter = 0
--
-- g.loaded_compe_snippets_nvim = 0
--
-- g.loaded_compe_ultisnips = 0
-- g.loaded_compe_vim_lsc = 0
-- g.loaded_compe_vim_lsp = 0
-- g.loaded_compe_omni = 0
