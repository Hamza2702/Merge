local badge = game:GetService("BadgeService")
local id = 3493557868301353 

game.Players.PlayerAdded:Connect(function(plr)
	if not badge:UserHasBadgeAsync(plr.UserId, id) then
		badge:AwardBadge(plr.UserId,id)
	end
end)
