-- Carga la UI principal
loadstring(game:HttpGet("https://raw.githubusercontent.com/Zoprever/RLibrarys/refs/heads/main/Zorex/ZorexUI.lua"))()

local ScreenGui = SearchForUI("ZorexUI")

-- Botón de ejecutar
local IB = Instance.new("ImageButton")
IB.Size = UDim2.new(0, 50, 0, 50)
IB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
IB.Image = getcustomasset("ZorexSystem/Assets/Execute.png")
IB.Parent = ScreenGui.Window

-- Dropdown para elegir tipo (basado en archivos en la carpeta Functions)
local DDType = Instance.new("TextBox")
DDType.PlaceholderText = "Elige tipo..."
DDType.Size = UDim2.new(0, 370, 0, 50)
DDType.Position = UDim2.new(0, 25, 0, 75)
DDType.Parent = ScreenGui.Window

-- Lista de sugerencias abajo del dropdown
local SuggestionList = Instance.new("Frame")
SuggestionList.Size = UDim2.new(0, 370, 0, 150)
SuggestionList.Position = UDim2.new(0, 25, 0, 125)
SuggestionList.Visible = false
SuggestionList.Parent = ScreenGui.Window

-- Textbox jugador 1 (autocompletar)
local TBPlayer = Instance.new("TextBox")
TBPlayer.PlaceholderText = "Jugador 1..."
TBPlayer.Size = UDim2.new(0, 370, 0, 50)
TBPlayer.Position = UDim2.new(0, 25, 0, 240)
TBPlayer.Parent = ScreenGui.Window

-- Textbox jugador 2 (autocompletar)
local TBTarget = Instance.new("TextBox")
TBTarget.PlaceholderText = "Jugador 2..."
TBTarget.Size = UDim2.new(0, 370, 0, 50)
TBTarget.Position = UDim2.new(0, 25, 0, 295)
TBTarget.Parent = ScreenGui.Window

-- Rellena los tipos desde la carpeta de Functions
local types = {}
for _,file in ipairs(listfiles("ZorexSystem/Functions")) do
    local name = file:match("([^/]+)%.lua$")
    if name then
        table.insert(types, name)
    end
end

-- Muestra sugerencias dinámicamente
local function showSuggestions(matches)
    for _,v in ipairs(SuggestionList:GetChildren()) do
        if v:IsA("TextButton") then v:Destroy() end
    end
    for i,name in ipairs(matches) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1,0,0,30)
        btn.Position = UDim2.new(0,0,0,(i-1)*30)
        btn.Text = name
        btn.Parent = SuggestionList
        btn.MouseButton1Click:Connect(function()
            DDType.Text = name
            SuggestionList.Visible = false
        end)
    end
    SuggestionList.Visible = #matches > 0
end

-- Input principal con autocompletado
DDType:GetPropertyChangedSignal("Text"):Connect(function()
    local text = DDType.Text:lower()
    local matches = {}
    for _,v in ipairs(types) do
        if v:lower():sub(1, #text) == text then
            table.insert(matches, v)
        end
    end
    showSuggestions(matches)
end)

-- Función de autocompletar jugadores
local function suggestPlayers(input)
    local matches = {}
    for _,plr in ipairs(game.Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #input:lower()) == input:lower() then
            table.insert(matches, plr.Name)
        end
    end
    return matches
end

-- Simple sistema de sugerencia para TBPlayer
TBPlayer:GetPropertyChangedSignal("Text"):Connect(function()
    local matches = suggestPlayers(TBPlayer.Text)
    -- (Aquí podrías mostrar sugerencias, parecido al dropdown)
end)

-- Igual para TBTarget
TBTarget:GetPropertyChangedSignal("Text"):Connect(function()
    local matches = suggestPlayers(TBTarget.Text)
end)

-- Escribe los valores al archivo
local function WriteVars()
    local Content = [[Vars = { type = "]] ..
        DDType.Text .. [[", player = "]] ..
        TBPlayer.Text .. [[", target = "]] ..
        TBTarget.Text .. [[" }]]
    writefile("ZorexSystem/Bridge/Vars.lua", Content)
end

IB.MouseButton1Click:Connect(WriteVars)
IB.TouchTap:Connect(WriteVars)
