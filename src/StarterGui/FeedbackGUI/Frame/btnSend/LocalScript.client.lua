local button = script.Parent
local lblText = script.Parent.Parent.TextLabel.lblText
local debounce = false
local waitTime = 60 --// Change this to how ever long you want the player to wait before entering a new message.
local minCharacters = 15 --// Change this to whatever minimum characters you want the user to enter. 0 for no minimum.

button.MouseButton1Click:Connect(function()
	if debounce then
		return --// Ignore the button click if debounce
	end

	local report = script.Parent.Parent.txtboxReport.Text --// Get the textbox's text
	
	--// Error handling
	if #report <= minCharacters then
		lblText.Visible = true
		lblText.Text = "Enter valid feedback over ".. minCharacters .. " characters."
		wait(5)
		lblText.Visible = false
	else --// Success
		game.ReplicatedStorage.UserFeedback:FireServer(report)
		--// Timer Countdown
		debounce = true -- Debounce
		--// Success message
		local successMsg = script.Parent.Parent.Success --// Tween In
		successMsg.Visible = true
		successMsg:TweenSizeAndPosition(
			UDim2.new(0.5,0,0.205,0),
			UDim2.new(0.494,0,0.425,0),
			Enum.EasingDirection.In,
			Enum.EasingStyle.Linear,
			.25,
			true
		)
		wait(5)
		successMsg:TweenSizeAndPosition( --// Tween Out
			UDim2.new(0.01,0,0.205,0),
			UDim2.new(0.494,0,0.425,0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Linear,
			.25,
			true
		)
		wait(.26)
		successMsg.Visible = false --// Close message
		--// Wait 60 seconds before allowing user to submit another message.
		lblText.Visible = true
		for i = waitTime, 1, -1 do --// Debounce time
			lblText.Text = "Please wait " .. i .. " seconds before sending." --// Message
			wait(1)
		end
		lblText.Visible = false --// Close message
		debounce = false -- Set debounce back to false to allow button clicks again
	end
end)
