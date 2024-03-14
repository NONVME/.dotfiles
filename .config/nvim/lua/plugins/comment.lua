return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup({
      toggler = {
        line = os.getenv("TMUX") and "<c-_>" or "<c-/>",
        block = "<c-.>",
      },
      opleader = {
        line = os.getenv("TMUX") and "<c-_>" or "<c-/>",
        block = "<c-.>",
      },
    })
  end,
}
