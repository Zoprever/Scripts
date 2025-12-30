-- Script made by zoprever
-- Open source

-- Variables --
local Workspace = game.Workspace
-- Functions --
local function FruitExisting()
  for _, v in ipairs(Workspace:GetChildren()) do
    if v:IsA("Tool") or v.Name == "Fruit" then
      return true
    end
  end
  return false
end
-- Start
local FN = instance.new("ScreenGui")
FN.Name = FruitNotifier
FN.Parent = game.CoreUi
local F = instance.new("Frame")
F.Size = {0, 50}, {0,50}
