return {
  "folke/which-key.nvim",
  config = function()
    vim.opt.timeoutlen = 400
    local wk = require("which-key")
    wk.register({
      ["<leader>t"] = { name = "Telescope" },
      ["<leader>h"] = { name = "Helpers" },
      ["<leader>i"] = { name = "Git" },
      ["<leader>b"] = { name = "Dap" },
    })
  end,
}
