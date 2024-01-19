local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"folke/which-key.nvim"},
  {'nvim-treesitter/nvim-treesitter'},
  {'neovim/nvim-lspconfig'},
  {'shaunsingh/nord.nvim'},
  {"williamboman/mason.nvim", opts = {}},
  {'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  {'nvim-lualine/lualine.nvim'},
  {'numToStr/Comment.nvim'},
  {'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {'lewis6991/gitsigns.nvim', opts = {}},
  {"0x00-ketsu/autosave.nvim", opts = {},},
})
