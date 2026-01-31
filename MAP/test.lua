loadstring(game:HttpGet("https://raw.githubusercontent.com/Zoprever/RLibrarys/refs/heads/main/Zorex/ZorexUI.lua"))()
local ScreenGui = SearchForUI("ZorexUI")
local IB = Instance.new("ImageButton")
IB.Size = UDim2.new(0, 50, 0, 50)
IB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
IB.Image = getcustomasset("ZorexSystem/Assets/Execute.png")
IB.Parent = ScreenGui.Window
local UC = Instance.new("UICorner")
UC.CornerRadius = UDim.new(1, 0)
