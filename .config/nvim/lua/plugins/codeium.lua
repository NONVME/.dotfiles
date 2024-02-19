return {
    	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	event = { "InsertEnter", "CmdlineEnter", "LspAttach" },
	build = ":Codeium Auth",
	config = function()
		require("codeium").setup({})
	end,
}
