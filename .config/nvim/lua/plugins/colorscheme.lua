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


return {
  'shaunsingh/nord.nvim',
  -- dir = "~/.config/nvim/lua/common-moduls/nord.nvim/",
  dependencies = {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },
  priority = 1000,
  config = function()
    vim.g.nord_italic = false
    vim.g.nord_borders = true
    vim.g.nord_contrast = true
    vim.g.nord_bold = false
    vim.cmd.colorscheme('nord')
    vim.api.nvim_set_hl(0, "Identifier", {})
    require("headlines").setup({
    markdown = {
        headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
        },
        -- headline_highlights = { "Headline" },
        -- bullet_highlights = false
        bullets = false,
        fat_headlines = false,
    },
  })
  end,
}
