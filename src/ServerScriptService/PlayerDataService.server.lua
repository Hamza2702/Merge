local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local SaveMerges = DataStoreService:GetDataStore("SaveLeaderstats")
local SaveInventory = DataStoreService:GetDataStore("SaveInventory")

local itemsFolder = game:GetService("ServerStorage"):WaitForChild("Gears")

Players.PlayerAdded:Connect(function(player)
	-- Wait for the player's character to load
	repeat
		task.wait()
	until player.Character
	task.wait(3)

	-- Load Inventory
	local success, inventory = pcall(function()
		return SaveInventory:GetAsync(player.UserId)
	end)

	if success then
		if inventory then
			for i, name in pairs(inventory) do
				local item = itemsFolder:FindFirstChild(name)
				if item then
					item:Clone().Parent = player.Backpack
					item:Clone().Parent = player.StarterGear
					print("Loaded item: " .. name .. " into player: " .. player.Name)
				else
					warn("Item not found in ServerStorage: " .. name)
				end
			end
		else
			print("No inventory data found for player: " .. player.Name)
			inventory = {}
		end
	else
		warn("Failed to load inventory for player: " .. player.Name .. ". Error: " .. inventory)
	end

	-- Load Leaderstats
	local Data = nil
	local success, errormessage = pcall(function()
		Data = SaveMerges:GetAsync(tostring(player.UserId))
	end)

	if success then
		if Data then
			for i, v in pairs(Data) do
				player:WaitForChild("leaderstats"):WaitForChild(i).Value = v
			end
		else
			Data = {}
			for _, stat in pairs(player:WaitForChild("leaderstats"):GetChildren()) do
				Data[stat.Name] = stat.Value
			end

			local saveSuccess, saveError = pcall(function()
				SaveMerges:SetAsync(tostring(player.UserId), Data)
			end)

			if not saveSuccess then
				warn("Failed to save initial leaderstats data: " .. saveError)
			end
		end
	else
		error(errormessage)
	end
end)

local function Save(player)
	-- Save Inventory
	local gearTab = {}
	local backpack = player.Backpack
	local char = player.Character

	if char then
		for i, object in pairs(char:GetChildren()) do
			if object:IsA("Tool") then
				table.insert(gearTab, object.Name)
				print("Saving tool from character: " .. object.Name)
			end
		end
	end

	for i, object in pairs(backpack:GetChildren()) do
		if object:IsA("Tool") then
			table.insert(gearTab, object.Name)
			print("Saving tool from backpack: " .. object.Name)
		end
	end

	local invSuccess, invError = pcall(function()
		SaveInventory:SetAsync(player.UserId, gearTab)
	end)

	if not invSuccess then
		warn("Failed to save inventory: " .. invError)
	else
		print("Successfully saved inventory for player: " .. player.Name)
		for _, item in pairs(gearTab) do
			print("Saved item: " .. item)
		end
	end

	-- Save Leaderstats
	local SavedData = {}
	for _, v in pairs(player.leaderstats:GetChildren()) do
		SavedData[v.Name] = v.Value
		print("Saving leaderstat: " .. v.Name .. " = " .. v.Value)
	end

	local success, errormessage = pcall(function()
		SaveMerges:SetAsync(tostring(player.UserId), SavedData)
	end)

	if not success then
		warn("Failed to save leaderstats: " .. errormessage)
	else
		print("Successfully saved leaderstats for player: " .. player.Name)
	end
end

Players.PlayerRemoving:Connect(Save)

game:BindToClose(function()
	for _, player in pairs(Players:GetPlayers()) do
		Save(player)
	end
end)
