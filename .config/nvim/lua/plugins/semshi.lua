return {
  "wookayin/semshi",
  ft = "python",
  build = ":UpdateRemotePlugins",
  version = "*",  -- Recommended to use the latest release
  init = function()
    vim.g['semshi#error_sign'] = false
    vim.g["semshi#update_delay_factor"] = 0.001
    vim.cmd([[
        au FileType python nmap <silent> rm :Semshi rename<CR>
        au FileType python nnoremap <buffer> <Tab> :Semshi goto name next<CR>
        au FileType python nnoremap <buffer> <S-Tab> :Semshi goto name prev<CR>
        ]])
  end,
}
