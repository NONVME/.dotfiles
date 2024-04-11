return {
  dir = "~/.config/nvim/lua/common-moduls/codeium.nvim/",
  -- "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  event = { "InsertEnter", "CmdlineEnter", "LspAttach" },
  build = ":Codeium Auth",
  -- opts = {
  --   enable_chat = true,
  -- },
  config = function()
  require("codeium").setup({
    enable_chat = true,
  })
  end,
}
