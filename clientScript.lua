local Context = game:GetService("ContextActionService")
local Player = game.Players.LocalPlayer
local Character = workspace:WaitForChild(Player.Name)
local Mouse = Player:GetMouse()
local Gui = Player.PlayerGui
local MouseGui = Gui:WaitForChild("MouseInfo")
local RockGui = MouseGui:WaitForChild("RockInfo")
local Library = game.ReplicatedStorage:WaitForChild("Library")
local Outlines = script:WaitForChild("SelectionBox")

local function HoverMiner(Name,State,Object)
	if Mouse.Target then
		local T = Mouse.Target
		if T:FindFirstChild("ObjectID") then
			Outlines.Parent = T
			Outlines.Adornee = T
			if T.ObjectID.Value == "Rock" then
				RockGui.Visible = true
				RockGui.Position = UDim2.new(0,Mouse.X + RockGui.AbsoluteSize.Y / 2,0,Mouse.Y)
				if T:FindFirstChild("Boom") then
					RockGui:WaitForChild("Name").Text = ""..T:WaitForChild("ObjectName").Value.." (Explosive)"
				else
					RockGui:WaitForChild("Name").Text = T:WaitForChild("ObjectName").Value
				end
				local LibraryItem = Library:WaitForChild(T.ObjectName.Value)
				RockGui:WaitForChild("Level").Text = LibraryItem.Level.Value
				RockGui:WaitForChild("Image"):WaitForChild("Icon").Image = LibraryItem.Icon.Value
				RockGui:WaitForChild("Bar"):WaitForChild("HP").Size = UDim2.new(T.HP.Value / LibraryItem.MaxHP.Value,0,1,0)
				if LibraryItem.Level.Value > 0 then --PlayerLevel
					RockGui:WaitForChild("Status").Text = "Your level is not high enough"
					Outlines.Color3 = Color3.fromRGB(255,127,127)
					Outlines.SurfaceColor3 = Color3.fromRGB(255,64,64)
				else
					RockGui:WaitForChild("Status").Text = "You are able to mine this"
					Outlines.Color3 = Color3.fromRGB(127,255,127)
					Outlines.SurfaceColor3 = Color3.fromRGB(64,255,64)
				end
			end

		else
			RockGui.Visible = false
			Outlines.Parent = script
			Outlines.Adornee = nil
		end	
	end
end

local function ClickMiner(Name,State,Object)
	if Mouse.Target and State == Enum.UserInputState.Begin then
		local T = Mouse.Target
		if T:FindFirstChild("ObjectID") then
			local LibraryItem = Library:WaitForChild(T.ObjectName.Value)
			if T:WaitForChild("Occupied").Value == false and LibraryItem.Level.Value <= 0 then --PlayerLevel
				game.ReplicatedStorage.MineRemote:FireServer(T)
			end			
		end
	else
		game.ReplicatedStorage.StopMineRemote:FireServer()
	end
end


--When having a tool
Character.ChildAdded:Connect(function(Item)
	if Item.Name == "LaserMiner" then
		Context:BindAction("HoverMiner",HoverMiner,false,Enum.UserInputType.MouseMovement)
		Context:BindAction("ClickMiner",ClickMiner,false,Enum.UserInputType.MouseButton1)
	end
end)


--When not having a tool
Character.ChildRemoved:Connect(function(Item)
	if Item.Name == "LaserMiner" then
		Context:UnbindAction("HoverMiner")
		Context:UnbindAction("ClickMiner")
		
		RockGui.Visible = false

	end	
end)
