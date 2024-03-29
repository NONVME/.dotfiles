return {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },
  -- event = "VeryLazy",
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "pass chat.openai.com",
      edit_with_instructions = {
        diff = true,
        keymaps = {
          close = "<ESC>",
          accept = "<C-y>",
          toggle_diff = "<C-d>",
          toggle_settings = "<C-o>",
          toggle_help = os.getenv("TMUX") and "<c-_>" or "<c-/>",
          cycle_windows = "<Tab>",
          use_output_as_input = "<C-i>",
        },
      },
      chat = {
        welcome_message = "",
        keymaps = {
          close = "<ESC>",
        },
      },
      popup_layout = {
        default = "center",
        center = {
          width = "80%",
          height = "80%",
        },
        right = {
          width = "30%",
          width_settings_open = "50%",
        },
      },
      openai_params = {
        model = "gpt-4-turbo-preview",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 600,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      openai_edit_params = {
        model = "gpt-4-turbo-preview",
        frequency_penalty = 0,
        presence_penalty = 0,
        temperature = 0,
        top_p = 1,
        n = 1,
      },

      -- keymaps = {
      --   close = "<C-c>",
      --   yank_last = "<C-y>",
      --   yank_last_code = "<C-k>",
      --   scroll_up = "<C-u>",
      --   scroll_down = "<C-d>",
      --   new_session = "<C-n>",
      --   cycle_windows = "<Tab>",
      --   cycle_modes = "<C-f>",
      --   next_message = "<C-j>",
      --   prev_message = "<C-k>",
      --   select_session = "<Space>",
      --   rename_session = "r",
      --   delete_session = "d",
      --   draft_message = "<C-r>",
      --   edit_message = "e",
      --   delete_message = "d",
      --   toggle_settings = "<C-o>",
      --   toggle_sessions = "<C-p>",
      --   toggle_help = "<C-h>",
      --   toggle_message_role = "<C-r>",
      --   toggle_system_role_open = "<C-s>",
      --   stop_generating = "<C-x>",
      -- },
    })
  end,
}
