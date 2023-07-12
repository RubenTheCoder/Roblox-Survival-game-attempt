local PlayerFolders = game.ServerStorage.PlayerFolders



local function PlayerAdded(Player)
	local PlayerFolder = PlayerFolders.PlayerFolder:Clone()
	PlayerFolder.Name = Player.UserId
	PlayerFolder.Parent = PlayerFolders
end



game.ReplicatedStorage.ReadData.OnServerInvoke = function(Player,Location,DiskType,SubFolder,Item)
	return PlayerFolders[Player.UserId][Location][DiskType][SubFolder][Item].Value
end



local function AddData(Player,Location,DiskType,SubFolder,Item,Amount)
	PlayerFolders[Player.UserId][Location][DiskType][SubFolder][Item].Value += Amount
end



local function SetData(Player,Location,DiskType,SubFolder,Item,NewValue)
	PlayerFolders[Player.UserId][Location][DiskType][SubFolder][Item].Value = NewValue
end



game.ReplicatedStorage.RequestInventory.OnServerInvoke = function(Player)
	local ToReturn = {}
	for index,Item in pairs(PlayerFolders[Player.UserId].Local.Hard.Inventory:GetChildren()) do
		local PrepareTable = {}
		PrepareTable["Name"] = Item.Name
		PrepareTable["Value"] = Item.Value
		table.insert(ToReturn,PrepareTable)
	end
	return ToReturn
end



game.Players.PlayerAdded:Connect(PlayerAdded)
game.ReplicatedStorage.AddData.OnServerEvent:Connect(AddData)
game.ReplicatedStorage.SetData.OnServerEvent:Connect(SetData)
