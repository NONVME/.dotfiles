return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
    { "lukas-reineke/cmp-under-comparator" },
    { "onsails/lspkind.nvim" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		keys = function()
			return {}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			vim.lsp.handlers["textDocument/hover"] =
                vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			require("luasnip.loaders.from_vscode").lazy_load()

            local lspkind = require('lspkind')
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-i>"] = cmp.mapping.complete({
                      config = {
                        sources = {
                          { name = "codeium" }
                        }
                      }
                    }),
                   ["<CR>"] = cmp.mapping({
                     i = function(fallback)
                       if cmp.visible() and cmp.get_active_entry() then
                         cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                       else
                         fallback()
                       end
                     end,
                     s = cmp.mapping.confirm({ select = true }),
                     c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                   }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
						-- that way you will only jump inside the snippet region
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "nvim_lsp", priority = 10 },
					{ name = "buffer", priority = 8, max_item_count = 10 },
					{ name = "luasnip", priority = 6, max_item_count = 20 },
                    -- { name = "codeium", priority = 2, max_item_count = 15 }
				}),
                formatting = {
					fields = {"abbr", "kind", "menu", },
                    format = lspkind.cmp_format({
                      maxwidth = 25, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                                     -- can also be a function to dynamically calculate max width such as 
                                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                      show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                      mode = 'symbol_text', -- show only symbol annotations
                      -- mode = 'symbol', -- show only symbol annotations
                      symbol_map = { Codeium = "" },
                      menu = {
                        async_path = "ᴘᴀᴛʜ ",
                        buffer = "ʙᴜꜰ ",
                        cmdline = "cmd ",   -- cmp-cmdline used on cmdline
                        latex_symbols = "ʟᴛx ",
                        luasnip = "sɴɪᴘ ",
                        snippy = "sɴɪᴘ ",
                        nvim_lsp = "ʟsᴘ ",
                        nvim_lua = "ʟᴜᴀ ",
                        path = "ᴘᴀᴛʜ ",
                        codeium = "AI "
                      },
                    })
                },
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        require "cmp-under-comparator".under,
                        cmp.config.compare.score,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },

				-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}),
				}),
				-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
				cmp.setup.cmdline("/", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				}),
			})
            -- If you want insert `(` after select function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())
		end,
	},
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
	require("bqf").setup({
		preview = {
			winblend = 0,
		},
	})
    end
  },
}
