return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
           ui = { border = "rounded" }
      })
    end,
  },
  -- For LSPs
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "pyright", "lua_ls" },
    },
  },
  -- For formatters, linters. DAP?
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "printenv", "shellcheck", "jq", "ruff", "black", "yamllint", "isort"},
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        lazy = true,
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = {
          lsp = { auto_attach = true },
          window = {
            size = { height = "70%", width = "90%" },
            sections = { left = { size = "25%" } },
          },
          source_buffer = { follow_node = false },
          icons = { Method = "󰊕 " },
        },
        keys = {
          { "<C-m>", "<cmd>Navbuddy<CR>", desc = "Toggle Navbuddy" },
        },
      },
    },
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    keys = {},
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({
        capabilities = capabilities,
        -- settings = {
        --     python = {
        --         analysis = {
        --             -- useLibraryCodeForTypes = true,
        --             -- diagnosticSeverityOverrides = {
        --             --     reportGeneralTypeIssues = "warning",
        --             --     reportUnusedVariable = "none",
        --             --     reportUndefinedVariable = "none",
        --             -- },
        --             -- typeCheckingMode = "off"
        --         },
        --     },
        -- },
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        },
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function()
          vim.diagnostic.config({
            virtual_text = false,
            float = {
              source = "always",
              border = "rounded",
            },
          })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true, desc = "Displays hover information" })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "Go to definition" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = true, desc = "Go to declaration" })
          vim.keymap.set("n", "gR", vim.lsp.buf.references, { buffer = true, desc = "Go to references" })
          vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer = true, desc = "Rename all references" })
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = true, desc = "Go to the definition of the type symbol" })
          vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = true, desc = "Show diagnostics in a floating window" })
          vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = true, desc = "Displays a function's signature information" })
          -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
      })
      -- Close the window after go to references
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local bufnr = vim.fn.bufnr("%")
          vim.keymap.set("n", "<cr>", function()
            vim.api.nvim_command([[execute "normal! \<cr>"]])
            vim.api.nvim_command(bufnr .. "bd")
          end, { buffer = bufnr })
        end,
        pattern = "qf",
      })

      local navbuddy = require("nvim-navbuddy")
      require("lspconfig").clangd.setup({
        on_attach = function(client, bufnr)
          navbuddy.attach(client, bufnr)
        end,
      })
    end,
  },
}
