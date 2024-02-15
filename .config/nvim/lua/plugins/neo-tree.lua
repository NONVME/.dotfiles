local utils = require("common-moduls.utils")

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree toggle <CR>", { silent = true })
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { silent = true })
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_hidden = false,
				},
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
	end,
	--   keys = {
	--   {
	--     "<leader>fe",
	--     function()
	--       require("neo-tree.command").execute({ toggle = true, dir = utils.root() })
	--     end,
	--     desc = "Explorer NeoTree (root dir)",
	--   },
	-- },
}
