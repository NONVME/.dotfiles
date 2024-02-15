return {
  "lewis6991/gitsigns.nvim",
  config = function()
  require("gitsigns").setup({
    yadm = { enable = true, },
    numhl =  true,
    -- signs = false,
    signcolumn = false,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true, desc = "Next hunk"})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true, desc = "Previous hunk."})

      -- Actions
      map('n', '<leader>hp', gs.preview_hunk, {desc = "Preview Hunk"})
      map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc = "Blame line"})
      map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = "Toggle current line blame"})
      map('n', '<leader>hd', gs.diffthis, {desc = "Diff This"})
      map('n', '<leader>hD', function() gs.diffthis('@~2') end, {desc = "Diff Version of file in the grandparent of HEAD"})
      map('n', '<leader>td', gs.toggle_deleted, {desc = "Toggle deleted"})

    end,
  })
end,
}
