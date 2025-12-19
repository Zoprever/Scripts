local Players = game:GetService("Players")

local TOOLS = {
    Gun = {
        name = "SheriffHighlight",
        color = Color3.fromRGB(0, 0, 255)
    },
    Knife = {
        name = "MurderHighlight",
        color = Color3.fromRGB(255, 0, 0)
    }
}

local function hasTool(player, toolName)
    local backpack = player:FindFirstChild("Backpack")
    if backpack and backpack:FindFirstChild(toolName) then
        return true
    end

    local character = player.Character
    if character and character:FindFirstChild(toolName) then
        return true
    end

    return false
end

local function updatePlayer(player)
    if player == Players.LocalPlayer then return end
    local character = player.Character
    if not character then return end

    for toolName, cfg in pairs(TOOLS) do
        local highlight = character:FindFirstChild(cfg.name)

        if hasTool(player, toolName) then
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = cfg.name
                highlight.FillColor = cfg.color
                highlight.OutlineColor = cfg.color
                highlight.FillTransparency = 0.4
                highlight.Parent = character
            end
        else
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

while true do
    task.wait(0.3)
    for _, player in ipairs(Players:GetPlayers()) do
        updatePlayer(player)
    end
end
