-- GrowHub V3 PRO Loader by SproutX

local version = "3.0"
local repo = "SproutX-Scripter/GrowAGardenScrpter"
local mainScript = "GrowAGardenMain.lua"

-- UI Loading Screen
local function loadingScreen()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 400, 0, 200)
    Frame.Position = UDim2.new(0.5, -200, 0.5, -100)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.Text = "🌿 GrowHub V3 PRO"
    Title.Font = Enum.Font.GothamBold
    Title.TextColor3 = Color3.fromRGB(0, 255, 128)
    Title.TextSize = 30
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Parent = Frame

    local Loading = Instance.new("TextLabel")
    Loading.Text = "Loading, please wait..."
    Loading.Font = Enum.Font.Gotham
    Loading.TextColor3 = Color3.fromRGB(255, 255, 255)
    Loading.TextSize = 20
    Loading.Position = UDim2.new(0, 0, 0, 100)
    Loading.Size = UDim2.new(1, 0, 0, 50)
    Loading.Parent = Frame

    wait(2)
    ScreenGui:Destroy()
end

loadingScreen()

-- Load the Main Script
local success, result = pcall(function()
    local url = "https://raw.githubusercontent.com/"..repo.."/main/"..mainScript
    local mainScriptContent = game:HttpGet(url)
    loadstring(mainScriptContent)()
end)

if not success then
    warn("Error loading main script:", result)
end
