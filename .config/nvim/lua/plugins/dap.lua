return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

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

    vim.keymap.set("n", "<Leader>bt", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>bc", ":DapContinue<CR>", { desc = "Continue" })
    vim.keymap.set("n", "<Leader>bx", ":DapTerminate<CR>", { desc = "Terminate" })
    vim.keymap.set("n", "<Leader>bo", ":DapStepOver<CR>", { desc = "Step Over" })
    vim.keymap.set("n", "<leader>bn", function()
      require("dap-python").test_method()
    end, { desc = "Test Method" })
  end,
}

-- NOTE:
-- https://www.lazyvim.org/extras/dap/core#nvim-dap
