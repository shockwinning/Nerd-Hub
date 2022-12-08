local ids = {
    --["NST"] = 6008108575,
    ["Mortem Metallum"] = {Alpha = 4169490976, Beta = 8986335348},
    ["Assassin"] = {Classic = 379614936, FreePlay = 5006801542, Pro = 860428890},
    ["Murder Mystery 2"] = 142823291,
    ["Revengers Online"] = 7021728144,
}

local Disconnect = function(msg)
    game.GetService(game, "Players").LocalPlayer.Kick(game.GetService(game, "Players").LocalPlayer, msg)
end

local LoadScript = function(scr)
    local executor = identifyexecutor()
    if not executor then
        Disconnect("failed to identify executor")
        return
    end

    if tostring(executor):lower():find("synapse") then
        local status, script = pcall(game.HttpGet, game, scr)
        if status then
            loadstring(script)()
        else
            Disconnect("failed to require loadstring")
        end
    elseif tostring(executor):lower():find("scriptware") then
        local status, script = pcall(http.request, {Url = scr, Method = "GET"})
        if status then
            loadstring(script.Body)()
        else
            Disconnect("failed to require loadstring")
        end
    elseif tostring(executor):lower():find("fluxus") then
        local status, script = pcall(fluxus.request, {Url = scr, Method = "GET"})
        if status then
            loadstring(script)()
        else
            Disconnect("failed to require loadstring")
        end
    end
end

if game.PlaceId == ids["NST"] then
    --LoadScript("https://raw.githubusercontent.com/coroutineresumed/NerdHubInitializer/main/NST.lua")
elseif game.PlaceId == ids["Mortem Metallum"].Alpha or game.PlaceId == ids["Mortem Metallum"].Beta then
    LoadScript("https://raw.githubusercontent.com/coroutineresumed/NerdHubInitializer/main/Mortem_Metallum.lua")
elseif game.PlaceId == ids["Assassin"].Classic or game.PlaceId == ids["Assassin"].FreePlay or game.PlaceId == ids["Assassin"].Pro then
    LoadScript("https://raw.githubusercontent.com/coroutineresumed/NerdHubInitializer/main/Assassin.lua")
--elseif game.PlaceId == ids["Combat Warriors"] then
    --LoadScript("https://raw.githubusercontent.com/coroutineresumed/NerdHubInitializer/main/Combat_Warriors.lua")
elseif game.PlaceId == ids["Murder Mystery 2"] then
    LoadScript("https://raw.githubusercontent.com/coroutineresumed/NerdHubInitializer/main/MM2.lua")
elseif game.PlaceId == ids["Revenger"] then
    LoadScript("https://raw.githubusercontent.com/coroutineresumed/NerdHubInitializer/main/Revengers_Online.lua")
else
    Disconnect("game is unsupported")
end
