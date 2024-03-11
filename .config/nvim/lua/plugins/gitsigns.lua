return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      yadm = { enable = true },
      numhl = true,
      -- signs = false,
      signcolumn = false,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Navigation
        vim.keymap.set("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Git Next hunk" })

        vim.keymap.set("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Git Previous hunk." })

        -- Actions
        vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Git Preview Hunk" })
        vim.keymap.set("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, { desc = "Git Blame line" })
        vim.keymap.set("n", "<leader>gB", gs.toggle_current_line_blame, { desc = "Git Toggle current line blame" })
        vim.keymap.set("n", "<leader>gd", gs.diffthis, { desc = "Git Diff This" })
        vim.keymap.set("n", "<leader>gD", function()
          gs.diffthis("@~2")
        end, { desc = "Git Diff Version of file in the grandparent of HEAD" })
        vim.keymap.set("n", "<leader>gr", gs.toggle_deleted, { desc = "Git Toggle removed" })
        vim.keymap.set("n", "<leader>gr", gs.toggle_deleted, { desc = "Git Toggle removed" })
      end,
    })
  end,
}
