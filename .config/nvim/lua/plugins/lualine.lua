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
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = {
					"filename",
					"branch",
				},
				lualine_c = { "fileformat" },
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		})
	end,
}
