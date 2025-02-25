-- Gui to Lua
-- Version: 3.2

-- Instances:

local DBR = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Holder = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local BlindKillerButton = Instance.new("TextButton")
local ForceWiggleButton = Instance.new("TextButton")
local UnhookAll = Instance.new("TextButton")

--Properties:

DBR.Name = "DBR"
DBR.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
DBR.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = DBR
Background.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
Background.BackgroundTransparency = 0.150
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.1002611, 0, 0.0488506034, 0)
Background.Size = UDim2.new(0.340469986, 0, 0.902298808, 0)

Holder.Name = "Holder"
Holder.Parent = Background
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(0.0368097685, 0, 0.0265392475, 0)
Holder.Size = UDim2.new(0.926380455, 0, 0.946921527, 0)

UIGridLayout.Parent = Holder
UIGridLayout.FillDirection = Enum.FillDirection.Vertical
UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
UIGridLayout.CellSize = UDim2.new(0.423000008, 0, 0.0710000023, 0)

BlindKillerButton.Name = "Blind Killer Button"
BlindKillerButton.Parent = Holder
BlindKillerButton.BackgroundColor3 = Color3.fromRGB(131, 133, 136)
BlindKillerButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
BlindKillerButton.BorderSizePixel = 0
BlindKillerButton.Size = UDim2.new(0, 200, 0, 50)
BlindKillerButton.Font = Enum.Font.SourceSans
BlindKillerButton.Text = "Force Blind Killer"
BlindKillerButton.TextColor3 = Color3.fromRGB(1, 46, 85)
BlindKillerButton.TextScaled = true
BlindKillerButton.TextSize = 14.000
BlindKillerButton.TextWrapped = true

ForceWiggleButton.Name = "Force Wiggle Button"
ForceWiggleButton.Parent = Holder
ForceWiggleButton.BackgroundColor3 = Color3.fromRGB(131, 133, 136)
ForceWiggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ForceWiggleButton.BorderSizePixel = 0
ForceWiggleButton.Size = UDim2.new(0, 200, 0, 50)
ForceWiggleButton.Font = Enum.Font.SourceSans
ForceWiggleButton.Text = "Force My Wiggle"
ForceWiggleButton.TextColor3 = Color3.fromRGB(1, 46, 85)
ForceWiggleButton.TextScaled = true
ForceWiggleButton.TextSize = 14.000
ForceWiggleButton.TextWrapped = true

UnhookAll.Name = "Unhook All"
UnhookAll.Parent = Holder
UnhookAll.BackgroundColor3 = Color3.fromRGB(131, 133, 136)
UnhookAll.BorderColor3 = Color3.fromRGB(0, 0, 0)
UnhookAll.BorderSizePixel = 0
UnhookAll.Size = UDim2.new(0, 200, 0, 50)
UnhookAll.Font = Enum.Font.SourceSans
UnhookAll.Text = "Unhook All Hooked Players"
UnhookAll.TextColor3 = Color3.fromRGB(1, 46, 85)
UnhookAll.TextScaled = true
UnhookAll.TextSize = 14.000
UnhookAll.TextWrapped = true

-- Scripts:

local function FMZU_fake_script() -- Holder.Script 
	local script = Instance.new('Script', Holder)

	local UIS = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	local Teams = game:GetService("Teams")
	
	local CtrlPressed = false
	local Killer = nil
	
	local function SetKiller()
		local killTeam = Teams:FindFirstChild("Kill")
		if not killTeam then return end
	
		for _, plr in Players:GetPlayers() do
			if plr.Team == killTeam then
				Killer = plr
				break
			end
		end
	end
	
	UIS.InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.LeftControl or key.KeyCode == Enum.KeyCode.RightControl then
			CtrlPressed = true
		elseif key.KeyCode == Enum.KeyCode.S and CtrlPressed then
	
		end
	end)
	
	spawn(function()
		while true do
			task.wait(3)
			CtrlPressed = false
		end
	end)
end
coroutine.wrap(FMZU_fake_script)()
local function NDPI_fake_script() -- BlindKillerButton.Script 
	local script = Instance.new('Script', BlindKillerButton)

	local Players = game:GetService("Players")
	
	local Killer = nil
	local plr = Players.LocalPlayer
	
	local function SetKiller()
		for _, plr in pairs(game.Players:GetPlayers()) do
			if plr.Backpack.Scripts.Killer.Value == true then
				Killer = plr
				break
			end
		end
	end
	
	script.Parent.MouseButton1Click:Connect(function()
		SetKiller()
	
		wait(1)
		
		if not Killer then print("Killer No Select") return end
	
		local args = {
			[1] = "StartBlinding",
			[2] = Killer.Character.Flash_Zone
		}
	
		plr.Backpack.Scripts.GlobalSurvivor.Action.UseItem.Flashlight.Flashlight:FireServer(unpack(args))
	
		wait(4)
	
		local args = {
			[1] = "StopBlinding"
		}
	
		plr.Backpack.Scripts.GlobalSurvivor.Action.UseItem.Flashlight.Flashlight:FireServer(unpack(args))
	
	end)
end
coroutine.wrap(NDPI_fake_script)()
local function BEMXI_fake_script() -- ForceWiggleButton.Script 
	local script = Instance.new('Script', ForceWiggleButton)

	local Players = game:GetService("Players")
	
	local Killer = nil
	
	local function SetKiller()
		for _, plr in pairs(game.Players:GetPlayers()) do
			if plr.Backpack.Scripts.Killer.Value == true then
				Killer = plr
				break
			end
		end
	end
	
	script.Parent.MouseButton1Click:Connect(function()
		local count = 0
	
		SetKiller()
	
		task.wait(1)
	
		if not Killer then
			print("Error: Killer team not found or players")
			return
		end
	
		repeat
			task.wait()
			count = count + 1
	
			local args = {
				[1] = "Wiggle",
				[2] = Killer
			}
	
			game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents"):FindFirstChild("Server_Event"):FireServer(unpack(args))
		until count >= 200
	end)
end
coroutine.wrap(BEMXI_fake_script)()
local function EXDGDTM_fake_script() -- UnhookAll.Script 
	local script = Instance.new('Script', UnhookAll)

	local function UnhookEvent(Plr, Hook)
		local args = {
			[1] = "Hook",
			[2] = "Unhook",
			[3] = Plr.Character, -- plr character
			[4] = Hook
		}
	
		game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Server_Event"):FireServer(unpack(args))
	end
	
	script.Parent.MouseButton1Click:Connect(function()
		for i, hook in pairs(game.Workspace:GetChildren()) do
			if string.find(hook.Name, "Hook") then
				if game.Players:FindFirstChild(hook.Panel.Player.Value) then
					UnhookEvent(game.Players:FindFirstChild(hook.Panel.Player.Value), hook)
				end
			end
		end
	end)
end
coroutine.wrap(EXDGDTM_fake_script)()
local function PMIFJA_fake_script() -- DBR.Script 
	local script = Instance.new('Script', DBR)

	local UIS = game:GetService("UserInputService")
	
	UIS.InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.P then
			script.Parent.Enabled = not script.Parent.Enabled
		end
	end)
end
coroutine.wrap(PMIFJA_fake_script)()
