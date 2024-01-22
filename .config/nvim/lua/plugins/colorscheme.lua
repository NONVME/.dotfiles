return {
  dir = "~/.config/nvim/lua/self-plugins/nord.nvim/",
  priority = 1000,
  config = function()
    -- require('nord').setup()
    vim.cmd.colorscheme('nord')
  end,
}

-- return {
--   'nordtheme/vim',
--   name = "nord-vim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme('nord')
--   end,
-- }

-- return {
--   'andersevenrud/nordic.nvim',
--   priority = 1000,
--   config = function()
--     vim.g.nord_italic = false
--     vim.g.nord_borders = true
--     vim.g.nord_contrast = true
--     vim.cmd.colorscheme('nordic')
--   end,
-- }

-- return {
--   'shaunsingh/nord.nvim',
--   priority = 1000,
--   config = function()
--     vim.g.nord_italic = false
--     vim.g.nord_borders = true
--     vim.g.nord_contrast = true
--     vim.cmd.colorscheme('nord')
--   end,
-- }
-- return {
--   {
--     "catppuccin/nvim",
--     lazy = false,
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme "catppuccin"
--     end
--   }
-- }
