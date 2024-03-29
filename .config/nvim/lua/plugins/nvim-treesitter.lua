return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  priority = 980,
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "c",
        "query",
        "lua",
        "go",
        "javascript",
        "python",
        "vim",
        "vimdoc",
        "html",
        "htmldjango",
        "json",
        "toml",
        "yaml",
        "dockerfile",
        "make",
        "gitignore",
        "bash",
        "racket",
        "ninja",
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "yaml", "toml", "markdown", "ini", "tmux" },
      },
      indent = { enable = true },
    })
  end,
}
