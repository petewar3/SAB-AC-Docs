-- this script is used for getting hash functions from a script source to help identify functions in a script
local function TableToString(tbl, return_table)
    local function serialize(t, indent)
        indent = indent or 0
        local pad = string.rep(" ", indent)
        local lines = {"{\n"}
        local keys = {}
        for k in pairs(t) do table.insert(keys, k) end
        table.sort(keys)
        
        for i, k in ipairs(keys) do
            local v = t[k]
            local key = type(k) == "string" and k or string.format("%q", k)
            local value = type(v) == "table" and serialize(v, indent + 4) 
                         or type(v) == "string" and string.format("%q", v) 
                         or tostring(v)
            lines[#lines + 1] = pad .. "  " .. key .. " = " .. value .. (i < #keys and "," or "") .. "\n"
        end
        lines[#lines + 1] = pad .. "}"
        return table.concat(lines)
    end
    
    if return_table then
        return "return " .. serialize(tbl)
    end
    
    return "local hash_table = " .. serialize(tbl)
end

game.Loaded:Wait()
local hash_table = {}
local script_source = "=ReplicatedFirst.LocalScript  "

for _, v in ipairs(getgc(true)) do
    if type(v) == "function" and not isexecutorclosure(v) and not iscclosure(v) then
        local info = getinfo(v)
        if info.source and info.source:find("ReplicatedFirst.LocalScript") then
            local hash = getfunctionhash(v)
            hash_table[#hash_table + 1] = hash
        end
    end
end

print("hash_table quantity:", #hash_table)
writefile("HASH_FUNCTION_DUMPED.lua", TableToString(hash_table))
