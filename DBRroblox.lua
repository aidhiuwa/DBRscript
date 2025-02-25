-- Gui to Lua
-- Version: 3.2

-- Instances:

local DBR = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Holder = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local ForceWiggle = Instance.new("TextLabel")
local BlindKiller = Instance.new("TextLabel")
local DashForwards = Instance.new("TextLabel")

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

ForceWiggle.Name = "Force Wiggle"
ForceWiggle.Parent = Holder
ForceWiggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ForceWiggle.BackgroundTransparency = 0.900
ForceWiggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
ForceWiggle.BorderSizePixel = 0
ForceWiggle.Position = UDim2.new(0.510736167, 0, 0.043524418, 0)
ForceWiggle.Size = UDim2.new(0.423312873, 0, 0.0711252689, 0)
ForceWiggle.Font = Enum.Font.Roboto
ForceWiggle.Text = "Force Wiggle (Ctrl+L)"
ForceWiggle.TextColor3 = Color3.fromRGB(1, 46, 85)
ForceWiggle.TextScaled = true
ForceWiggle.TextSize = 14.000
ForceWiggle.TextWrapped = true

BlindKiller.Name = "Blind Killer"
BlindKiller.Parent = Holder
BlindKiller.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BlindKiller.BackgroundTransparency = 0.900
BlindKiller.BorderColor3 = Color3.fromRGB(0, 0, 0)
BlindKiller.BorderSizePixel = 0
BlindKiller.Position = UDim2.new(0.510736167, 0, 0.043524418, 0)
BlindKiller.Size = UDim2.new(0.423312873, 0, 0.0711252689, 0)
BlindKiller.Font = Enum.Font.Roboto
BlindKiller.Text = "Force Blind Killer    (Ctrl + F)"
BlindKiller.TextColor3 = Color3.fromRGB(1, 46, 85)
BlindKiller.TextScaled = true
BlindKiller.TextSize = 14.000
BlindKiller.TextWrapped = true

DashForwards.Name = "Dash Forwards"
DashForwards.Parent = Holder
DashForwards.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DashForwards.BackgroundTransparency = 0.900
DashForwards.BorderColor3 = Color3.fromRGB(0, 0, 0)
DashForwards.BorderSizePixel = 0
DashForwards.Position = UDim2.new(0.510736167, 0, 0.043524418, 0)
DashForwards.Size = UDim2.new(0.423312873, 0, 0.0711252689, 0)
DashForwards.Font = Enum.Font.Roboto
DashForwards.Text = "Dash Forwards (E)"
DashForwards.TextColor3 = Color3.fromRGB(1, 46, 85)
DashForwards.TextScaled = true
DashForwards.TextSize = 14.000
DashForwards.TextWrapped = true

-- Scripts:

local function LGXRU_fake_script() -- ForceWiggle.Script 
	local script = Instance.new('Script', ForceWiggle)

	local UIS = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	
	local CtrlPressed = false
	local Killer = nil
	
	local function SetKiller()
		for _, plr in pairs(game.Players:GetPlayers()) do
			if plr.Backpack.Scripts.Killer.Value == true then
				Killer = plr
				break
			end
		end
	end
	
	UIS.InputBegan:Connect(function(key, e)
		if key.KeyCode == Enum.KeyCode.LeftControl or key.KeyCode == Enum.KeyCode.RightControl then
			CtrlPressed = true
		elseif key.KeyCode == Enum.KeyCode.L and e then
	        local count = 0
	        
			SetKiller()
	
			wait(1)
	        
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
	        
			CtrlPressed = false
	    end
	end)
	
	spawn(function()
	    while true do
	        task.wait(3)
			CtrlPressed = false
	    end
	end)
	
	
end
coroutine.wrap(LGXRU_fake_script)()
local function PLBM_fake_script() -- Holder.Script 
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
coroutine.wrap(PLBM_fake_script)()
local function EBGDUYP_fake_script() -- BlindKiller.Script 
	local script = Instance.new('Script', BlindKiller)

	local UIS = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	
	local CtrlPressed = false
	local Killer = nil
	
	local function SetKiller()
		for _, plr in pairs(game.Players:GetPlayers()) do
			if plr.Backpack.Scripts.Killer.Value == true then
				Killer = plr
				break
			end
		end
	end
	
	UIS.InputBegan:Connect(function(key, e)
		if key.KeyCode == Enum.KeyCode.LeftControl or key.KeyCode == Enum.KeyCode.RightControl then
			CtrlPressed = true
		elseif key.KeyCode == Enum.KeyCode.F and e then
			SetKiller()
	
			wait(1)
			
			local args = {
				[1] = "StartBlinding",
				[2] = Killer.Character.Flash_Zone
			}
	
			game:GetService("Players").LocalPlayer.Backpack.Scripts.GlobalSurvivor.Action.UseItem.Flashlight.Flashlight:FireServer(unpack(args))
	
			wait(4)
	
			local args = {
				[1] = "StopBlinding"
			}
	
			game:GetService("Players").LocalPlayer.Backpack.Scripts.GlobalSurvivor.Action.UseItem.Flashlight.Flashlight:FireServer(unpack(args))
	
		end
	end)
	
	spawn(function()
		while true do
			task.wait(3)
			CtrlPressed = false
		end
	end)
end
coroutine.wrap(EBGDUYP_fake_script)()
local function JDXGMZF_fake_script() -- DashForwards.Script 
	local script = Instance.new('Script', DashForwards)

	local UIS = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	
	local Plr = Players.LocalPlayer
	
	
	UIS.InputBegan:Connect(function(key, e)
		if key.KeyCode == Enum.KeyCode.E and e then
			local Character = Plr.Character
			
			Character:PivotTo(Character:GetPivot() * CFrame.new(0, 0, -5))
		end
	end)
end
coroutine.wrap(JDXGMZF_fake_script)()
local function KZIS_fake_script() -- DBR.Script 
	local script = Instance.new('Script', DBR)

	local UIS = game:GetService("UserInputService")
	
	UIS.InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.P then
			script.Parent.Enabled = not script.Parent.Enabled
		end
	end)
end
coroutine.wrap(KZIS_fake_script)()
