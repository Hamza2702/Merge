local Players = game:GetService("Players")

local function leaderboardSetup(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local merges = Instance.new("IntValue")
	merges.Name = "Merges"
	merges.Value = 0
	merges.Parent = leaderstats
end

Players.PlayerAdded:Connect(leaderboardSetup)

function addMerges()
	for _, player in pairs(Players:GetPlayers()) do
		local leaderstats = player:FindFirstChild("leaderstats")
		if leaderstats then
			local merges = leaderstats:FindFirstChild("Merges")
			if merges then
				merges.Value = merges.Value + 1
			end
		end
	end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local addMergesEvent = ReplicatedStorage:WaitForChild("AddMergesEvent")

addMergesEvent.OnServerEvent:Connect(function()
	addMerges()
end)