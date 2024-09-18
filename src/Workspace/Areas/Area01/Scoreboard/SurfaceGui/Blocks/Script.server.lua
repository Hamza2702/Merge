local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Areas = game:WaitForChild("Workspace"):WaitForChild("Areas")
local area01 = Areas:WaitForChild("Area01")
local area01Spawn = area01:WaitForChild("Spawn")
local area01Blocks = area01:WaitForChild("Blocks")


local frame = script.Parent
local label1 = frame:WaitForChild("1").blockAmount
local label2 = frame:WaitForChild("2").blockAmount
local label4 = frame:WaitForChild("4").blockAmount
local label8 = frame:WaitForChild("8").blockAmount
local label16 = frame:WaitForChild("16").blockAmount
local label32 = frame:WaitForChild("32").blockAmount
local label64 = frame:WaitForChild("64").blockAmount
local label128 = frame:WaitForChild("128").blockAmount
local label256 = frame:WaitForChild("256").blockAmount
local label512 = frame:WaitForChild("512").blockAmount
local label1024 = frame:WaitForChild("1024").blockAmount
local label2048 = frame:WaitForChild("2048").blockAmount

function checkBlocks()
	local block1 = 0
	local block2 = 0
	local block4 = 0
	local block8 = 0
	local block16 = 0
	local block32 = 0
	local block64 = 0
	local block128 = 0
	local block256 = 0
	local block512 = 0
	local block1024 = 0
	local block2048 = 0

	for i, v in pairs(area01Blocks:GetChildren()) do
		if v.Name == "1" then
			block1 += 1
		elseif v.Name == "2" then
			block2 += 1
		elseif v.Name == "4" then
			block4 += 1
		elseif v.Name == "8" then
			block8 += 1
		elseif v.Name == "16" then
			block16 += 1
		elseif v.Name == "32" then
			block32 += 1
		elseif v.Name == "64" then
			block64 += 1
		elseif v.Name == "128" then
			block128 += 1
		elseif v.Name == "256" then
			block256 += 1
		elseif v.Name == "512" then
			block512 += 1
		elseif v.Name == "1024" then
			block1024 += 1
		elseif v.Name == "2048" then
			block2048 += 1
		end
	end

	if label1 then
		label1.Text = block1 .. " blocks"
	end

	if label2 then
		label2.Text = block2 .. " blocks"
	end

	if label4 then
		label4.Text = block4 .. " blocks"
	end

	if label8 then
		label8.Text = block8 .. " blocks"
	end
	
	if label16 then
		label16.Text = block16 .. " blocks"
	end

	if label32 then
		label32.Text = block32 .. " blocks"
	end

	if label64 then
		label64.Text = block64 .. " blocks"
	end

	if label128 then
		label128.Text = block128 .. " blocks"
	end
	
	if label256 then
		label256.Text = block256 .. " blocks"
	end

	if label512 then
		label512.Text = block512 .. " blocks"
	end

	if label1024 then
		label1024.Text = block1024 .. " blocks"
	end

	if label2048 then
		label2048.Text = block2048 .. " blocks"
	end
	
end

while true do
	wait(1)
	checkBlocks()
end
