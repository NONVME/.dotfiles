return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<C-m>", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    --[[ symbol_folding = {
      autofold_depth = false,
    }, ]]
  },
  enabled = false,
}
