local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local CheckGearEvent = ReplicatedStorage:WaitForChild("CheckGearEvent")
local GiveGearEvent = ReplicatedStorage:WaitForChild("GiveGearEvent")

local gearName = "Bloxiade"

script.Parent.MouseButton1Click:Connect(function()
	local merges = player.leaderstats:FindFirstChild("Merges")
	if merges then
		GiveGearEvent:FireServer(gearName)
	else
		print("Merges not found on player.")
	end
end)
