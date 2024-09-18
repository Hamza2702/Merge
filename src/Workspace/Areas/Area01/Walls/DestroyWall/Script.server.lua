local Areas = game:WaitForChild("Workspace"):WaitForChild("Areas")
local area01 = Areas:WaitForChild("Area01")
local area01Blocks = area01:WaitForChild("Blocks")


local part = script.Parent

part.Touched:Connect(function(Hit)
	if Hit.Parent == area01Blocks then
		Hit:Destroy()
	end
end)