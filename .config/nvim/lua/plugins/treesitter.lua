require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "query", "lua", "go", "javascript", "python", "vim", "vimdoc", "html", "htmldjango", "json", "toml", "yaml", "dockerfile", "make", "gitignore", "bash", "markdown", "racket"},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    -- additional_vim_regex_highlighting = { "python" },
    disable = { "python" }
  },
  indent = {enable = true},
}
