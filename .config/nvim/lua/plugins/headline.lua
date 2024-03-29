return {
    "lukas-reineke/headlines.nvim",
    filetype = 'markdown',
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function ()
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
        }
    })
    end
}
