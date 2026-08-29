local Key = "BAGHBA0t21621^4#GV"
warn('[AZT_AUTHENCATOR] : [Checking./]')
if _G.AZHash then
    warn('[AZT_AUTHENCATOR] : [Connect./]')
        if _G[_G.AZHash] then
        warn('[AZT_AUTHENCATOR] : [Checking Offset./]')
            if _G[_G.AZHash].HashKey then
            warn('[AZT_AUTHENCATOR] : [Vaild./]')
                if _G.identifexecutor(Key,_G[_G.AZHash].HashKey) == Key then
                warn('[AZT_AUTHENCATOR] : [IDE Load./]')
                    if _G.identifexecutor(Key,_G[_G.AZHash].PlaceId) == tostring(game.PlaceId) then
                    print("Auth Load Welcome To aztvn.top")
                    else
                        game.Players.LocalPlayer:Kick("Xin Lỗi Vì Bất Tiện Này System Error Code : 4")
                    end
                end
            else
                game.Players.LocalPlayer:Kick("Xin Lỗi Vì Bất Tiện Này System Error Code : 3")
            end
        else
        game.Players.LocalPlayer:Kick("Xin Lỗi Vì Bất Tiện Này System Error Code : 1")
        end
    else
    game.Players.LocalPlayer:Kick("Xin Lỗi Vì Bất Tiện Này System Error")
end

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- ==========================================
-- KEY SYSTEM CORE CONFIGURATION
-- ==========================================
local CONFIG = { SAVE_FILE = "AZT_Mod_Key.txt" }
local HttpService = game:GetService("HttpService")
local azsync = game:HttpGet('https://raw.githubusercontent.com/aztvn/aztsystem/refs/heads/main/server.json')
local AZdata = HttpService:JSONDecode(azsync)
aztvndata = {
	URL = AZdata.host,
}

if not LPH_OBFUSCATED then
    LPH_ENCFUNC = function(f) return f end
    LPH_NO_VIRTUALIZE = function(f) return f end
    LPH_JUMPOUT = function(f) return f end
    LPH_CRASH = function() while true do end end
end

local a = {}
local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function c(d)
    return (d:gsub(
        ".",
        function(e)
            local f, g = "", e:byte()
            for h = 8, 1, -1 do
                f = f .. (g % 2 ^ h - g % 2 ^ (h - 1) > 0 and "1" or "0")
            end
            return f
        end
    ) .. "0000"):gsub(
        "%d%d%d?%d?%d?%d?",
        function(e)
            if #e < 6 then
                return ""
            end
            local i = 0
            for h = 1, 6 do
                i = i + (e:sub(h, h) == "1" and 2 ^ (6 - h) or 0)
            end
            return b:sub(i + 1, i + 1)
        end
    ) .. ({"", "==", "="})[#d % 3 + 1]
end
local function j(d)
    d = string.gsub(d, "[^" .. b .. "=]", "")
    return d:gsub(
        ".",
        function(e)
            if e == "=" then
                return ""
            end
            local f, k = "", b:find(e) - 1
            for h = 6, 1, -1 do
                f = f .. (k % 2 ^ h - k % 2 ^ (h - 1) > 0 and "1" or "0")
            end
            return f
        end
    ):gsub(
        "%d%d%d?%d?%d?%d?%d?%d?%d?",
        function(e)
            if #e ~= 8 then
                return ""
            end
            local i = 0
            for h = 1, 8 do
                i = i + (e:sub(h, h) == "1" and 2 ^ (8 - h) or 0)
            end
            return string.char(i)
        end
    )
end
local function l(m)
    local n = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local o = {}
    for h = 1, m do
        local p = math.random(1, #n)
        o[h] = n:sub(p, p)
    end
    return table.concat(o)
end
local function q(r)
    local o = {l(27)}
    for h = 1, #r do
        o[#o + 1] = r:sub(h, h)
        o[#o + 1] = l(27)
    end
    return table.concat(o)
end
local function s(t)
    print(t)
    if not t or #t <= 27 then
        return ""
    end
    local u = math.floor((#t - 27) / 28)
    local r = {}
    for h = 0, u - 1 do
        local v = 28 * (h + 1)
        r[#r + 1] = t:sub(v, v)
    end
    return table.concat(r)
end

a.Load = function(self, r)
    if r ~= "TAF-Caotuananh-hiabguawtunqwiph251" then
        task.spawn(function()
            game.Players.LocalPlayer:Kick("Invalid Key")
        end)
        LPH_CRASH()
        return
    end

    local C = {}
    C.Kiemtrakey = function(self, D, Domainzzzzzz)
        local E = game:GetService("RbxAnalyticsService"):GetClientId()
        local F = "https://" .. aztvndata.URL .. "/xenoxhub/api/v1/api.php?XenoxHub=" .. q(D) .. "&XenoxHubData=" .. q(E)
        local H = game:HttpGet(F)
        H = s(H)
        local statuskey = H
        
        local Status, Domain, TimeStr
        if statuskey:find("Key Sai") then
            return false, statuskey
        end
        
        if H:find("^Success1%-") then
            Status, Domain, TimeStr = H:match("^(Success1)%-(.-)%-(.+)")
        else
            Status, Domain, TimeStr = H:match("^(Success)%-(.-)%-(.+)")
        end
        
        if Status == "Success" or Status == "Success1" then
            if TimeStr then
                local K, L, M, N, O, P = TimeStr:match("^(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)")
                if K and L and M and N and O and P then
                    local Q = os.time({
                        year  = tonumber(K), month = tonumber(L), day   = tonumber(M),
                        hour  = tonumber(N), min   = tonumber(O), sec   = tonumber(P)
                    })
                    local R = os.time(os.date("!*t"))
                    if R - Q > 30 * 60 then
                        return false, "Key đã hết hạn hoặc Key Sai"
                    end
                end
            end
            
            if Domainzzzzzz ~= Domain then
                return false, "Key đã hết hạn hoặc Key Sai." 
            end
            
            return true, H
        end
        return false, "Không Thể Kết nối máy chủ."
    end

    return C
end

local azservice = a
local azuncsys = azservice:Load("TAF-Caotuananh-hiabguawtunqwiph251")

-- ==========================================
-- UI LIBRARY
-- ==========================================
local AZTMod = {}
local ProtectName = "AZT_Mod_" .. tostring(math.random(1000, 9999))

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = ProtectName
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end

local function MakeDraggable(dragArea, targetObject)
    local dragging, dragInput, dragStart, startPos
    dragArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = targetObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    dragArea.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            targetObject.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

function AZTMod:CreateWindow(options)
    local WindowName = options.Name or "AZT Mod"
    local HubName = options.HubName or "AZ Hub"
    local UseKey = options.UseKeySystem or false
    local OnLoadFunc = options.OnLoad or function() end
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    MainFrame.Size = UDim2.new(0, 500, 0, 300)
    MainFrame.Visible = not UseKey
    MainFrame.ClipsDescendants = true

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(255, 0, 0)
    UIStroke.Thickness = 2
    UIStroke.Parent = MainFrame

    local DropShadow = Instance.new("ImageLabel")
    DropShadow.Name = "DropShadow"
    DropShadow.Parent = MainFrame
    DropShadow.BackgroundTransparency = 1
    DropShadow.Position = UDim2.new(0, -15, 0, -15)
    DropShadow.Size = UDim2.new(1, 30, 1, 30)
    DropShadow.ZIndex = 0
    DropShadow.Image = "rbxassetid://6015897843"
    DropShadow.ImageColor3 = Color3.fromRGB(255, 0, 0)
    DropShadow.ImageTransparency = 0.5
    DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TopBar.BackgroundTransparency = 0.5
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 8)
    TopBarCorner.Parent = TopBar
    MakeDraggable(TopBar, MainFrame)

    local Title = Instance.new("TextLabel")
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Size = UDim2.new(1, -30, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = HubName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local TabContainer = Instance.new("ScrollingFrame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.Active = true
    TabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabContainer.BackgroundTransparency = 0.8
    TabContainer.Position = UDim2.new(0, 10, 0, 40)
    TabContainer.Size = UDim2.new(0, 120, 1, -50)
    TabContainer.ScrollBarThickness = 2
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Parent = TabContainer
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)

    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = MainFrame
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(0, 140, 0, 40)
    ContentContainer.Size = UDim2.new(1, -150, 1, -50)

    local ToggleMinButton = Instance.new("TextButton")
    ToggleMinButton.Name = "ToggleMinButton"
    ToggleMinButton.Parent = ScreenGui
    ToggleMinButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ToggleMinButton.Position = UDim2.new(0, 50, 0, 50)
    ToggleMinButton.Size = UDim2.new(0, 40, 0, 40)
    ToggleMinButton.Font = Enum.Font.GothamBold
    ToggleMinButton.Text = "AZT"
    ToggleMinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleMinButton.TextSize = 14
    ToggleMinButton.Visible = not UseKey
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(1, 0)
    MinCorner.Parent = ToggleMinButton
    
    local MinStroke = Instance.new("UIStroke")
    MinStroke.Color = Color3.fromRGB(255, 0, 0)
    MinStroke.Thickness = 2
    MinStroke.Parent = ToggleMinButton
    MakeDraggable(ToggleMinButton, ToggleMinButton)

    ToggleMinButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)

    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Parent = ScreenGui
    NotificationFrame.BackgroundTransparency = 1
    NotificationFrame.Position = UDim2.new(1, -220, 1, -150)
    NotificationFrame.Size = UDim2.new(0, 200, 1, 0)
    
    local NotifListLayout = Instance.new("UIListLayout")
    NotifListLayout.Parent = NotificationFrame
    NotifListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotifListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotifListLayout.Padding = UDim.new(0, 10)

    function AZTMod:Notification(cfg)
        local NText = cfg.Text or "Notification"
        local NTime = cfg.Duration or 3
        
        local NItem = Instance.new("Frame")
        NItem.Parent = NotificationFrame
        NItem.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        NItem.Size = UDim2.new(1, 0, 0, 40)
        NItem.BackgroundTransparency = 1
        
        local NCorner = Instance.new("UICorner")
        NCorner.CornerRadius = UDim.new(0, 4)
        NCorner.Parent = NItem
        
        local NStroke = Instance.new("UIStroke")
        NStroke.Color = Color3.fromRGB(255, 0, 0)
        NStroke.Thickness = 1
        NStroke.Transparency = 1
        NStroke.Parent = NItem
        
        local NLabel = Instance.new("TextLabel")
        NLabel.Parent = NItem
        NLabel.BackgroundTransparency = 1
        NLabel.Size = UDim2.new(1, 0, 1, 0)
        NLabel.Font = Enum.Font.Gotham
        NLabel.Text = NText
        NLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        NLabel.TextSize = 12
        NLabel.TextTransparency = 1
        
        TweenService:Create(NItem, TweenInfo.new(0.3), {BackgroundTransparency = 0.2}):Play()
        TweenService:Create(NStroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
        TweenService:Create(NLabel, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
        
        task.delay(NTime, function()
            TweenService:Create(NItem, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            TweenService:Create(NStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
            TweenService:Create(NLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
            task.wait(0.3)
            NItem:Destroy()
        end)
    end

    -- Key System UI Initialization
    if UseKey then
        local KeyFrame = Instance.new("Frame")
        KeyFrame.Parent = ScreenGui
        KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        KeyFrame.BackgroundTransparency = 0.2
        KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
        KeyFrame.Size = UDim2.new(0, 300, 0, 150)
        
        local KCorner = Instance.new("UICorner")
        KCorner.CornerRadius = UDim.new(0, 8)
        KCorner.Parent = KeyFrame
        
        local KStroke = Instance.new("UIStroke")
        KStroke.Color = Color3.fromRGB(255, 0, 0)
        KStroke.Thickness = 2
        KStroke.Parent = KeyFrame
        
        local KTitle = Instance.new("TextLabel")
        KTitle.Parent = KeyFrame
        KTitle.BackgroundTransparency = 1
        KTitle.Position = UDim2.new(0, 0, 0, 10)
        KTitle.Size = UDim2.new(1, 0, 0, 30)
        KTitle.Font = Enum.Font.GothamBold
        KTitle.Text = "Key System - " .. WindowName
        KTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        KTitle.TextSize = 16
        
        local KInput = Instance.new("TextBox")
        KInput.Parent = KeyFrame
        KInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        KInput.Position = UDim2.new(0.1, 0, 0.4, 0)
        KInput.Size = UDim2.new(0.8, 0, 0, 30)
        KInput.Font = Enum.Font.Gotham
        KInput.PlaceholderText = "Enter Key Here..."
        KInput.Text = ""
        KInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        KInput.TextSize = 14
        
        local KInputCorner = Instance.new("UICorner")
        KInputCorner.CornerRadius = UDim.new(0, 4)
        KInputCorner.Parent = KInput
        
        local KSubmit = Instance.new("TextButton")
        KSubmit.Parent = KeyFrame
        KSubmit.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        KSubmit.Position = UDim2.new(0.55, 0, 0.7, 0)
        KSubmit.Size = UDim2.new(0.4, 0, 0, 30)
        KSubmit.Font = Enum.Font.GothamBold
        KSubmit.Text = "Xác Nhận Key"
        KSubmit.TextColor3 = Color3.fromRGB(255, 255, 255)
        KSubmit.TextSize = 14
        
        local KSubmitCorner = Instance.new("UICorner")
        KSubmitCorner.CornerRadius = UDim.new(0, 4)
        KSubmitCorner.Parent = KSubmit
        
        local KGetkey = Instance.new("TextButton")
        KGetkey.Parent = KeyFrame
        KGetkey.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        KGetkey.Position = UDim2.new(0.05, 0, 0.7, 0)
        KGetkey.Size = UDim2.new(0.5, 0, 0, 30)
        KGetkey.Font = Enum.Font.GothamBold
        KGetkey.Text = "Copy Link Key"
        KGetkey.TextColor3 = Color3.fromRGB(255, 255, 255)
        KGetkey.TextSize = 14
        
        local KGetkeyCorner = Instance.new("UICorner")
        KGetkeyCorner.CornerRadius = UDim.new(0, 4)
        KGetkeyCorner.Parent = KSubmit

        MakeDraggable(KeyFrame, KeyFrame)
        
        -- Logic Auto check key
        task.spawn(function()
            if readfile and isfile and isfile(CONFIG.SAVE_FILE) then
                local sk = readfile(CONFIG.SAVE_FILE)
                if sk and sk ~= "" then
                    local success, message
                    
                    success, message = azuncsys:Kiemtrakey(tostring(sk), aztvndata.URL)
                    if success then
                        AZTMod:Notification({Text = "Auto login thành công!", Duration = 3})
                        KeyFrame:Destroy()
                        MainFrame.Visible = true
                        ble = true
                        ToggleMinButton.Visible = true
                        task.spawn(OnLoadFunc)
                    end
                end
            end
        end)
        KGetkey.MouseButton1Click:Connect(function()
            setclipboard("https://aztvn.top/azt/getkey")
        end)
        KSubmit.MouseButton1Click:Connect(function()
            local inputKey = KInput.Text
            KSubmit.Text = "Đang kiểm tra..."
            
            local success, message

            success, message = azuncsys:Kiemtrakey(inputKey, aztvndata.URL)
            
            if success then
                KSubmit.Text = "Xác Nhận Thành Công"
                AZTMod:Notification({
                    Text = "Kiểm Tra Thành Công Bắt Đầu Mở Script",
                    Duration = 3
                })
                
                if writefile then 
                    pcall(function() writefile(CONFIG.SAVE_FILE, inputKey) end)
                end
                
                task.wait(0.5)
                KeyFrame:Destroy()
                MainFrame.Visible = true
                ToggleMinButton.Visible = true
                
                task.spawn(OnLoadFunc)
            else
                KSubmit.Text = "Xác Nhận Key"
                local errMsg = tostring(message)
                if errMsg == 'nil' then
                    errMsg = "Không Thể Kết Nối Máy Chủ"
                end
                
                AZTMod:Notification({
                    Text = errMsg,
                    Duration = 3
                })
                KInput.Text = errMsg
                task.wait(1.5)
                KInput.Text = ""
            end
        end)
    end

    local PopupOverlay = Instance.new("Frame")
    PopupOverlay.Parent = ScreenGui
    PopupOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    PopupOverlay.BackgroundTransparency = 1
    PopupOverlay.Size = UDim2.new(1, 0, 1, 0)
    PopupOverlay.Visible = false
    PopupOverlay.ZIndex = 50

    function AZTMod:InputPopup(cfg)
        local PText = cfg.Text or "Enter Value:"
        local PCallback = cfg.Callback or function() end
        
        PopupOverlay.Visible = true
        TweenService:Create(PopupOverlay, TweenInfo.new(0.2), {BackgroundTransparency = 0.5}):Play()
        
        local PBox = Instance.new("Frame")
        PBox.Parent = PopupOverlay
        PBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        PBox.Position = UDim2.new(0.5, -125, 0.5, -50)
        PBox.Size = UDim2.new(0, 250, 0, 100)
        PBox.ZIndex = 51
        
        local PCorner = Instance.new("UICorner")
        PCorner.CornerRadius = UDim.new(0, 8)
        PCorner.Parent = PBox
        local PStroke = Instance.new("UIStroke")
        PStroke.Color = Color3.fromRGB(255, 0, 0)
        PStroke.Thickness = 2
        PStroke.Parent = PBox
        
        local PLabel = Instance.new("TextLabel")
        PLabel.Parent = PBox
        PLabel.BackgroundTransparency = 1
        PLabel.Position = UDim2.new(0, 0, 0, 10)
        PLabel.Size = UDim2.new(1, 0, 0, 20)
        PLabel.Font = Enum.Font.GothamBold
        PLabel.Text = PText
        PLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        PLabel.TextSize = 14
        PLabel.ZIndex = 52
        
        local PTxtBox = Instance.new("TextBox")
        PTxtBox.Parent = PBox
        PTxtBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        PTxtBox.Position = UDim2.new(0.1, 0, 0.4, 0)
        PTxtBox.Size = UDim2.new(0.8, 0, 0, 30)
        PTxtBox.Font = Enum.Font.Gotham
        PTxtBox.Text = ""
        PTxtBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        PTxtBox.TextSize = 12
        PTxtBox.ZIndex = 52
        
        local PBtnCorner = Instance.new("UICorner")
        PBtnCorner.CornerRadius = UDim.new(0, 4)
        PBtnCorner.Parent = PTxtBox
        
        PTxtBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                PCallback(PTxtBox.Text)
                TweenService:Create(PopupOverlay, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                task.wait(0.2)
                PBox:Destroy()
                PopupOverlay.Visible = false
            end
        end)
    end

    function AZTMod:SelectPopup(cfg)
        local PText = cfg.Text or "Select Option:"
        local POpts = cfg.Options or {"Yes", "No"}
        local PCallback = cfg.Callback or function() end
        
        PopupOverlay.Visible = true
        TweenService:Create(PopupOverlay, TweenInfo.new(0.2), {BackgroundTransparency = 0.5}):Play()
        
        local PBox = Instance.new("Frame")
        PBox.Parent = PopupOverlay
        PBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        PBox.Position = UDim2.new(0.5, -125, 0.5, -50)
        PBox.Size = UDim2.new(0, 250, 0, 100)
        PBox.ZIndex = 51
        
        local PCorner = Instance.new("UICorner")
        PCorner.CornerRadius = UDim.new(0, 8)
        PCorner.Parent = PBox
        local PStroke = Instance.new("UIStroke")
        PStroke.Color = Color3.fromRGB(255, 0, 0)
        PStroke.Thickness = 2
        PStroke.Parent = PBox
        
        local PLabel = Instance.new("TextLabel")
        PLabel.Parent = PBox
        PLabel.BackgroundTransparency = 1
        PLabel.Position = UDim2.new(0, 0, 0, 10)
        PLabel.Size = UDim2.new(1, 0, 0, 20)
        PLabel.Font = Enum.Font.GothamBold
        PLabel.Text = PText
        PLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        PLabel.TextSize = 14
        PLabel.ZIndex = 52
        
        local BtnWidth = 0.8 / #POpts
        for i, opt in ipairs(POpts) do
            local OptBtn = Instance.new("TextButton")
            OptBtn.Parent = PBox
            OptBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            OptBtn.Position = UDim2.new(0.1 + (BtnWidth * (i-1)), (i-1)*5, 0.5, 0)
            OptBtn.Size = UDim2.new(BtnWidth, 0, 0, 30)
            OptBtn.Font = Enum.Font.Gotham
            OptBtn.Text = opt
            OptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            OptBtn.TextSize = 12
            OptBtn.ZIndex = 52
            
            local OCorner = Instance.new("UICorner")
            OCorner.CornerRadius = UDim.new(0, 4)
            OCorner.Parent = OptBtn
            
            OptBtn.MouseButton1Click:Connect(function()
                PCallback(opt)
                TweenService:Create(PopupOverlay, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                task.wait(0.2)
                PBox:Destroy()
                PopupOverlay.Visible = false
            end)
        end
    end

    local FirstTab = true
    local Tabs = {}
    local Window = {}
    
    function Window:MakeTab(tabConfig)
        local TabName = tabConfig.Name or "Tab"
        local Tab = {}
        local isLocked = false
        
        local TabBtn = Instance.new("TextButton")
        TabBtn.Parent = TabContainer
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        TabBtn.BackgroundTransparency = FirstTab and 0 or 1
        TabBtn.Size = UDim2.new(1, 0, 0, 30)
        TabBtn.Font = Enum.Font.GothamBold
        TabBtn.Text = TabName
        TabBtn.TextColor3 = FirstTab and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
        TabBtn.TextSize = 12
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 4)
        TabCorner.Parent = TabBtn
        
        local TabPage = Instance.new("ScrollingFrame")
        TabPage.Parent = ContentContainer
        TabPage.BackgroundTransparency = 1
        TabPage.Size = UDim2.new(1, 0, 1, 0)
        TabPage.ScrollBarThickness = 2
        TabPage.Visible = FirstTab
        
        local PageLayout = Instance.new("UIListLayout")
        PageLayout.Parent = TabPage
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 8)
        
        table.insert(Tabs, {Btn = TabBtn, Page = TabPage})
        FirstTab = false
        
        TabBtn.MouseButton1Click:Connect(function()
            if isLocked then return end
            for _, t in pairs(Tabs) do
                t.Btn.BackgroundTransparency = 1
                t.Btn.TextColor3 = Color3.fromRGB(180, 180, 180)
                t.Page.Visible = false
            end
            TabBtn.BackgroundTransparency = 0
            TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabPage.Visible = true
        end)
        
        function Tab:AddButton(btnCfg)
            local bName = btnCfg.Name or "Button"
            local bCallback = btnCfg.Callback or function() end
            local ItemLocked = false
            
            local BtnItem = Instance.new("TextButton")
            BtnItem.Parent = TabPage
            BtnItem.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            BtnItem.Size = UDim2.new(1, 0, 0, 35)
            BtnItem.Font = Enum.Font.Gotham
            BtnItem.Text = bName
            BtnItem.TextColor3 = Color3.fromRGB(255, 255, 255)
            BtnItem.TextSize = 13
            
            local BCorner = Instance.new("UICorner")
            BCorner.CornerRadius = UDim.new(0, 4)
            BCorner.Parent = BtnItem
            
            BtnItem.MouseButton1Click:Connect(function()
                if not ItemLocked then bCallback() end
            end)
            
            local ItemApi = {}
            function ItemApi:Lock(state)
                ItemLocked = state
                BtnItem.TextColor3 = state and Color3.fromRGB(100, 100, 100) or Color3.fromRGB(255, 255, 255)
            end
            return ItemApi
        end
        
        function Tab:AddToggle(tglCfg)
            local tName = tglCfg.Name or "Toggle"
            local tDefault = tglCfg.Default or false
            local tCallback = tglCfg.Callback or function() end
            local state = tDefault
            local ItemLocked = false
            
            local TglItem = Instance.new("TextButton")
            TglItem.Parent = TabPage
            TglItem.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            TglItem.Size = UDim2.new(1, 0, 0, 35)
            TglItem.Font = Enum.Font.Gotham
            TglItem.Text = "  " .. tName
            TglItem.TextColor3 = Color3.fromRGB(255, 255, 255)
            TglItem.TextSize = 13
            TglItem.TextXAlignment = Enum.TextXAlignment.Left
            
            local TCorner = Instance.new("UICorner")
            TCorner.CornerRadius = UDim.new(0, 4)
            TCorner.Parent = TglItem
            
            local Indicator = Instance.new("Frame")
            Indicator.Parent = TglItem
            Indicator.BackgroundColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(50, 50, 50)
            Indicator.Position = UDim2.new(1, -30, 0.5, -8)
            Indicator.Size = UDim2.new(0, 16, 0, 16)
            
            local ICorner = Instance.new("UICorner")
            ICorner.CornerRadius = UDim.new(0, 4)
            ICorner.Parent = Indicator
            
            TglItem.MouseButton1Click:Connect(function()
                if ItemLocked then return end
                state = not state
                TweenService:Create(Indicator, TweenInfo.new(0.2), {BackgroundColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(50, 50, 50)}):Play()
                tCallback(state)
            end)
            
            local ItemApi = {}
            function ItemApi:Lock(lState)
                ItemLocked = lState
                TglItem.TextColor3 = lState and Color3.fromRGB(100, 100, 100) or Color3.fromRGB(255, 255, 255)
            end
            return ItemApi
        end
        
        function Tab:AddInput(inpCfg)
            local iName = inpCfg.Name or "Input"
            local iCallback = inpCfg.Callback or function() end
            local ItemLocked = false
            
            local InpItem = Instance.new("Frame")
            InpItem.Parent = TabPage
            InpItem.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            InpItem.Size = UDim2.new(1, 0, 0, 40)
            
            local ICorner = Instance.new("UICorner")
            ICorner.CornerRadius = UDim.new(0, 4)
            ICorner.Parent = InpItem
            
            local ILabel = Instance.new("TextLabel")
            ILabel.Parent = InpItem
            ILabel.BackgroundTransparency = 1
            ILabel.Position = UDim2.new(0, 10, 0, 0)
            ILabel.Size = UDim2.new(0.5, 0, 1, 0)
            ILabel.Font = Enum.Font.Gotham
            ILabel.Text = iName
            ILabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ILabel.TextSize = 13
            ILabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local IBox = Instance.new("TextBox")
            IBox.Parent = InpItem
            IBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            IBox.Position = UDim2.new(0.6, 0, 0.5, -12)
            IBox.Size = UDim2.new(0.35, 0, 0, 24)
            IBox.Font = Enum.Font.Gotham
            IBox.Text = ""
            IBox.PlaceholderText = "..."
            IBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            IBox.TextSize = 12
            
            local IBCorner = Instance.new("UICorner")
            IBCorner.CornerRadius = UDim.new(0, 4)
            IBCorner.Parent = IBox
            
            IBox.FocusLost:Connect(function(enter)
                if not ItemLocked and enter then
                    iCallback(IBox.Text)
                end
            end)
            
            local ItemApi = {}
            function ItemApi:Lock(lState)
                ItemLocked = lState
                ILabel.TextColor3 = lState and Color3.fromRGB(100, 100, 100) or Color3.fromRGB(255, 255, 255)
                IBox.TextEditable = not lState
            end
            return ItemApi
        end
        
        function Tab:AddDropdown(ddCfg)
            local dName = ddCfg.Name or "Dropdown"
            local dOpts = ddCfg.Options or {}
            local dCallback = ddCfg.Callback or function() end
            local ItemLocked = false
            local dOpen = false
            
            local DdItem = Instance.new("Frame")
            DdItem.Parent = TabPage
            DdItem.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            DdItem.Size = UDim2.new(1, 0, 0, 35)
            DdItem.ClipsDescendants = true
            
            local DCorner = Instance.new("UICorner")
            DCorner.CornerRadius = UDim.new(0, 4)
            DCorner.Parent = DdItem
            
            local DdBtn = Instance.new("TextButton")
            DdBtn.Parent = DdItem
            DdBtn.BackgroundTransparency = 1
            DdBtn.Size = UDim2.new(1, 0, 0, 35)
            DdBtn.Font = Enum.Font.Gotham
            DdBtn.Text = "  " .. dName
            DdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            DdBtn.TextSize = 13
            DdBtn.TextXAlignment = Enum.TextXAlignment.Left
            
            local DdContainer = Instance.new("Frame")
            DdContainer.Parent = DdItem
            DdContainer.BackgroundTransparency = 1
            DdContainer.Position = UDim2.new(0, 0, 0, 35)
            DdContainer.Size = UDim2.new(1, 0, 1, -35)
            
            local DdLayout = Instance.new("UIListLayout")
            DdLayout.Parent = DdContainer
            DdLayout.SortOrder = Enum.SortOrder.LayoutOrder
            
            local function closeDd()
                dOpen = false
                TweenService:Create(DdItem, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 35)}):Play()
            end
            
            local function refreshOpts(opts)
                for _, child in ipairs(DdContainer:GetChildren()) do
                    if child:IsA("TextButton") then child:Destroy() end
                end
                for _, opt in ipairs(opts) do
                    local optBtn = Instance.new("TextButton")
                    optBtn.Parent = DdContainer
                    optBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    optBtn.Size = UDim2.new(1, 0, 0, 30)
                    optBtn.Font = Enum.Font.Gotham
                    optBtn.Text = opt
                    optBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
                    optBtn.TextSize = 12
                    
                    optBtn.MouseButton1Click:Connect(function()
                        dCallback(opt)
                        DdBtn.Text = "  " .. dName .. " : " .. opt
                        closeDd()
                    end)
                end
            end
            
            refreshOpts(dOpts)
            
            DdBtn.MouseButton1Click:Connect(function()
                if ItemLocked then return end
                dOpen = not dOpen
                local targetSize = dOpen and UDim2.new(1, 0, 0, 35 + (#dOpts * 30)) or UDim2.new(1, 0, 0, 35)
                TweenService:Create(DdItem, TweenInfo.new(0.2), {Size = targetSize}):Play()
            end)
            
            local ItemApi = {}
            function ItemApi:Lock(lState)
                ItemLocked = lState
                DdBtn.TextColor3 = lState and Color3.fromRGB(100, 100, 100) or Color3.fromRGB(255, 255, 255)
                if lState and dOpen then closeDd() end
            end
            function ItemApi:Refresh(newOpts)
                dOpts = newOpts
                refreshOpts(dOpts)
                if dOpen then
                    DdItem.Size = UDim2.new(1, 0, 0, 35 + (#dOpts * 30))
                end
            end
            return ItemApi
        end
        
        function Tab:Lock(state)
            isLocked = state
            TabBtn.TextTransparency = state and 0.5 or 0
        end
        
        function Tab:Delete()
            TabBtn:Destroy()
            TabPage:Destroy()
        end
        
        TabPage.ChildAdded:Connect(function()
            TabPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
        end)
        
        return Tab
    end
    
    TabContainer.ChildAdded:Connect(function()
        TabListLayout.Parent = TabContainer
        TabContainer.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y + 10)
    end)
    
    return Window
end

-- ==========================================
-- Example Usage Below
-- ==========================================

local Window = AZTMod:CreateWindow({
    Name = "aztvn.top",
    HubName = "[       aztvn.top       ]",
    UseKeySystem = false,
    OnLoad = function()
        warn('aztvn.load')
    end
})

local MainTab = Window:MakeTab({Name = "Main"})
local SettingsTab = Window:MakeTab({Name = "Settings"})

MainTab:AddButton({
    Name = "Inf Stamina [Instants]",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/aztvn/AZTScript/refs/heads/main/OpenSrc/Instant.InfStamina.lua'))()
    end
})

MainTab:AddButton({
    Name = "Inf Stamina [Legit PE]",
    Callback = function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

        local NORMAL_SPEED = 16
        local SPRINT_SPEED = 32
        local isSprinting = false

        --"Đang xử lý nút chạy gốc...")

        task.spawn(function()
            local profileGui = PlayerGui:WaitForChild("Profile", 15)
            if not profileGui then return end
            
            local mainFrame = profileGui:WaitForChild("MainFrame", 10)
            if not mainFrame then return end
            
            local oldRunButton = mainFrame:WaitForChild("Run", 10)
            if oldRunButton then
                local newRunButton = oldRunButton:Clone()
                newRunButton.Name = "Run"
                newRunButton.Parent = mainFrame
                
                oldRunButton:Destroy()
                
                newRunButton.Visible = true
                
                newRunButton.Activated:Connect(function()
                    isSprinting = not isSprinting
                    
                    if isSprinting then
                        newRunButton.Image = "rbxassetid://87368778319194"
                        if newRunButton:FindFirstChild("Icon") then
                            newRunButton.Icon.ImageColor3 = Color3.fromRGB(0, 0, 0)
                        end
                    else
                        newRunButton.Image = "rbxassetid://121714636260707"
                        if newRunButton:FindFirstChild("Icon") then
                            newRunButton.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                        end
                    end
                end)
                
                --"Đã thay thế và gán trigger mới vào nút thành công!")
            end
end)

RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            local isSpecialState = char:GetAttribute("teXe") or char:GetAttribute("tongBanCa") or char:GetAttribute("capTapHocSinh") or char:GetAttribute("IsKunai")
            
            if not isSpecialState then
                if isSprinting then
                    if hum.WalkSpeed < SPRINT_SPEED then
                        hum.WalkSpeed = SPRINT_SPEED
                    end
                else
                    if hum.WalkSpeed == SPRINT_SPEED then
                        hum.WalkSpeed = NORMAL_SPEED
                    end
                end
            end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    isSprinting = false
end)
    end
})
MainTab:AddButton({
    Name = "Inf Stamina [Legit Pc]",
    Callback = function()
 local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local NORMAL_SPEED = 16
local SPRINT_SPEED = 32
local isSprinting = false

--"Đang thiết lập hệ thống chạy PC ẩn (Legit Bypass)...")

-- 1. Bắt phím Shift bằng ContextActionService
-- Việc này sẽ khiến gameProcessedEvent = true, làm script gốc của game bỏ qua phím Shift (không bị trừ thể lực)
local function onSprintAction(actionName, inputState, inputObject)
    if inputState == Enum.UserInputState.Begin then
        isSprinting = true
    elseif inputState == Enum.UserInputState.End or inputState == Enum.UserInputState.Cancel then
        isSprinting = false
    end
    
    -- Trả về Sink để "nuốt" sự kiện, không cho truyền xuống lệnh kích hoạt stamina của game
    return Enum.ContextActionResult.Sink
end

-- Gán phím Shift trái và phải vào hệ thống mới
ContextActionService:BindAction("LegitPCSprint", onSprintAction, false, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift)

-- 2. Vòng lặp duy trì tốc độ chạy mượt mà
RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            -- Tôn trọng các trạng thái đặc biệt của game (lái xe, đang làm nhiệm vụ...)
            local isSpecialState = char:GetAttribute("teXe") or char:GetAttribute("tongBanCa") or char:GetAttribute("capTapHocSinh") or char:GetAttribute("IsKunai")
            
            if not isSpecialState then
                if isSprinting then
                    if hum.WalkSpeed < SPRINT_SPEED then
                        hum.WalkSpeed = SPRINT_SPEED
                    end
                else
                    -- Chỉ đưa về tốc độ 16 nếu tốc độ hiện tại đang là 32 (tránh đè lệnh khi game ép tốc độ về 0)
                    if hum.WalkSpeed == SPRINT_SPEED then
                        hum.WalkSpeed = NORMAL_SPEED
                    end
                end
            end
        end
    end
end)

-- 3. Đặt lại trạng thái khi nhân vật chết hoặc hồi sinh
LocalPlayer.CharacterAdded:Connect(function()
    isSprinting = false
end)

--"Đã kích hoạt chạy PC (ContextAction) - Không trừ thể lực!")

    end
})
