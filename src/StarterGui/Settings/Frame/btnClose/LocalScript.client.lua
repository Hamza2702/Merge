local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("Settings")
local frame = ScreenGui:WaitForChild("Frame")

local targetSize = UDim2.new(0, 0, 0 ,0)

local tweenInfo = TweenInfo.new(.3)
local frameTween = TS:Create(frame, tweenInfo, {Size = targetSize})

local button = script.Parent

button.MouseButton1Down:Connect(function()
	frameTween:Play()
	if frameTween.Completed then
		wait(.3)
		frame.Visible = false
	end
end)
