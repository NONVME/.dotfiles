local M = {}

--- pretty print lua object
--- @param obj any object to pretty print
M.dump = function(obj)
    print(vim.inspect(obj))
end

function M.root(root)
  local f = debug.getinfo(1, "S").source:sub(2)
  return vim.fn.fnamemodify(f, ":p:h:h") .. "/" .. (root or "")
end

--- checks if a given command is executable
--- @param cmd string? command to check
--- @return boolean executable
M.is_executable = function(cmd)
    return cmd and vim.fn.executable(cmd) == 1
end

--- return a function that checks if a given command is executable
--- @param cmd string? command to check
--- @return fun(cmd: string): boolean executable
M.is_executable_condition = function(cmd)
    return function()
        return M.is_executable(cmd)
    end
end

--- whether or not we are currently in an SSH connection
--- @return boolean ssh connection
M.is_ssh = function()
    local variables = {
        "SSH_CONNECTION",
        "SSH_CLIENT",
        "SSH_TTY",
    }

    for _, var in ipairs(variables) do
        if string.len(os.getenv(var) or "") ~= 0 then
            return true
        end
    end

    return false
end

--- list all active LSP clients for current buffer
--- @param bufnr int? buffer number
--- @return table all active LSP client names
M.list_lsp_clients = function(bufnr)
    local clients = vim.lsp.buf_get_clients(bufnr)
    local names = {}

    for _, client in ipairs(clients) do
        table.insert(names, client.name)
    end

    return names
end

-- Func to make esc multicloser window
function M.close_floats()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end

---@param str string
function M.termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)

end
---@param keys string
---@param mode? string
function M.feedkeys(keys, mode)
  if mode == nil then
    mode = "in"
  end
  return vim.api.nvim_feedkeys(M.termcodes(keys), mode, true)
end

function M.lsp_active()
  for _, client in pairs(vim.lsp.get_active_clients()) do
    if client.server_capabilities then
      return true
    end
  end
  return false
end

--- Gets the buffer number of every visible buffer
--- @return integer[]
function M.visible_buffers()
  return vim.tbl_map(vim.api.nvim_win_get_buf, vim.api.nvim_list_wins())
end

function M.clear_highlights()
  vim.cmd("nohlsearch")
  if M.lsp_active() then
    vim.lsp.buf.clear_references()
    for _, buffer in pairs(M.visible_buffers()) do
      vim.lsp.util.buf_clear_references(buffer)
    end
  end
end

return M
