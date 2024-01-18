--
-- Common settings
--
vim.opt.number = true -- Line Numbers
vim.opt.scrolloff = 3
vim.o.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.o.spelllang = "ru_ru,en_us"
vim.o.linebreak = true
vim.opt.timeoutlen = 400

-- Colorscheme
vim.g.nord_italic = false
vim.cmd.colorscheme('nord') -- Load the colorscheme

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
keymap("n", 'd', '"_d', keymap_opts)
keymap("x", 'd', '"_d', keymap_opts)
keymap("v", 'd', '"_d', keymap_opts)
keymap("n", 'x', '"_x', keymap_opts)

-- Hotkeys
-- Accelerated movement through the text
keymap({"n", "v"}, "<c-k>", "10k", keymap_opts)
keymap({"n", "v"}, "<c-j>", "10j", keymap_opts)

-- Keys for quick line editing in insert mode
keymap("i", "<c-k>", "<up>", keymap_opts)
keymap("i", "<c-j>", "<down>", keymap_opts)
keymap("i", "<c-h>", "<left>", keymap_opts)
keymap("i", "<c-l>", "<right>", keymap_opts)


--
-- Custom functions
--
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

vim.cmd([[
  augroup myfiletypes
    autocmd!
    autocmd FileType ruby,lua,eruby,yaml,javascript,typescript,html,css set ai sw=2 sts=2 et
    autocmd FileType java,kotlin,xml, set ai sw=4 sts=4 et
    autocmd FileType asciidoc setlocal wrap
  augroup END
]])


vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    vim.opt.colorcolumn = "120"
  end
})
