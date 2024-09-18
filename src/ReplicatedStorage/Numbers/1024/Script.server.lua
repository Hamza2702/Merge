local SoundService = game:GetService("SoundService")
local effects = SoundService:WaitForChild("Effects")
local collectEffect = effects:WaitForChild("Collect")
local RS = game:GetService("ReplicatedStorage")
local numbers = RS:WaitForChild("Numbers")

local part = script.Parent
local nextNum = part.Name * 2 

for i, v in pairs(part:GetChildren()) do
	if v:IsA("SurfaceGui") then
		local textLabel = v:FindFirstChild("TextLabel")
		if textLabel and textLabel:IsA("TextLabel") then
			textLabel.Text = part.Name
		end
	end
end

local Areas = game:WaitForChild("Workspace"):WaitForChild("Areas")
local area01 = Areas:WaitForChild("Area01")
local area01Blocks = area01:WaitForChild("Blocks")
local area01floor = area01:WaitForChild("Floor")

local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local LeaderboardModule = require(ServerScriptService.LeaderboardModule)

local twenty48 = RS:WaitForChild("2048")

part.Touched:Connect(function(Hit)
	if Hit.Name == part.Name then
		local newPos = (part.Position + Hit.Position) / 2
		local new = numbers:FindFirstChild(nextNum)
		if new then
			local newNum = new:Clone()
			newNum.Parent = area01Blocks
			newNum.Position = newPos
			collectEffect:Play()
			part:Destroy()
			Hit:Destroy()
			LeaderboardModule.addMerges()
			twenty48.Value += 1
		end
	end
end)

