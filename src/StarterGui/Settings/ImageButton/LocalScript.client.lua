local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("Settings")
local frame = ScreenGui:WaitForChild("Frame")

-- Other UIs
local FeedbackGUI = PlayerGui:WaitForChild("FeedbackGUI")
local feedbackFrame = FeedbackGUI:WaitForChild("Frame")
local mainGUI = PlayerGui:WaitForChild("Main")
local mainFrame = mainGUI:WaitForChild("Frame")

local targetSize = UDim2.new(0.38, 0, 0.794, 0)
local tweenInfo = TweenInfo.new(.3)
local frameTween = TS:Create(frame, tweenInfo, {Size = targetSize})

local button = script.Parent

button.MouseButton1Down:Connect(function()
	-- Hide other UIs
	feedbackFrame.Visible = false
	mainFrame.Visible = false
	feedbackFrame.Size = UDim2.new(0,0,0,0)
	mainFrame.Size = UDim2.new(0,0,0,0)
	
	frame.Visible = true
	frameTween:Play()
end)
