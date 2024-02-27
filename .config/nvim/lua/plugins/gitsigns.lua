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
      end, {expr=true, desc = "Git Next hunk"})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true, desc = "Git Previous hunk."})

      -- Actions
      map('n', '<leader>ip', gs.preview_hunk, {desc = "Git Preview Hunk"})
      map('n', '<leader>ib', function() gs.blame_line{full=true} end, {desc = "Git Blame line"})
      map('n', '<leader>iB', gs.toggle_current_line_blame, {desc = "Git Toggle current line blame"})
      map('n', '<leader>id', gs.diffthis, {desc = "Git Diff This"})
      map('n', '<leader>iD', function() gs.diffthis('@~2') end, {desc = "Git Diff Version of file in the grandparent of HEAD"})
      map('n', '<leader>ir', gs.toggle_deleted, {desc = "Git Toggle removed"})

    end,
  })
end,
}
