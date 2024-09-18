local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Areas = game:WaitForChild("Workspace"):WaitForChild("Areas")
local area01 = Areas:WaitForChild("Area01")
local area01Spawn = area01:WaitForChild("Spawn")
local area01Blocks = area01:WaitForChild("Blocks")

local twenty48 = RS:WaitForChild("2048")

local frame = script.Parent
local txtLabel = frame.blockAmount


while true do
	wait(1)
	txtLabel.Text = twenty48.Value
end
