local SoundService = game:GetService("SoundService")
local effects = SoundService:WaitForChild("Effects")
local players = game:GetService("Players")
local player = players.LocalPlayer or players.PlayerAdded:Wait()
local button = script.Parent

local debounce = false
local enabled = true

button.MouseButton1Down:Connect(function()
	if not debounce then
		debounce = true
		if enabled then
			enabled = false
			button.BackgroundColor3 = Color3.fromRGB(222, 40, 40)
			button.Text = "Disabled"

			-- Stop all effects
			for _, effect in pairs(effects:GetChildren()) do
				if effect:IsA("Sound") then
					effect.Volume = 0
				end
			end

		else
			enabled = true
			button.BackgroundColor3 = Color3.fromRGB(111, 222, 43)
			button.Text = "Enabled"

			-- Play all effects
			for _, effect in pairs(effects:GetChildren()) do
				if effect:IsA("Sound") then
					effect.Volume = 1
				end
			end
		end
		wait(0.2)
		debounce = false
	end
end)
