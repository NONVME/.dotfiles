return {
  "mfussenegger/nvim-dap-python",
  ft = 'python',
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local debugpy_package = require("mason-registry").get_package("debugpy")
    local path = require("mason-core.package").get_install_path(debugpy_package) .. "/venv/bin/python3"
    require("dap-python").setup(path)

    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>", { desc = "Continue" })
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>", { desc = "Terminate" })
    vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>", { desc = "Step Over" })
    vim.keymap.set("n", "<leader>dn", function() require("dap-python").test_method() end, { desc = "Test Method" }) end, }

-- NOTE:
-- https://www.lazyvim.org/extras/dap/core#nvim-dap
