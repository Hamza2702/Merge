local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Areas = game:WaitForChild("Workspace"):WaitForChild("Areas")
local area01 = Areas:WaitForChild("Area01")
local area01Spawn = area01:WaitForChild("Spawn")
local area01Blocks = area01:WaitForChild("Blocks")
local area01floor = area01:WaitForChild("Floor")

local floorPositionY = area01floor.Position.Y

local numbers = RS:WaitForChild("Numbers")

local chance1 = 74
local chance2 = 15
local chance3 = 10
local chance4 = 1


local max = 25

local block1 = numbers:WaitForChild("1")
local block2 = numbers:WaitForChild("2")
local block3 = numbers:WaitForChild("4")
local block4 = numbers:WaitForChild("8")

function chooseRandomNumber()
	local randomNumber = math.random(1, 100)
	if (randomNumber <= chance1) then
		spawnBlock(block1)
	elseif (randomNumber <= chance1 + chance2) then
		spawnBlock(block2)
	elseif (randomNumber <= chance1 + chance2 + chance3) then
		spawnBlock(block3)
	else
		spawnBlock(block4)
	end
end


function spawnBlock(block)
	local count = countBlocks()
	if count < max then
		local newBlock = block:Clone()
		newBlock.Parent = area01Blocks
		newBlock.Position = area01Spawn.Position + Vector3.new(math.random(-65,65),
			0,
			math.random(-65, 65))
	else
		
	end
end

function countBlocks()
	local count = 0
	for i, v in pairs(area01Blocks:GetChildren()) do
		count += 1
	end
	return count
end

while true do
	wait(1)
	chooseRandomNumber()
end