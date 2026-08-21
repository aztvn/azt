-- [[ Code Hệ Thống Key System & Loader ]]
-- Made By GPT : https://discord.gg/236caWdzUY
-- Don't Skid Skid
-- Read readme.md

return function(Data)

    -- [[ Kiểm Tra Trạng Thái Key ]]
    -- Success : Key hợp lệ, cho phép chạy Script
    -- Warn    : Key không hợp lệ, từ chối chạy
    -- Other   : Có dấu hiệu Hook hoặc trạng thái bất thường

    local Passed

    if Data.KeyStatus == "Success" then
        Passed = "Success" -- Key hợp lệ
    elseif Data.KeyStatus == "Warn" then
        Passed = "Error" -- Key không hợp lệ
    else
        Passed = "Hooked" -- Phát hiện trạng thái bất thường / Hook
    end

    -- [[ Script Router ]]
    -- Mapping PlaceId của Game với URL Loader tương ứng

    local ScriptId = {

        -- // Game 1
        ["79546208627805"] =
            "https://aztvn.top/azt/api/v2/skidskid.lua",

        -- // Game 2
        ["126509999114328"] =
            "https://aztvn.top/azt/api/v2/skidskid.lua",
        ["17541114784"] =
            "https://aztvn.top/azt/api/v2/cdvn.lua",
        ["18192562963"] =
            "https://aztvn.top/azt/api/v2/cdvn.lua",
        ["123974602339071"] = "https://raw.githubusercontent.com/aztvn/azt/refs/heads/main/script/test.lua",

        
    }

    -- [[ Main Loader Function ]]
    -- Nhận PlaceId và tìm Script tương ứng trong ScriptId

    local function Loader(PlaceId)

        -- // Convert PlaceId sang string để đồng bộ với key trong bảng
        local Url = ScriptId[tostring(PlaceId)]

        -- // Không tìm thấy Script tương ứng
        if not Url then
            return
        end

        -- [[ HTTP Request ]]
        -- Tải source Script từ URL
        local success, source = pcall(function()
            return game:HttpGet(Url)
        end)

        -- // HTTP Request thất bại
        if not success then
            return
        end

        -- [[ Compile Loader ]]
        -- Chuyển source string thành Lua function
        local fn, err = loadstring(source)

        -- // Compile thất bại
        if not fn then
            warn("Loader error:", err)
            return
        end

        -- [[ Execute ]]
        -- Truyền Data từ Key System vào Script chính
        return fn(Data)
    end

    -- [[ Loader Logic ]]
    -- Chỉ cho phép chạy Script khi KeyStatus hợp lệ

    if Passed == "Success" then

        -- // Lấy PlaceId hiện tại của Game
        Loader(game.PlaceId)

    elseif Passed == "Error" or Passed == "Hooked" then

        -- // Key thất bại hoặc phát hiện trạng thái bất thường
        return game:Shutdown()
    end
end
