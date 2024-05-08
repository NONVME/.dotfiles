return {
  "ray-x/lsp_signature.nvim",
  event = "BufReadPre",
  config = function()
    require("lsp_signature").setup({ hint_enable = false })
  end,
}
