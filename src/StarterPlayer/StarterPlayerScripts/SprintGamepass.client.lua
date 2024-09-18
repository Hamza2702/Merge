local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local Player = Players.LocalPlayer

local UI = Player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local sprintFrame = UI:WaitForChild("Sprint")
local sprintButton = UI:WaitForChild("SprintButton")
local passID = 859914334

local remoteEvent = ReplicatedStorage:WaitForChild("UpdateSprintUI")

-- Update the UI frame
local function updateUI(hasPass)
    if hasPass then
        sprintFrame.Visible = true
        sprintButton.Visible = false
    else
        sprintFrame.Visible = false
        sprintButton.Visible = true
        sprintButton.MouseButton1Click:Connect(function()
            MarketplaceService:PromptGamePassPurchase(Player, passID)
        end)
    end
end

-- Check for remote event
remoteEvent.OnClientEvent:Connect(updateUI)

