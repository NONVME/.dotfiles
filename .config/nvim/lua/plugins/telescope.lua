return {
  {'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
      {'nvim-lua/plenary.nvim'},
      -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>tf', builtin.find_files, {desc = "Find files"})
    vim.keymap.set('n', '\\', builtin.live_grep, {desc = "Grep"})
    vim.keymap.set('n', '<leader>tb', builtin.buffers, {desc = "Find buffers"})
    vim.keymap.set('n', '<leader>th', builtin.help_tags, {desc = "Help tags"})
    vim.keymap.set('n', '<leader>td', "<cmd>TodoTelescope<cr>", {desc = "Todo tags"})
    vim.keymap.set('n', '<leader>tk', '<cmd>Telescope keymaps<CR>', {desc = 'Key Maps'})
    local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_config = {
            width = 0.99,
            horizontal = {
              -- prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
          },
          vimgrep_arguments = {
            'rg', -- Use ripgrep
            '--color=never', -- Don't use color codes
            '--no-heading', -- Don't show the file name
            '--with-filename', -- Show the file name
            '--line-number', -- Show the line number
            '--column', -- Show the column number
            '--smart-case' -- Ignore case for lowercase search terms
          },
          -- extensions = {
          --   fzf = {
          --     fuzzy = true,
          --     override_generic_sorter = true,
          --     override_file_sorter = true,
          --     case_mode = "smart_case",
          --   },
          -- },
        },
      })
      -- telescope.load_extension("fzf")
  end,
  },
}
