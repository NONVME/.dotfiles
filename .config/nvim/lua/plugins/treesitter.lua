require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "go", "javascript", "python", "vim", "html", "htmldjango", "json"},

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
 
