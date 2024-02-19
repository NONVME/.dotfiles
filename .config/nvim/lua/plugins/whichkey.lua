return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.register(mappings, opts)
  end,
}

-- NOTE:
-- https://github.com/AlariCode/purpleschool-neovim/blob/main/lua/plugins/whichkey.lua
