local Players = game:GetService("Players")

local module = {}

function module.leaderboardSetup(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local merges = Instance.new("IntValue")
	merges.Name = "Merges"
	merges.Value = 0
	merges.Parent = leaderstats
end

function module.addMerges()
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

Players.PlayerAdded:Connect(module.leaderboardSetup)

return module
