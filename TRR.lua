-- The Rake Remastered Script --
-- Updated Since 17/12/2025 --
-- Original Creator: Zoprever --

-- Variables --
local SupplyCrates = workspace.Debris.SupplyCrates
local ScrapSpawns = workspace.Filter.ScrapSpawns
local Players = game.Players
local RakeColor = Color3.fromRGB(255, 0, 0)
local FlareColor = Color3.fromRGB(255, 255, 0)
local SupplyColor = Color3.fromRGB(0, 0, 255)
local ScrapColor = Color3.fromRGB(0, 255, 0)
local PlayerColor = Color3.fromRGB(255, 255, 255)

-- Functions
function AddHighlight(Parent, Color)
  local Highlight = Instance.new("Highlight")
  Highlight.Name = "Highlight"
  Highlight.FillColor = Color
  Highlight.OutlineColor = Color
  Highlight.FillTransparency = 0.5
  Highlight.OutlineTransparency = 0
  Highlight.Adornee = Parent
  Highlight.Parent = Parent
end

function HighlightObject(Name, Color)
  local Object = workspace:FindFirstChild(Name)
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
while wait(0.1) do
  HighlightObject("Rake", RakeColor)
  HighlightObject("FlareGunPickUp", FlareColor)
  HighlightObjects(SupplyCrates, "Box", SupplyColor)
  HighlightObjects(ScrapSpawns, "Scrap", ScrapColor)
  for _, v in ipairs(Players:GetChildren()) do
    AddHighlight(v.Character, PlayerColor)
  end
end

