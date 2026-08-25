-- [[ Code Hệ Thống Key System & Loader ]]
-- Made By GPT : https://discord.gg/236caWdzUY

return function(Data)

    -- [[ Kiểm Tra Trạng Thái Key ]]
    local Passed

    if Data.KeyStatus == "Success" then
        Passed = "Success"
    elseif Data.KeyStatus == "Warn" then
        Passed = "Error"
    else
        Passed = "Hooked"
    end


    -- [[ Lấy Tên Executor ]]
    local ExecutorName = "unknown"

    pcall(function()
        if getexecutorname then
            ExecutorName = tostring(getexecutorname())
        elseif identifyexecutor then
            ExecutorName = tostring(identifyexecutor())
        end
    end)

    -- Chuyển toàn bộ tên executor về chữ thường
    ExecutorName = ExecutorName:lower()


    -- [[ Script Router ]]
    local ScriptId = {

        -- // Game 1
        ["79546208627805"] = {
            Url = "https://aztvn.top/azt/api/v2/skidskid.lua",
            NameGame = "99Night",
            BlacklistExec = {
                "xeno",
                "solara",
            }
        },

        -- // Game 2
        ["126509999114328"] = {
            Url = "https://aztvn.top/azt/api/v2/skidskid.lua",
            NameGame = "99Night",
            BlacklistExec = {
                "xeno",
                "solara",
            }
        },

        ["17541114784"] = {
            Url = "https://aztvn.top/azt/api/v2/cdvn.lua",
            NameGame = "Cong Dong Viet Nam",
            BlacklistExec = {
                "xeno",
                "delta",
            }
        },

        ["18192562963"] = {
            Url = "https://aztvn.top/azt/api/v2/cdvn.lua",
            NameGame = "Cong Dong Viet Nam",
            BlacklistExec = {}
        },

        ["123974602339071"] = {
            Url = "https://raw.githubusercontent.com/aztvn/azt/refs/heads/main/script/test.lua",
            NameGame = "TEST",
            BlacklistExec = {}
        },
    }


    -- [[ Kiểm Tra Executor Blacklist ]]
    local function IsExecutorBlacklisted(Config)

        if not Config.BlacklistExec then
            return false
        end

        for _, BlacklistName in ipairs(Config.BlacklistExec) do

            BlacklistName = tostring(BlacklistName):lower()

            -- Tìm chuỗi đầy đủ, liền mạch
            if ExecutorName:find(BlacklistName, 1, true) then
                return true
            end
        end

        return false
    end


    -- [[ Main Loader Function ]]
    local function Loader(PlaceId)

        local Config = ScriptId[tostring(PlaceId)]

        -- Không có script cho game
        if not Config then
            return
        end


        -- [[ Executor Blacklist ]]
        if IsExecutorBlacklisted(Config) then

            warn(
                "Executor Blacklisted:",
                ExecutorName,
                "| PlaceId:",
                tostring(PlaceId)
            )

            return game:Shutdown()
        end


        -- [[ HTTP Request ]]
        local success, source = pcall(function()
            return game:HttpGet(Config.Url)
        end)

        -- HTTP thất bại
        if not success then
            return
        end


        -- [[ Compile Loader ]]
        local fn, err = loadstring(source)

        if not fn then
            warn("Loader error:", err)
            return
        end


        -- [[ Execute ]]
        return fn(Data)
    end


    -- [[ Loader Logic ]]
    if Passed == "Success" then

        Loader(game.PlaceId)

    elseif Passed == "Error" or Passed == "Hooked" then

        return game:Shutdown()
    end
end
