return {
    "junegunn/vim-easy-align",
    lazy = false,
    config = function()
        vim.keymap.set( "x", "ga", "<Plug>(EasyAlign)", { silent = true, remap = true })
    end,
}
