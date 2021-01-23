-- no auto buy dna/class because im too lazy ^^

local vu = game:GetService("VirtualUser") -- Anti Afk
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/iNugraha1/Release/main/uwuware.lua'))()
local plr = game:GetService("Players").LocalPlayer
local gmt = getrawmetatable(game)
local oldIndex = gmt.__index

setreadonly(gmt, false)

gmt.__index = newcclosure(function(ws, jp)
    if not checkcaller() then
        if ws == "WalkSpeed" then 
            return 16
        end
        if ws == "JumpPower" then
            return 50
        end
    end
    return oldIndex(ws, jp)
end)

local lift = false
local sell = false
local w = false 
local d = false
local c = false

local w = lib:CreateWindow"Workout Island"
local f = w:AddFolder"Main"

f:AddToggle({text = "Auto Lift", flag = "your_mom", state = false, callback = function(bool)
    lift = bool 
end})

f:AddToggle({text = "Auto Sell", flag = "your_mom", state = false, callback = function(bool)
    sell = bool 
end})

f:AddToggle({text = "Auto Buy Weight", flag = "your_mom", state = false, callback = function(bool)
    w = bool 
end})

f:AddSlider({text = "Walk Speed", flag = "your_mom", value = 16, min = 16, max = 300, callback = function(value)
    plr.Character.Humanoid.WalkSpeed = (value)
end})

f:AddSlider({text = "Jump Power", flag = "your_mom", value = 50, min = 50, max = 300, callback = function(value)
    plr.Character.Humanoid.JumpPower = (value)
end})

f:AddButton({text = "Destroy GUI", flag = "your_mom", callback = function()
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v.Name == "ScreenGui" and v:FindFirstChild("Frame") and v:FindFirstChild("ImageButton") then
            v:Destroy()
        end
    end
end})

spawn(function()
    while wait() do
        if lift then
            game:GetService("ReplicatedStorage").Remotes.LiftWeight:FireServer()
        end
    end
end)

spawn(function()
    while wait() do
        if sell then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-26.1917629, 165.90004, 73.3438416, 0.992757618, 1.31294575e-08, 0.12013454, -7.12674808e-09, 1, -5.03962063e-08, -0.12013454, 4.91750498e-08, 0.992757618)
            wait(0.1)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-43.4603729, 165.899963, 106.123268, 0.155445099, 6.91636401e-08, 0.987844527, -9.46589562e-09, 1, -6.85251678e-08, -0.987844527, 1.30106836e-09, 0.155445099)
        end
    end
end)

spawn(function()
    while wait() do
        if w then
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestBuyAll:InvokeServer("Weight")
        end
    end
end)

lib:Init()
