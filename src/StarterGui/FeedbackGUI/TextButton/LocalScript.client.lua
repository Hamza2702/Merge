local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Other UIs
local mainUI = PlayerGui:WaitForChild("Main")
local mainFrame = mainUI:WaitForChild("Frame")
local SettingsGUI = PlayerGui:WaitForChild("Settings")
local settingsFrame = SettingsGUI:WaitForChild("Frame")

local button = script.Parent
local frame = script.Parent.Parent.Frame

button.MouseButton1Click:Connect(function()
	-- Hide other UIs
	mainFrame.Visible = false
	settingsFrame.Visible = false
	mainFrame.Size = UDim2.new(0,0,0,0)
	settingsFrame.Size = UDim2.new(0,0,0,0)

	frame.txtboxReport.Text = ""
	frame:TweenSizeAndPosition(
		UDim2.new(0.329,0,0.761,0),
		UDim2.new(0.499, 0,0.5, 0),
		Enum.EasingDirection.In,
		Enum.EasingStyle.Linear,
		.25,
		true
	)
	frame.Visible = true
end)

button.MouseEnter:Connect(function()
	if button then
		button:TweenSize(UDim2.new(0.096,0,0.042,0),Enum.EasingDirection.In,Enum.EasingStyle.Linear,.25,true)
	else
		warn("Button is nil, check the script's parent.")
	end

end)

button.MouseLeave:Connect(function()
	button:TweenSize(UDim2.new(0.086,0,0.032,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,.25,true)
end)