return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"c",
				"query",
				"lua",
				"go",
				"javascript",
				"python",
				"vim",
				"vimdoc",
				"html",
				"htmldjango",
				"json",
				"toml",
				"yaml",
				"dockerfile",
				"make",
				"gitignore",
				"bash",
				"markdown",
				"racket",
				"ninja",
			},
			auto_install = true,
			highlight = {
				enable = true,
				-- disable = { "python" },
			},
			indent = { enable = true },
		})
	end,
}
