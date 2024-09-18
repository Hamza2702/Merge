local button = script.Parent
local frame = script.Parent.Parent

local feedbackButton = script.Parent.Parent.Parent.TextButton

button.MouseButton1Click:Connect(function()
	frame:TweenSizeAndPosition(
		UDim2.new(0.01,0,0.01,0),
		UDim2.new(0.499, 0,0.5, 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Linear,
		.25,
		true
	)
	wait(.25)
	frame.Visible = false
end)
