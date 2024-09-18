local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UI = Player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")

local passID = 859914334

local button = script.Parent

button.MouseButton1Down:Connect(function()
	sprintPurchase()
end)

function sprintPurchase()
	local hasPass = false
	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(Player.UserId, passID)
	end)
	
	if not success then
		warn("Error while checking if player has pass: " .. tostring(message))
		return
	end
	
	if hasPass then
		owned()
	else
		MarketplaceService:PromptGamePassPurchase(Player, passID)
	end
end

function owned()
	local sprintFrame = UI:FindFirstChild("Sprint")
	if sprintFrame then
		sprintFrame.Visible = true
	else
		warn("Sprint frame not found")
	end
	button.Visible = false
end