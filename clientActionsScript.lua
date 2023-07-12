local ContextService = game:GetService("ContextActionService")
local Player = game.Players.LocalPlayer
local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid")
local HoldingLaser = false



local function PressShift(Action,State,Object)
	if State == Enum.UserInputState.Begin then
		Humanoid.WalkSpeed = 24
	end
	if State == Enum.UserInputState.End then
		Humanoid.WalkSpeed = 16
	end
end

local function PressC(Action,State,Object)
	if State == Enum.UserInputState.Begin then
		Humanoid.Sit = true
	end
end

local function PressQ(Action,State,Object)
	if State == Enum.UserInputState.Begin then 
		if  HoldingLaser == false then
			game.ReplicatedStorage.EquipLaser:FireServer()
			HoldingLaser = true
		else
			game.ReplicatedStorage.UnequipLaser:FireServer()
			HoldingLaser = false
		end
	end
end





ContextService:BindAction("PressShift",PressShift,false,Enum.KeyCode.LeftShift)
ContextService:BindAction("PressC",PressC,false,Enum.KeyCode.C)
ContextService:BindAction("PressQ",PressQ,false,Enum.KeyCode.Q)
