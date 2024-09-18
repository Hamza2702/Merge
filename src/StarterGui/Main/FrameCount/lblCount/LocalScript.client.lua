local RS = game:GetService("ReplicatedStorage")

local Areas = game:GetService("Workspace"):WaitForChild("Areas")
local area01 = Areas:WaitForChild("Area01")
local area01Spawn = area01:WaitForChild("Spawn")
local area01Blocks = area01:WaitForChild("Blocks")

local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad)

local count = 0
local txtLabel = script.Parent

-- Colours
local green = Color3.fromRGB(86, 255, 83)
local orange = Color3.fromRGB(255, 184, 71)
local red = Color3.fromRGB(255, 83, 83)

-- Interpolate between colours
function lerpColour(colour1, colour2, alpha)
	return Color3.new(
		colour1.R + (colour2.R - colour1.R) * alpha,
		colour1.G + (colour2.G - colour1.G) * alpha,
		colour1.B + (colour2.B - colour1.B) * alpha
	)
end

function changeColour()
	local count = countBlocks()
	if count <= 10 then
		-- Interpolate between green and orange
		local alpha = count / 10
		return lerpColour(green, orange, alpha)
	elseif count <= 18 then
		-- Interpolate between orange and red
		local alpha = (count - 10) / 8
		return lerpColour(orange, red, alpha)
	else
		return red
	end
end

function countBlocks()
	local count = 0
	for i, v in pairs(area01Blocks:GetChildren()) do
		count = count + 1
	end
	return count
end

function tweenColour()
	local endColour = changeColour()
	local tween = tweenService:Create(txtLabel, tweenInfo, {TextColor3 = endColour})
	tween:Play()
end

while true do
	wait(0.1)
	txtLabel.TextColor3 = changeColour()
	txtLabel.Text = tostring(countBlocks())
	tweenColour()
end
