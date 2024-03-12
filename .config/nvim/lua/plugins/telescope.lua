return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "BurntSushi/ripgrep" },
      { "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      { "radyz/telescope-gitsigns",
        dependencies = {
          "lewis6991/gitsigns.nvim",
          "nvim-telescope/telescope.nvim",
        }
      },
    },
    config = function()
      require("telescope").load_extension("git_signs")
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "\\", builtin.live_grep, { desc = "Grep" })
      vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Help tags" })
      vim.keymap.set("n", "<leader>to", "<cmd>TodoTelescope<cr>", { desc = "Todo tags" })
      vim.keymap.set("n", "<leader>tk", "<cmd>Telescope keymaps<CR>", { desc = "Key Maps" })
      vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
      vim.keymap.set("n", "<leader>tg", "<cmd>Telescope git_signs<CR>", { desc = "Git status" })
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_config = {
            width = 0.99,
            horizontal = {
              -- prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
          },
          -- extensions = {
          --   fzf = {
          --     fuzzy = true,
          --     override_generic_sorter = true,
          --     override_file_sorter = true,
          --     case_mode = "smart_case",
          --   },
          -- },
        },
      })
    end,
  },
}
