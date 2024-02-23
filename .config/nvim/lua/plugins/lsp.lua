return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
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
        ensure_installed = { "stylua", "jq", "printenv", "shellcheck", "black" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({
        capabilities = capabilities,
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
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true, desc = "Displays hover information" })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "Go to definition" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = true, desc = "Go to declaration" })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = true, desc = "Go to references" })
          vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer = true, desc = "Rename all references" })
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = true, desc = "Go to the definition of the type symbol" })
          vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = true, desc = "Show diagnostics in a floating window" })
          vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = true, desc = "Displays a function's signature information" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
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
		end,
	},
}
