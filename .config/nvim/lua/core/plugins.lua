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
  {'shaunsingh/nord.nvim', priority = 1000},
  {"williamboman/mason.nvim", opts = {}},
  {'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  {'nvim-lualine/lualine.nvim'},
  {'numToStr/Comment.nvim'},
  {'windwp/nvim-autopairs', event = "InsertEnter", opts = {}},
  {'lewis6991/gitsigns.nvim', opts = {}},
  {"0x00-ketsu/autosave.nvim", opts = {prompt_style = false}},
  -- {"Vimjas/vim-python-pep8-indent"},
  {
    "wookayin/semshi",
    build = ":UpdateRemotePlugins",
    version = "*",  -- Recommended to use the latest release
    init = function()
      vim.g['semshi#error_sign'] = false
      vim.g["semshi#update_delay_factor"] = 0.001
    end,
  },
  { "karb94/neoscroll.nvim", opts = {}},
  {"ntpeters/vim-better-whitespace"},
})
