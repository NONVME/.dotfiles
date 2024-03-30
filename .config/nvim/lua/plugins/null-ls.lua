local utils = require("common-moduls.utils")

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.shfmt,
        -- Cpell
        null_ls.builtins.diagnostics.codespell,
        -- Lua
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type=Spaces", "--indent-width=2", "--column-width=140" },
        }),
        -- Shell
        null_ls.builtins.hover.printenv,
        -- Yaml, Js, Ts, Css, Html, Json, Markdown
        null_ls.builtins.diagnostics.yamllint.with({
          extra_args = { "-d", "{extends: relaxed, rules: {line-length: {max: 120}}}" },
        }),
        null_ls.builtins.formatting.prettier,
        -- Python
        null_ls.builtins.formatting.black.with({
          extra_args = { "--fast" },
          -- Only used if available
          condition = utils.is_executable_condition("black"),
        }),
        require("none-ls.diagnostics.ruff"),
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>hf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Formatting", silent = true })
    vim.keymap.set("n", "<leader>hI", ":PyrightOrganizeImports <cr>", { desc = "Pyright organize Imports", silent = true })
    vim.keymap.set("n", "<leader>hi", ":!isort %<CR><esc>", { desc = "Isort organize Imports", silent = true })
  end,
}

-- TODO: for shells
-- https://github.com/nix-community/nur-combined/blob/d98af9e2d9a012baa703697f09aeab5b399dea08/repos/ambroisie/modules/home/vim/plugin/settings/null-ls.lua
