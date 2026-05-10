-- Variables
local Player = game:GetService("Players").LocalPLayer
local Char = Player.Character or Player.CharacterAdded:Wait()

-- ACOM
local function CreateAcom()
  local ACOM = Instance.new("Part", workspace)
  ACOM.Name = "ACOM"
  ACOM.Shape = "Ball"
  ACOM.Size = Vector3.new(2, 2, 2)
  
end
