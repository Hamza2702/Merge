local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local button = script.Parent
local enabled = false
local debounce = false

button.MouseButton1Down:Connect(function()
    sprint()
end)

function sprint()
	if Player and Player.Character then
		if Player.Character:FindFirstChildWhichIsA("Humanoid") then
			if not debounce then
				debounce = true

				if enabled then
					enabled = false
					Player.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 16
					button.Text = "Disabled"
					button.TextColor3 = Color3.fromRGB(255, 110, 105)
				else
					enabled = true
					Player.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 32
					button.Text = "Enabled"
					button.TextColor3 = Color3.fromRGB(100, 255, 105)
				end

				wait(0.2)

				debounce = false
			end
		end
	end
end

