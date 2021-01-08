-- Feel Free To Skid!
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/main/Reuploaded"))() --someone reuploaded it so I put it in place of the original back up so guy can get free credit.
local venyx = library.new("Science Simulator", 5013109572)
local plr = game:GetService("Players").LocalPlayer

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

local page = venyx:addPage("Main", 5012544693)
local theme = venyx:addPage("Settings", 5012544693)
local autofarm = page:addSection("Auto Farm")
local teleport = page:addSection("Teleport")
local colors = theme:addSection("Colors")
local credits = theme:addSection("Credits")

local ac = false
local rebirth = false

local firstReb = 0
local Event2 = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].net.NetManagedInstances["8771bd17-d62e-4383-9603-70939a160ae6"]

local secReb = 1
local Event3 = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].net.NetManagedInstances["8771bd17-d62e-4383-9603-70939a160ae6"]

local thirdReb = 2
local Event4 = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].net.NetManagedInstances["8771bd17-d62e-4383-9603-70939a160ae6"]

local fourthReb = 3
local Event5 = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].net.NetManagedInstances["8771bd17-d62e-4383-9603-70939a160ae6"]

autofarm:addToggle("Auto Click", nil, function(bool)
	ac = bool 
	if ac then
		repeat wait()
			local Event = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].net.NetManagedInstances["ceacbc54-f172-4f96-a1d6-4a9235205b53"]
			Event:FireServer()
		until not ac
	end
end)

autofarm:addToggle("Auto Rebirth", nil, function(bool)
	rebirth = bool
	if rebirth then
		repeat wait()
			if plr.leaderstats.Rebirths.Value > 1 and plr.leaderstats.Rebirths.Value < 10 then
				Event2:FireServer(firstReb)
			else
				if plr.leaderstats.Rebirths.Value >= 9 and plr.leaderstats.Rebirths.Value < 25 then
					Event3:FireServer(secReb)
				else
					if plr.leaderstats.Rebirths.Value >= 24 and plr.leaderstats.Rebirths.Value < 50 then
						Event4:FireServer(thirdReb)
					else
						if plr.leaderstats.Rebirths.Value >= 49 and plr.leaderstats.Rebirths.Value < 99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999 then -- math huge doesn't work so i use this long shit
							Event5:FireServer(fourthReb)
						end
					end
				end
			end
		until not rebirth
	end
end)

teleport:addDropdown("Teleport", {"Faded Mountains", "Winter Tundra", "Candy Land", "Tropical Lobby"},function(a)
	if a == "Faded Mountains" then
		plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").map["Faded Mountains"].teleport.CFrame
	else
		if a == "Winter Tundra" then
			plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").map["Winter Tundra"].teleport.CFrame
		else
			if a == "Candy Land" then
				plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").map["Candy Land"].teleport.CFrame
			else
				if a == "Tropical Lobby" then
					plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").map["Tropical Lobby"].Teleport.CFrame
				end
			end
		end
	end
end)

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
	colors:addColorPicker(theme, color, function(color3)
		venyx:setTheme(theme, color3)
	end)
end

credits:addButton("Script By: iNugraha",function()
	print("y")
end)

credits:addButton("UI Library: Venyx",function()
	print("venyx is actually good")
end)

credits:addButton("Destroy UI",function()
	game:GetService("CoreGui")["Science Simulator"]:Destroy()
end)

-- Note that im not a fucking yandev because my limitless if else statement
