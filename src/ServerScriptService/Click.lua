local SoundService = game:GetService("SoundService")
local effects = SoundService:WaitForChild("Effects")

local SoundEffectsManager = {}

function SoundEffectsManager.Click()
	effects.Click:Play()
end

function SoundEffectsManager.EnableEffects()
	for _, effect in pairs(effects:GetChildren()) do
		if effect:IsA("Sound") then
			effect:Play()
		end
	end
end

function SoundEffectsManager.DisableEffects()
	for _, effect in pairs(effects:GetChildren()) do
		if effect:IsA("Sound") then
			effect:Stop()
		end
	end
end

return SoundEffectsManager
