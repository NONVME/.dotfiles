local utils = require("common-moduls.utils")

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "gbprod/none-ls-shellcheck.nvim"
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,
        -- Json
        require("none-ls.formatting.jq"),
        -- Shell
        null_ls.builtins.hover.printenv,
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
        -- null_ls.builtins.diagnostics.shellcheck,
        -- Yaml
        -- null_ls.builtins.diagnostics.yamllint,
        -- Python
        -- null_ls.builtins.formatting.yapf.with({
        --     -- Only used if available
        --     condition = utils.is_executable_condition("yapf"),
        -- }),
        null_ls.builtins.formatting.black.with({
            extra_args = { "--fast" },
            -- Only used if available
            condition = utils.is_executable_condition("black"),
        }),
        require("none-ls.diagnostics.ruff"),
        -- require("none-ls.formatting.ruff_format"),
        -- require("none-ls.diagnostics.flake8").with({
        --     -- Only used if available, but prefer pflake8 if available
        --     condition = function()
        --         return utils.is_executable("flake8") and not utils.is_executable("pflake8")
        --     end,
        --     -- prefer_local = ".venv/bin"
        --
        -- }),
        -- null_ls.builtins.diagnostics.pyproject_flake8.with({
        --     -- Only used if available
        --     condition = utils.is_executable_condition("pflake8"),
        --     prefer_local = ".venv/bin"
        -- }),
        -- null_ls.builtins.diagnostics.mypy.with({
        --     -- Only used if available
        --     condition = utils.is_executable_condition("mypy"),
        -- }),
        -- null_ls.builtins.diagnostics.pylint.with({
        --     -- Only used if available
        --     condition = utils.is_executable_condition("pylint"),
        -- }),
        -- null_ls.builtins.formatting.isort.with({
        --     -- Only used if available
        --     condition = utils.is_executable_condition("isort"),
        -- }),


      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>hf", vim.lsp.buf.format, { desc = "Formatting", silent = true})
    vim.keymap.set("n", "<leader>hi", ":PyrightOrganizeImports <cr>", { desc = "Pyright Organize Imports", silent = true})
  end,
}


-- TODO: for shells
-- https://github.com/nix-community/nur-combined/blob/d98af9e2d9a012baa703697f09aeab5b399dea08/repos/ambroisie/modules/home/vim/plugin/settings/null-ls.lua
