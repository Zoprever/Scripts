local Players = game:GetService("Players")
local TOOL_NAME = "Knife"

local function hasTool(player)
    -- Backpack
    local backpack = player:FindFirstChild("Backpack")
    if backpack and backpack:FindFirstChild(TOOL_NAME) then
        return true
    end

    -- Equipped
    if player.Character and player.Character:FindFirstChild(TOOL_NAME) then
        return true
    end

    return false
end

local function updateHighlight(player)
    if player == Players.LocalPlayer then return end -- No To U

    local character = player.Character
    if not character then return end

    local highlight = character:FindFirstChild("MurderHighlight")

    if hasTool(player) then
        if not highlight then
            highlight = Instance.new("Highlight")
            highlight.Name = "MurderHighlight"
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.4
            highlight.OutlineTransparency = 0
            highlight.Adornee = character
            highlight.Parent = character
        end
    else
        if highlight then
            highlight:Destroy()
        end
    end
end

-- Loop
while true do
    task.wait(0.3)
    for _, player in ipairs(Players:GetPlayers()) do
        updateHighlight(player)
    end
end
