-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--
-- Common settings
--

vim.opt.termguicolors = true -- set term gui colors

vim.opt.number = true -- Line Numbers
vim.opt.scrolloff = 3
vim.o.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.o.spelllang = "ru_ru,en_us"
vim.o.linebreak = true

vim.wo.signcolumn = "yes"
vim.opt.swapfile = false

-- Search
vim.o.ic = true -- Ignore case when searching. set noic
vim.o.smartcase = true -- But only if the search string itself is lowercase

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- TAB indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Max height size of popup menu
vim.opt.pumheight = 15

--
-- Mappings
--
vim.g.mapleader = " "

local keymap = vim.keymap.set
local keymap_opts = { noremap = true, silent = true }

keymap("i", "kj", "<esc>", keymap_opts) -- Fast esc
keymap("i", "ло", "<esc>", keymap_opts)

-- Do not lose the buffer after insert
keymap("x", "p", "pgvy", keymap_opts)
keymap("x", "P", "Pgvy", keymap_opts)

-- Do not lose the buffer after delete
keymap({ "n", "x", "v" }, "d", '"_d', keymap_opts)
keymap("n", "x", '"_x', keymap_opts)

-- Hotkeys
-- Accelerated movement through the text
keymap({ "n", "v" }, "<c-k>", "10k", keymap_opts)
keymap({ "n", "v" }, "<c-j>", "10j", keymap_opts)

-- Keys for quick line editing in insert mode
keymap("i", "<c-k>", "<up>", keymap_opts)
keymap("i", "<c-j>", "<down>", keymap_opts)
keymap("i", "<c-h>", "<left>", keymap_opts)
keymap("i", "<c-l>", "<right>", keymap_opts)

-- Moving between lines slidingly
keymap("n", "j", "gj", keymap_opts)
keymap("n", "k", "gk", keymap_opts)
keymap("x", "j", "gj", keymap_opts)
keymap("x", "k", "gk", keymap_opts)

keymap("n", "*", "*zz", { desc = "Search and center screen" })
-- keymap("n", "<MouseDown>", "<C-Y>", {desc = 'scroll by 1 line per row'})
-- keymap("n", "<MouseUp>", "<C-E>", {desc = 'scroll by 1 line per row'})
keymap({ "n", "v" }, "<leader>r", [[:!python3 %<CR>]], { desc = "Run file through Python3" })
keymap(
  { "n", "v" },
  "<leader>p",
  [[:%! python3 -c "import sys, ast, pprint; pprint.pprint(ast.literal_eval(sys.stdin.read()))"<CR>]],
  { desc = "Pprint python objs" }
)

keymap("n", "<F3>", [[:set invnumber<CR>]], { desc = "Hide numbers" })
keymap("n", "<F4>", [[:set invwrap<CR>]], { desc = "Hide line breaks" })

--
-- Custom functions
--

-- local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local utils = require("common-moduls.utils")

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

-- Set the line in 120 character
autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    vim.opt.colorcolumn = "120"
  end,
})

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end

-- Define a function to set the indentation settings
local function set_indentation_settings(args)
  local buf = args.buf
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  if
    ft == "ruby"
    or ft == "lua"
    or ft == "eruby"
    or ft == "yaml"
    or ft == "javascript"
    or ft == "typescript"
    or ft == "html"
    or ft == "css"
  then
    vim.api.nvim_buf_set_option(buf, "autoindent", true)
    vim.api.nvim_buf_set_option(buf, "shiftwidth", 2)
    vim.api.nvim_buf_set_option(buf, "softtabstop", 2)
    vim.api.nvim_buf_set_option(buf, "expandtab", true)
  elseif ft == "java" or ft == "kotlin" or ft == "xml" then
    vim.api.nvim_buf_set_option(buf, "autoindent", true)
    vim.api.nvim_buf_set_option(buf, "shiftwidth", 4)
    vim.api.nvim_buf_set_option(buf, "softtabstop", 4)
    vim.api.nvim_buf_set_option(buf, "expandtab", true)
  elseif ft == "asciidoc" then
    vim.api.nvim_buf_set_option(buf, "wrap", true)
  end
end

-- Create autocommands for the specified file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "ruby",
    "lua",
    "eruby",
    "yaml",
    "javascript",
    "typescript",
    "html",
    "css",
    "java",
    "kotlin",
    "xml",
    "asciidoc",
  },
  callback = set_indentation_settings,
})

-- Close floats, and clear highlights with <Esc>
vim.keymap.set("n", "<Esc>", function()
  utils.close_floats()
  if vim.bo.modifiable then
    utils.clear_highlights()
  else
    if #vim.api.nvim_list_wins() > 1 then
      return utils.feedkeys("<C-w>c")
    end
  end
end, { desc = "Close floats, clear highlights" })

-- -- Codeium cmds
-- local function has_codeium(settings)
--   for _, value in ipairs(settings) do
--     if value.name == "codeium" then
--       return true
--     end
--   end
-- end
--
-- local function toggle_codeium()
--   local cmp = require("cmp")
--   local current_setting = has_codeium(cmp.get_config().sources)
--   if current_setting then
--     cmp.setup({
--       sources = cmp.config.sources({
--         { name = "path" },
--         { name = "nvim_lsp", priority = 10 },
--         { name = "buffer", priority = 8, max_item_count = 10 },
--         { name = "luasnip", priority = 6, max_item_count = 20 },
--         -- { name = "codeium", priority = 2, max_item_count = 15 }
--       }),
--     })
--     print("codeium disabled")
--   else
--     cmp.setup({
--       sources = cmp.config.sources({
--         { name = "path" },
--         { name = "nvim_lsp", priority = 10 },
--         { name = "buffer", priority = 8, max_item_count = 10 },
--         { name = "luasnip", priority = 6, max_item_count = 20 },
--         { name = "codeium", priority = 2, max_item_count = 15 },
--       }),
--     })
--     print("codeium enabled")
--   end
-- end
--
-- vim.api.nvim_create_user_command("ToggleCodeium", toggle_codeium, {})
-- -- Set a keymap like this for example:
-- -- vim.api.nvim_set_keymap('n', '<Leader>tc', ':ToggleCodeium<CR>', { noremap = true, silent = true })

-- NOTE:
-- about python json tool map https://vi.stackexchange.com/questions/7722/how-to-debug-a-mapping
-- https://dotfyle.com

-- TODO:
-- https://github.com/chrisgrieser/nvim-kickstart-python
-- https://nanotipsforvim.prose.sh
-- https://github.com/RRethy/vim-illuminate highlights the underline text like semshi
-- https://github.com/kawre/leetcode.nvim
