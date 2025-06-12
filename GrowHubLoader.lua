-- GrowHub V3 PRO+ Loader by SproutX 🚀

local localVersion = "3.0"
local repo = "SproutX-Scripter/GrowAGardenScrpter"
local mainScript = "GrowAGardenMain.lua"
local versionFile = "version.txt"

-- UI Loading Screen
local function loadingScreen(statusText)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = "GrowHubLoading"

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 400, 0, 200)
    Frame.Position = UDim2.new(0.5, -200, 0.5, -100)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.Text = "🌿 GrowHub V3 PRO+"
    Title.Font = Enum.Font.GothamBold
    Title.TextColor3 = Color3.fromRGB(0, 255, 128)
    Title.TextSize = 30
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Parent = Frame

    local Subtitle = Instance.new("TextLabel")
    Subtitle.Text = statusText
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Subtitle.TextSize = 20
    Subtitle.Position = UDim2.new(0, 0, 0, 100)
    Subtitle.Size = UDim2.new(1, 0, 0, 50)
    Subtitle.Parent = Frame

    return ScreenGui, Subtitle
end

-- Show initial loading
local gui, subtitle = loadingScreen("Checking for Updates...")

-- Version check
local function checkVersion()
    local url = "https://raw.githubusercontent.com/"..repo.."/main/"..versionFile
    local remoteVersion = game:HttpGet(url)
    if remoteVersion and remoteVersion ~= localVersion then
        subtitle.Text = "New Update Available!"
        wait(2)
    else
        subtitle.Text = "Up to Date!"
        wait(1)
    end
end

checkVersion()
gui:Destroy()

-- Load the Main Script
local success, result = pcall(function()
    local url = "https://raw.githubusercontent.com/"..repo.."/main/"..mainScript
    local mainScriptContent = game:HttpGet(url)
    loadstring(mainScriptContent)()
end)

if not success then
    warn("Error loading main script:", result)
end
