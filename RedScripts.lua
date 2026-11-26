
-- REDSCRIPTS V2
-- SKIN CHANGER
-- Roblox Studio / Luau

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "RedScripts"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(300, 250)
main.Position = UDim2.new(0.5, -150, 0.5, -125)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 12)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(220, 0, 35)
stroke.Thickness = 2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundColor3 = Color3.fromRGB(130, 0, 20)
title.Text = "REDSCRIPTS | SKIN"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 17
title.Parent = main

local function button(name, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -30, 0, 38)
    b.Position = UDim2.fromOffset(15, y)
    b.BackgroundColor3 = Color3.fromRGB(65, 0, 15)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.Parent = main

    Instance.new("UICorner", b).CornerRadius =
        UDim.new(0, 7)

    b.MouseButton1Click:Connect(callback)
    return b
end

local originalDescription

local function getHumanoid()
    local character = player.Character
    if not character then return nil end
    return character:FindFirstChildOfClass("Humanoid")
end

local function saveOriginal()
    local humanoid = getHumanoid()
    if humanoid and not originalDescription then
        originalDescription = humanoid:GetAppliedDescription()
    end
end

local function changeSkin(kind)
    local humanoid = getHumanoid()
    if not humanoid then return end

    saveOriginal()

    local description = humanoid:GetAppliedDescription()

    if kind == "Headless" then
        description.Head = 0

    elseif kind == "Korblox" then
        -- Visual placeholder:
        -- No unauthorized avatar asset is loaded.
        description.LeftLeg = 0
    end

    humanoid:ApplyDescription(description)
end

button("VISUAL HEADLESS", 60, function()
    changeSkin("Headless")
end)

button("VISUAL KORBLOX", 108, function()
    changeSkin("Korblox")
end)

button("RESET SKIN", 156, function()
    local humanoid = getHumanoid()
    if humanoid and originalDescription then
        humanoid:ApplyDescription(originalDescription)
    end
end)

print("RedScripts Skin Changer Loaded!")
