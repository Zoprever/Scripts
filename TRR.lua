-- The Rake Remastered Script --
-- Updated Since 17/12/2025 --
-- Original Creator: Zoprever --

-- Variables --
local Workspace = game. Workspace
local RakeColor = Color3.fromRGB(255, 0, 0)
local FlareColor = Color3.fromRGB(255, 255, 0)
local SupplyColor = Color3.fromRGB(0, 0, 255)
local ScrapColor = Color3.fromRGB(0, 255, 0)

-- Functions
function AddHighlight(paremt, Color)
  Highlight = Instance.new("Highlight")
  Highlight.FillColor = Color
  Highlight.OutlineColor = Color
  Highlight.FillTransparency = 0.5
  Highlight.OutlineTransparency = 0
  Highlight.Adornee = parent
  Highlight.Parent = parent
  return Highlight
end

function HighlightObject(Object, Color)
  if Workspace[Object] then
    local ObjectV2 = Workspace[Object]
    if not ObjectV2.Highlight then
      AddHighlight(ObjectV2, Color)
    end
  end
end
-- Add Highlight On Rake --
HighlightObject(Rake, RakeColor)
