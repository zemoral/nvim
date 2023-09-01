local M = {}

function M.tbl_debug(tbl, depth)
    if tbl == nil then
        return
    end
    depth = depth or 0
    local padding = string.rep("  ", depth)
    for k, v in pairs(tbl) do
        if type(v) == 'table' then
            print(padding .. tostring(k) .. ' {')
            M.tbl_debug(v, depth + 1)
            print(padding .. '}')
        else
            print(padding .. tostring(k) .. ' ' .. tostring(v))
        end
    end
end

return M
