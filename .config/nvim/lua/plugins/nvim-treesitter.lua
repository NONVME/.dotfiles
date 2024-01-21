return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {"c", "query", "lua", "go", "javascript", "python", "vim", "vimdoc", "html", "htmldjango", "json", "toml", "yaml", "dockerfile", "make", "gitignore", "bash", "markdown", "racket"},
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = { "python" }
    },
    indent = {enable = true},
  },
}
