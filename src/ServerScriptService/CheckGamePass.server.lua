local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local passID = 859914334

local function checkGamePassOwnership(player)
	local hasPass = false
	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, passID)
	end)

	if not success then
		warn("Error checking game pass ownership: " .. message)
	end

	local remoteEvent = ReplicatedStorage:WaitForChild("UpdateSprintUI")
	remoteEvent:FireClient(player, hasPass)
end

Players.PlayerAdded:Connect(checkGamePassOwnership)
