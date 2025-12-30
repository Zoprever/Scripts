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
local FN = Instance.new("ScreenGui")
FN.Name = "FruitNotifier"
FN.Parent = game.CoreGui
local F = Instance.new("Frame")
F.Draggable = true
F.Size = UDim2.new(0, 50, 0, 50)
F.Parent = FN
local UC = Instance.new("UICorner")
UC.CornerRadius = UDim.new(1, 0)
UC.Parent = F
local TL = Instance.new("TextLabel")
TL.Position = UDim2.new(0.5, 0, 0.5, 0)
TL.Text = "Fruit"
TL.TextColor3 = Color3.FromRGB(0, 0, 0)
TL.TextSize = 10
TL.Parent = F
-- Actual Works --
while task.wait(1) do
if FruitExisting() then
F.BackgroundColor3 = Color3.FromRGB(0, 0, 255)
else
F.BackgroundColor3 = Color3.FromRGB(255, 0, 0)
end
end
