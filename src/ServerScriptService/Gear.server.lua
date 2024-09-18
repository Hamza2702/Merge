local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")
local DatastoreService = game:GetService("DataStoreService")

local GiveGearEvent = ReplicatedStorage:WaitForChild("GiveGearEvent")
local CheckGearEvent = Instance.new("RemoteFunction")
CheckGearEvent.Name = "CheckGearEvent"
CheckGearEvent.Parent = ReplicatedStorage

local SaveInventory = DatastoreService:GetDataStore("SaveInventory")

-- Gear class
local Gear = {}
Gear.__index = Gear

function Gear.new(name, price)
	local self = setmetatable({}, Gear)
	self.name = name
	self.price = price
	return self
end

function Gear:PlayerOwns(player)
	local success, result = pcall(function()
		return SaveInventory:GetAsync(player.UserId)
	end)

	if success and result then
		return table.find(result, self.name) ~= nil
	end

	return false
end

function Gear:Purchase(player)
	local merges = player.leaderstats:FindFirstChild("Merges")

	if merges and merges.Value >= self.price then
		if not self:PlayerOwns(player) then
			-- Remove merges
			merges.Value -= self.price

			-- Save gear in the player's inventory
			local success, result = pcall(function()
				local playerGears = SaveInventory:GetAsync(player.UserId) or {}
				table.insert(playerGears, self.name)
				SaveInventory:SetAsync(player.UserId, playerGears)
			end)

			if not success then
				warn("Failed to save gear purchase for player: " .. player.Name)
			end

			-- Give the gear to the player
			self:GiveToPlayer(player)
			return true
		else
			warn("Player already owns the " .. self.name)
		end
	else
		warn("Not enough merges to buy the " .. self.name)
	end

	return false
end

function Gear:GiveToPlayer(player)
	local GearTemplate = ServerStorage.Gears:FindFirstChild(self.name)
	if GearTemplate then
		local clonedGear = GearTemplate:Clone()
		clonedGear.Parent = player:WaitForChild("Backpack")
	else
		warn("Gear not found: " .. self.name)
	end
end

-- Set up gears
local gears = {
	GravityCoil = Gear.new("GravityCoil", 40),
	SpeedCoil = Gear.new("SpeedCoil", 50),
	Taco = Gear.new("Taco", 20),
	CheezBurger = Gear.new("CheezBurger", 30),
	SpaceSandwich = Gear.new("SpaceSandwich", 25),
	BloxyCola1 = Gear.new("BloxyCola1", 30),
	Bloxiade = Gear.new("Bloxiade", 30),
	WitchesBrew = Gear.new("WitchesBrew", 30)
	-- more gears 
}

-- Gear purchase event
GiveGearEvent.OnServerEvent:Connect(function(player, gearName)
	local gear = gears[gearName]
	if gear then
		gear:Purchase(player)
	else
		warn("Invalid gear requested: " .. gearName)
	end
end)

-- Check if they own a gear(client sided)
CheckGearEvent.OnServerInvoke = function(player, gearName)
	local gear = gears[gearName]
	if gear then
		return gear:PlayerOwns(player)
	else
		warn("Invalid gear requested for ownership check: " .. gearName)
		return false
	end
end
