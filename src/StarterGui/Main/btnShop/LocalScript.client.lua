local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("Main")
local frame = ScreenGui:WaitForChild("Frame")

-- Other UIs
local FeedbackGUI = PlayerGui:WaitForChild("FeedbackGUI")
local feedbackFrame = FeedbackGUI:WaitForChild("Frame")
local SettingsGUI = PlayerGui:WaitForChild("Settings")
local settingsFrame = SettingsGUI:WaitForChild("Frame")

-- Tween
local targetSize = UDim2.new(0.591, 0, 0.794, 0)
local tweenInfo = TweenInfo.new(.3)
local frameTween = TS:Create(frame, tweenInfo, {Size = targetSize})

local button = script.Parent
button.MouseButton1Down:Connect(function()
	-- Hide other UIs
	feedbackFrame.Visible = false
	settingsFrame.Visible = false
	feedbackFrame.Size = UDim2.new(0,0,0,0)
	settingsFrame.Size = UDim2.new(0,0,0,0)
	
	frame.Visible = true
	frameTween:Play()
end)
