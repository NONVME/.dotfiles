return {
  "ntpeters/vim-better-whitespace",
  config = function()
    vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg='#BF616A' })
    vim.g.current_line_whitespace_disabled_soft = 1
    -- vim.g.current_line_whitespace_disabled_hard = 1
  end,
  -- enabled = false,
  keys = {},
}
