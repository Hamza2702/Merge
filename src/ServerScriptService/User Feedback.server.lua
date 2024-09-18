local ws = require(game:GetService('ServerScriptService').WebhookService)

local url = "https://discord.com/api/webhooks/1280842039524720843/F59dJDELFa5GkAcusoEYWs2972yuFW_4Oz1COXojps7Fd2LW_888gswY90jQNlrjJn89" --// Insert your webhook URL here

--// Discord webhooks start with "https://discord.com/api/webhooks/"

local req = ws:new()
local player = game:GetService("Players").LocalPlayer
local frame = game:GetService('StarterGui').FeedbackGUI.Frame

game.ReplicatedStorage.UserFeedback.OnServerEvent:Connect(function(player, report)
	req.Author = player.Name .. " | " .. player.DisplayName .. " | " .. player.UserId --// Title
	req.Color = ws.colors.blue --// Colours = 'red','green','blue','black','yellow'
	req.Footer = "Feedback" --// Footer (Feedback)
	req.TimeStamp = DateTime.now():ToIsoDate() --// Time
	

	local fields = {
		{
			['name'] = player.Name, --// Player Name
			['value'] = report, --// Message
			['inline'] = false 
		}
	}

	req.Fields = fields		

	--[[
	
	-->>Features<<--
	
	req.Title
	req.Description
	req.Content
	req.Fields
	req.Thumbnail
	req.Image
	req.Footer
	req.FooterIcon
	req.TimeStamp
	req.Color
	
	req.Author
	req.AuthorUrl
	req.AuthorLink
	
	]]

	req:sendAuthorEmbed(url)
end)
