-- The Rake Remastered Script --
-- Updated Since 17/12/2025 --
-- Original Creator: Zoprever --

-- Variables --
local Workspace = game.Workspace
local SupplyCrates = Workspace.Debris.SupplyCrates
local ScrapSpawns = Workspace.Filter.ScrapSpawns
local RakeColor = Color3.fromRGB(255, 0, 0)
local FlareColor = Color3.fromRGB(255, 255, 0)
local SupplyColor = Color3.fromRGB(0, 0, 255)
local ScrapColor = Color3.fromRGB(0, 255, 0)

-- Functions
function AddHighlight(Parent, Color)
  local Highlight = Instance.new("Highlight")
  Highlight.FillColor = Color
  Highlight.OutlineColor = Color
  Highlight.FillTransparency = 0.5
  Highlight.OutlineTransparency = 0
  Highlight.Adornee = Parent
  Highlight.Parent = Parent
end

function HighlightObject(Name, Color)
  local Object = Workspace:FindFirstChild(Name)
  if Object and not Object:FindFirstChild("Highlight") then
    AddHighlight(Object, Color)
  end
end

function HighlightObjects(Parent, Name, Color)
  for _, Object in ipairs(Parent:GetDescendants()) do
    if Object.Name == Name and not Object:FindFirstChild("Highlight") then
      AddHighlight(Object, Color)
    end
  end
end
-- Add Highlights --
while true do
  task.wait(1)
  HighlightObject("Rake", RakeColor)
  HighlightObject("FlareGunPickUp", FlareColor)
  HighlightObjects(SupplyCrates, "Box", SupplyColor)
  HighlightObjects(ScrapSpawns, "Scrap", ScrapColor)
end

