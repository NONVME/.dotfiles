return {
  "folke/which-key.nvim",
  config = function()
    vim.opt.timeoutlen = 400
    local wk = require("which-key")
    wk.register({
      ["<leader>t"] = { name = "Telescope" },
      ["<leader>h"] = { name = "Helpers" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>d"] = { name = "Dap" },
    })
    vim.keymap.set("n", "<leader>w", ":WhichKey<CR>", { desc = "WhichKey Show mapping" })
  end,
}
