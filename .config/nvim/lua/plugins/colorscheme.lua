-- return {
--   dir = "~/.config/nvim/lua/common-moduls/nord.nvim/",
--   priority = 1000,
--   config = function()
--     -- require('nord').setup()
--     vim.cmd.colorscheme("nord")
--   end,
-- }

-- return {
--   'nordtheme/vim',
--   name = "nord-vim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme('nord')
--   end,
-- }

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function ()
--     vim.cmd.colorscheme("catppuccin")
--   end
-- }


return {
  'shaunsingh/nord.nvim',
  priority = 1000,
  config = function()
    vim.g.nord_italic = false
    vim.g.nord_borders = true
    vim.g.nord_contrast = true
    vim.g.nord_bold = false
    vim.cmd.colorscheme('nord')
    vim.api.nvim_set_hl(0, "Identifier", {})
    -- vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineWarning", {})
  end,
}
