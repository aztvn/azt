-- [[ Code Hệ Thống Key System & Loader ]]
-- Made By GPT : https://discord.gg/236caWdzUY
-- Don't Skid Skid
-- Read readme.md

return function(Data)

    if Data.KeyStatus == "Success" then
        Passed = true -- Kiểm Tra Key Thành Công Chạy Script
    elseif Data.KeyStatus == "Warn" then
        Passed = "Error" -- Kiểm Tra Key Thất Bại
    else
       Passed = "Hooked" -- Key Đã Bị Hook
    end}
    -- // Bỏ Id Gane Và Script Vào 
    local ScriptId = {
        [PlaceId] = "https://" 
    }

    -- Logic Loader
    local _Loader = function(PlaceId)
        if ScriptId[PlaceId] then
            loadstring(game:HttpGet(ScriptId[PlaceId]))(Data)
        end
    end
    local GetGameReturnID = function()
        return tostring(game.PlaceId)
    end
    if Passed == "Success" then
    _Loader(tostring(game.PlaceId))
    elseif Passed == "Warn" or Passed == "Hooked" then
        return game:Shutdown()
    end
end
