return {
  "0x00-ketsu/autosave.nvim",
  -- lazy-loading on events
  event = { "InsertLeave", "TextChanged" },
  opts = {
    prompt_style = false,
    -- conditions = {
    --   filetype_is_not = { "lua" }
    -- },
  },
  enabled = true,
}
