local txtboxReport = script.Parent
local maxLength = 1024  --// Length of the message in characters

txtboxReport.Changed:Connect(function(property)
	if property == "Text" and string.len(txtboxReport.Text) > maxLength then
		txtboxReport.Text = string.sub(txtboxReport.Text, 1, maxLength)
	end
end)
