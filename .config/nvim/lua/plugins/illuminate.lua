return {
  "RRethy/vim-illuminate",
  -- lazy = false,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
    providers = {
      'lsp',
      'treesitter',
    },
    filetypes_denylist = { "dirbuf", "dirvish", "fugitive", "python" },
  },
  config = function(_, opts)

    local filetype = vim.bo.filetype
    if filetype ~= 'python' then
    require("illuminate").configure(opts)

    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      pattern = { "*" },
      callback = function(_)
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
      end,
    })

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"]("wrap")
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer})
    end

    map("<TAB>", "next")
    map("<S-TAB>", "prev")

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    -- vim.api.nvim_create_autocmd("FileType", {
    --   callback = function()
    --     local buffer = vim.api.nvim_get_current_buf()
    --     map("<TAB>", "next", buffer)
    --     map("<S-TAB>", "prev", buffer)
    --   end,
    -- })
    end
  end,
  -- keys = {
  --   { "<TAB>", desc = "Next Reference" },
  --   { "<S-TAB>", desc = "Prev Reference"},
  -- },
  -- enabled = function()
  --   local disabled_filetypes = { "python" }
  --   local status = not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
  --   vim.print(status)
  --   return status
  -- end,
}
