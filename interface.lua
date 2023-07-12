local Gui = script.Parent
local ItemLibrary = game.ReplicatedStorage.ItemLibrary
local Gameplay = Gui:WaitForChild("Gameplay")
local CraftMenu = Gameplay:WaitForChild("CraftMenu")
local OpenCraft = Gameplay:WaitForChild("OpenCraft")
local InventoryButton = Gameplay:WaitForChild("InventoryButton")
local CraftItemsList = CraftMenu:WaitForChild("CraftItemsList")
local ItemIcon = CraftMenu:WaitForChild("ItemIcon")
local ItemName = ItemIcon:WaitForChild("ItemName")
local ItemsYouHave = ItemIcon:WaitForChild("YouHave")
local Inventory = Gui.InventoryFrame
local InventoryList = Inventory:WaitForChild("InventoryList")
local CurrentCraftFrame



local function ReadData(Location,Disk,SubFolder,Item) --Global / Local > Hard / Soft > SubFolder > Item
	return game.ReplicatedStorage.ReadData:InvokeServer(Location,Disk,SubFolder,Item)
end



local function AddData(Location,Disk,SubFolder,Item,ToAdd) --Global / Local > Hard / Soft > SubFolder > Item > Value
	return game.ReplicatedStorage.AddData:FireServer(Location,Disk,SubFolder,Item,ToAdd)
end



local function SetData(Location,Disk,SubFolder,Item,ToAdd) --Global / Local > Hard / Soft > SubFolder > Item > Value
	return game.ReplicatedStorage.SetData:FireServer(Location,Disk,SubFolder,Item,ToAdd)
end



local function OpenCraftMenu()
	if CraftMenu.Visible then
		CraftMenu.Position = UDim2.new(0.7,0,0,0)
		CraftMenu:TweenPosition(UDim2.new(1,0,0,0),Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.5,true)
		wait(0.5)
		CraftMenu.Visible = false
	else
		CraftMenu.Position = UDim2.new(1,0,0,0)
		CraftMenu.Visible = true
		CraftMenu:TweenPosition(UDim2.new(0.7,0,0,0),Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.5,true)
	end
end



local function LinkCraftItems()
	for index,Frame in pairs(CraftItemsList:GetChildren()) do
		if Frame:IsA("Frame") then
			Frame.Button.Activated:Connect(function()

				local CraftedItem = Frame.Crafted:FindFirstChildOfClass("IntValue")
				CurrentCraftFrame = Frame
				ItemName.Text = CraftedItem.Name
				ItemIcon.Amount.Text = CraftedItem.Value
				ItemIcon.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Frame.Name).Icon.Value or "9275467268"..""
				ItemsYouHave.Text = "You have "..ReadData("Local","Hard","Inventory",CraftedItem.Name).." "..CraftedItem.Name.."(s)"

				local Item1 = Frame.Item1:FindFirstChildOfClass("IntValue")
				if Item1 then
					CraftMenu.Item1.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item1.Name).Icon.Value or  "9275467268"..""
					local Item1InInventory = ReadData("Local","Hard","Inventory",Item1.Name)
					CraftMenu.Item1.Amount.Text = ""..Item1InInventory.."/"..Item1.Value..""
					if Item1InInventory >= Item1.Value then
						CraftMenu.Item1.BackgroundColor3 = Color3.fromRGB(150,200,100)
					else
						CraftMenu.Item1.BackgroundColor3 = Color3.fromRGB(200,50,50)
					end
				else
					CraftMenu.Item1.BackgroundColor3 = Color3.fromRGB(40, 50, 60)
				end

				local Item2 = Frame.Item2:FindFirstChildOfClass("IntValue")
				if Item2 then
					CraftMenu.Item2.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item2.Name).Icon.Value or  "9275467268"..""
					local Item2InInventory = ReadData("Local","Hard","Inventory",Item2.Name)
					CraftMenu.Item2.Amount.Text = ""..Item2InInventory.."/"..Item2.Value..""
					if Item2InInventory >= Item2.Value then
						CraftMenu.Item2.BackgroundColor3 = Color3.fromRGB(150,200,100)
					else
						CraftMenu.Item2.BackgroundColor3 = Color3.fromRGB(200,50,50)
					end
				else
					CraftMenu.Item2.BackgroundColor3 = Color3.fromRGB(40, 50, 60)
				end

				local Item3 = Frame.Item3:FindFirstChildOfClass("IntValue")
				if Item3 then
					CraftMenu.Item3.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item3.Name).Icon.Value or  "9275467268"..""
					local Item3InInventory = ReadData("Local","Hard","Inventory",Item3.Name)
					CraftMenu.Item3.Amount.Text = ""..Item3InInventory.."/"..Item3.Value..""
					if Item3InInventory >= Item3.Value then
						CraftMenu.Item3.BackgroundColor3 = Color3.fromRGB(150,200,100)
					else
						CraftMenu.Item3.BackgroundColor3 = Color3.fromRGB(200,50,50)
					end
				else
					CraftMenu.Item3.BackgroundColor3 = Color3.fromRGB(40, 50, 60)
				end

				local Item4 = Frame.Item4:FindFirstChildOfClass("IntValue")
				if Item4 then
					CraftMenu.Item4.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item4.Name).Icon.Value or  "9275467268"..""
					local Item4InInventory = ReadData("Local","Hard","Inventory",Item4.Name)
					CraftMenu.Item4.Amount.Text = ""..Item4InInventory.."/"..Item4.Value..""
					if Item4InInventory >= Item4.Value then
						CraftMenu.Item4.BackgroundColor3 = Color3.fromRGB(150,200,100)
					else
						CraftMenu.Item4.BackgroundColor3 = Color3.fromRGB(200,50,50)
					end
				else
					CraftMenu.Item4.BackgroundColor3 = Color3.fromRGB(40, 50, 60)
				end	
			end)
		end
	end
end



local function UpdateCraftItem(Frame)
	local CraftedItem = Frame.Crafted:FindFirstChildOfClass("IntValue")
	ItemName.Text = CraftedItem.Name
	ItemIcon.Amount.Text = CraftedItem.Value
	ItemIcon.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Frame.Name).Icon.Value or "9275467268"..""
	ItemsYouHave.Text = "You have "..ReadData("Local","Hard","Inventory",CraftedItem.Name).." "..CraftedItem.Name.."(s)"


	local Item1 = Frame.Item1:FindFirstChildOfClass("IntValue")
	if Item1 then
		CraftMenu.Item1.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item1.Name).Icon.Value or  "9275467268"..""
		local Item1InInventory = ReadData("Local","Hard","Inventory",Item1.Name)
		CraftMenu.Item1.Amount.Text = ""..Item1InInventory.."/"..Item1.Value..""
		if Item1InInventory >= Item1.Value then
			CraftMenu.Item1.BackgroundColor3 = Color3.fromRGB(150,200,100)
		else
			CraftMenu.Item1.BackgroundColor3 = Color3.fromRGB(200,50,50)
		end
	else
		CraftMenu.Item1.BackgroundColor3 = Color3.fromRGB(40, 50, 60)
	end

	local Item2 = Frame.Item2:FindFirstChildOfClass("IntValue")
	if Item2 then
		CraftMenu.Item2.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item2.Name).Icon.Value or  "9275467268"..""
		local Item2InInventory = ReadData("Local","Hard","Inventory",Item2.Name)
		CraftMenu.Item2.Amount.Text = ""..Item2InInventory.."/"..Item2.Value..""
		if Item2InInventory >= Item2.Value then
			CraftMenu.Item2.BackgroundColor3 = Color3.fromRGB(150,200,100)
		else
			CraftMenu.Item2.BackgroundColor3 = Color3.fromRGB(200,50,50)
		end
	else
		CraftMenu.Item2.BackgroundColor3 = Color3.fromRGB(40, 50, 60)
	end

	local Item3 = Frame.Item3:FindFirstChildOfClass("IntValue")
	if Item3 then
		CraftMenu.Item3.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item3.Name).Icon.Value or  "9275467268"..""
		local Item3InInventory = ReadData("Local","Hard","Inventory",Item3.Name)
		CraftMenu.Item3.Amount.Text = ""..Item3InInventory.."/"..Item3.Value..""
		if Item3InInventory >= Item3.Value then
			CraftMenu.Item3.BackgroundColor3 = Color3.fromRGB(150,200,100)
		else
			CraftMenu.Item3.BackgroundColor3 = Color3.fromRGB(200,50,50)
		end
	else
		CraftMenu.Item3.BackgroundColor3 = Color3.fromRGB(40, 50, 60)
	end

	local Item4 = Frame.Item4:FindFirstChildOfClass("IntValue")
	if Item4 then
		CraftMenu.Item4.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item4.Name).Icon.Value or  "9275467268"..""
		local Item4InInventory = ReadData("Local","Hard","Inventory",Item4.Name)
		CraftMenu.Item4.Amount.Text = ""..Item4InInventory.."/"..Item4.Value..""
		if Item4InInventory >= Item4.Value then
			CraftMenu.Item4.BackgroundColor3 = Color3.fromRGB(150,200,100)
		else
			CraftMenu.Item4.BackgroundColor3 = Color3.fromRGB(200,50,50)
		end
	else
		CraftMenu.Item4.BackgroundColor3 = Color3.fromRGB(40, 50, 60)
	end	
end



local function Craft()
	local CanCraft = true

	local Item1 = CurrentCraftFrame.Item1:FindFirstChildOfClass("IntValue") or nil
	local Item2 = CurrentCraftFrame.Item2:FindFirstChildOfClass("IntValue") or nil
	local Item3 = CurrentCraftFrame.Item3:FindFirstChildOfClass("IntValue") or nil
	local Item4 = CurrentCraftFrame.Item4:FindFirstChildOfClass("IntValue") or nil
	local Crafted = CurrentCraftFrame.Crafted:FindFirstChildOfClass("IntValue")

	if Item1 then
		local Item1InInventory = ReadData("Local","Hard","Inventory",Item1.Name)
		if Item1InInventory < Item1.Value then
			CanCraft = false
		end
	end
	if Item2 then
		local Item2InInventory = ReadData("Local","Hard","Inventory",Item2.Name)
		if Item2InInventory < Item2.Value then
			CanCraft = false
		end
	end
	if Item3 then
		local Item3InInventory = ReadData("Local","Hard","Inventory",Item3.Name)
		if Item3InInventory < Item3.Value then
			CanCraft = false
		end
	end
	if Item4 then
		local Item4InInventory = ReadData("Local","Hard","Inventory",Item4.Name)
		if Item4InInventory < Item4.Value then
			CanCraft = false
		end
	end

	if CanCraft == true then
		script.CraftSound:Play()
		if Item1 then
			AddData("Local","Hard","Inventory",Item1.Name,-1*Item1.Value)
		end
		if Item2 then
			AddData("Local","Hard","Inventory",Item2.Name,-1*Item2.Value)
		end
		if Item3 then
			AddData("Local","Hard","Inventory",Item3.Name,-1*Item3.Value)
		end
		if Item4 then
			AddData("Local","Hard","Inventory",Item4.Name,-1*Item4.Value)
		end
		AddData("Local","Hard","Inventory",Crafted.Name,Crafted.Value)
		UpdateCraftItem(CurrentCraftFrame)
		wait()
	else
		script.Error:Play()
	end
end



local function OpenInventory()
	Gameplay.Visible = false
	Inventory.Visible = true
	local InventoryTable = game.ReplicatedStorage.RequestInventory:InvokeServer()
	local InventoryItem = script.InventoryItem
	for index,Item in pairs(InventoryTable) do
		InventoryItem = InventoryItem:Clone()
		InventoryItem.Parent = InventoryList
		InventoryItem.Name = Item["Name"]
		InventoryItem.ItemName.Text = Item["Name"]
		InventoryItem.ItemAmount.Text = Item["Value"]
		InventoryItem.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item["Name"]).Icon.Value..""
		InventoryItem.Activated:Connect(function()
			Inventory.ItemIcon.Image = "rbxassetid://"..ItemLibrary:FindFirstChild(Item["Name"]).Icon.Value..""
			Inventory.ItemName.Text = Item["Name"]
			Inventory.ItemAmount.Text = "You own "..Item["Value"].." "..Item["Name"].."(s)"
			Inventory.ItemDesc.Text = ItemLibrary:FindFirstChild(Item["Name"]).Desc.Value
		end)
	end
end



local function ExitInventory()
	Gameplay.Visible = true
	Inventory.Visible = false
	for index,Item in pairs(Inventory.InventoryList:GetChildren()) do
		if Item:IsA("ImageButton") then
			Item:Destroy()
		end
	end
end



local UpdateFrameLoop = coroutine.create(function()
	while true do
		wait(0.5)
		if CurrentCraftFrame then
			UpdateCraftItem(CurrentCraftFrame)
		end
	end
end)
coroutine.resume(UpdateFrameLoop)



LinkCraftItems()
OpenCraft.Activated:Connect(OpenCraftMenu)
CraftMenu.CraftItem.Activated:Connect(Craft)
InventoryButton.Activated:Connect(OpenInventory)
Inventory.Exit.Activated:Connect(ExitInventory)
