local SoundService = game:GetService("SoundService")
local Songs = SoundService:WaitForChild("Songs")
local song = Songs:WaitForChild("Background")

local button = script.Parent

local debounce = false
local enabled = true

button.MouseButton1Down:Connect(function()
	if not debounce then
		debounce = true
		if enabled then
			enabled = false
			song.Playing = false
			button.BackgroundColor3 = Color3.fromRGB(222, 40, 40)
			button.Text = "Disabled"
		else
			enabled = true
			song.Playing = true
			button.BackgroundColor3 = Color3.fromRGB(111, 222, 43)
			button.Text = "Enabled"
		end
		wait(.2)
		debounce = false
	end
end)