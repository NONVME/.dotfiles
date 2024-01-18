-- Example config in lua
vim.g.nord_italic = false

-- Load the colorscheme
--vim.cmd.colorscheme('nord')
require('nord').set()



function printTable(obj, indent)
    indent = indent or 0
    local indentStr = string.rep(" ", indent * 2)

    for key, value in pairs(obj) do
        if type(value) == "table" then
            print(indentStr .. key .. " (table) {")
            printTable(value, indent + 1)
            print(indentStr .. "}")
        else
            print(indentStr .. key .. ":", value)
        end
    end
end

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
