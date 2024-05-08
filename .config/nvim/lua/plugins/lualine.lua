return {
  "nvim-lualine/lualine.nvim",
  config = function()
    vim.opt.showmode = false
    require("lualine").setup({
      options = {
        section_separators = { left = "", right = "" },
        component_separators = "|",
        theme = "nord",
        disabled_filetypes = {
          statusline = { "NvimTree" },
        },
      },
      sections = {
        lualine_a = { { "branch", right_padding = 2 } },
        lualine_b = { { "filename", path = 3 } },
        lualine_c = { "fileformat" },
        lualine_x = { { "diff", colored = false } },
        lualine_y = { "filetype" },
        lualine_z = { "%l/%L:%c" },
      },
    })
  end,
}
