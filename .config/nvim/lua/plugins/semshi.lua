return {
	"wookayin/semshi",
	ft = "python",
	build = ":UpdateRemotePlugins",
	version = "*", -- Recommended to use the latest release
	init = function()
		vim.g["semshi#error_sign"] = false
		vim.g["semshi#update_delay_factor"] = 0.001
		vim.cmd([[
        au FileType python nmap <silent> rm :Semshi rename<CR>
        au FileType python nnoremap <silent> <Tab> :Semshi goto name next<CR>
        au FileType python nnoremap <silent> <S-Tab> :Semshi goto name prev<CR>
        ]])
		-- This autocmd must be defined in init to take effect
		vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
			group = vim.api.nvim_create_augroup("SemanticHighlight", {}),
			callback = function()
				-- Only add style, inherit or link to the LSP's colors
				vim.cmd([[
            " highlight! link semshiImported @none
            " highlight! link semshiParameter @lsp.type.parameter
            " highlight! link semshiParameterUnused DiagnosticUnnecessary
            " highlight! link semshiBuiltin @function.builtin
            " highlight! link semshiAttribute @field
            " highlight! link semshiSelf @lsp.type.selfKeyword
            " highlight! link semshiUnresolved @lsp.type.unresolvedReference
            " highlight! link semshiFree @none
            ]])
			end,
		})
	end,
}
