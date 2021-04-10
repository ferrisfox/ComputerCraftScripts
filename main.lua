local tArgs = { ... }

if #tArgs ~= 1 then
    print("usage")
    return
end

local get = function(file)
    -- TODO: research cache busting usecase and implementaion on github
    local cacheBuster = ("%x"):format(math.random(0, 2 ^ 30))
    local response, err = http.get(
        "https://raw.github.com/ferrisfox/ComputerCraftScripts/master/" .. file .. ".lua?cb=" .. cacheBuster
    )

    if not response then
        print( err )
        return nil
    end

    return response.readAll()

end

local run = function(name)
    local program = get(name)
    local func, err = load(program.readAll(), name, "t", _ENV)
    if not func then
        printError(err)
        return
    end

    local ok err = pcall(func, table.unpack(tArgs))
    if not ok then
        printError( err )
    end
end

local arg = tArgs[1]

if arg == "AS" or arg == "as" then
    run("as")
end
