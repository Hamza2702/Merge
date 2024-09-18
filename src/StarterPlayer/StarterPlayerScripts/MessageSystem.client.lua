local TextChatService = game:GetService("TextChatService")
local Prefix = {Text = "[Server]: ", Color = Color3.fromRGB(255, 206, 58)}
local Messages = {
	"👍 Make sure to like and favourite the game!",
	"👑 Purchase gamepasses to enhance your experience!",
	"Unequip everything to ensure a full data save!",
	"🛠️ Make sure to purchase new gears from the shop!"
}

while true do
	-- Time to display the msg
	wait(math.random(60, 600))

	-- Random msg
	local randomMessage = Messages[math.random(1, #Messages)]

	-- RichText formatting
	local coloredPrefix = string.format('<font color="rgb(%d, %d, %d)">%s</font>', Prefix.Color.r * 255, Prefix.Color.g * 255, Prefix.Color.b * 255, Prefix.Text)

	-- Message
	local combinedMessage = coloredPrefix .. randomMessage

	-- Display message
	TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(combinedMessage)
end
