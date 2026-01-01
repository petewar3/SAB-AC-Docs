game.Loaded:Wait()
local target_hash = "293cf47e10f01f0fc030c1a79829e28cf7cda2629ffcb6d3295710dca2b71f0ba39acecee058d182cf14fe89bd765921"
-- hash number 14

for _, func in pairs(getgc()) do
    if typeof(func) == "function" and not iscclosure(func) and getfunctionhash(func) == target_hash then
        warn("Hash Function Located!")
        local old; old = hookfunction(func, newcclosure(function(...)
            warn("Hash Function Called!")
            local result = old(...) -- prevent function verified runtime checks to check whether the function was ran or not with flags, let it run as normal however only spoof the result itself
            
            print("Function Called With:")
            for i = 1, select("#", ...) do
                local arg = select(i, ...)
                print(i, typeof(arg), tostring(arg))
            end
            
            print("Function Return Result:")
            for i = 1, select("#", result) do
                local arg = select(i, ...)
                print(i, typeof(arg), tostring(arg))
            end
            
            return result
        end))
    end
end
