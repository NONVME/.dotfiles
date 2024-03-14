return {
  "wookayin/semshi",
  -- enabled = false,
  lazy = false,
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
            " highlight! semshiLocal guifg=#EBCB8B
            " highlight! semshiGlobal guifg=#EBCB8B       
            " highlight! semshiImported guifg=#EBCB8B     
            " highlight! semshiBuiltin guifg=#B48EAD  
            " highlight! semshiAttribute guifg=#88C0D0

            highlight! semshiSelected guibg=#4C566A

            " highlight! semshiParameter guifg=#5E81AC
            " highlight! link semshiParameterUnused @Debug
            " highlight! semshiFree guifg=#EBCB8B
            " highlight! link semshiSelf @Debug    
            " highlight! link semshiUnresolved @Debug
            " highlight! link semshiErrorSign @Debug
            " highlight! link semshiErrorChar @Debug
            ]])
      end,
    })
  end,
}

