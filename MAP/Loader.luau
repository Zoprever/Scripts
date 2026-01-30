while task.wait(0.1) do
  if not isfile("ZorexSystem/Bridge/Vars.lua") then continue end
  local ok, err = pcall(function()
      loadstring(readfile("ZorexSystem/Bridge/Vars.lua"))()
    end)
  if not ok then
    warn("Error while loading Vars.lua:", err)
    continue
  end
  if not Vars.type then continue end
  if Vars.player == game.Players.LocalPlayer.Name then
    local path = "ZorexSystem/Functions/" .. Vars.type .. ".lua"
    if isfile(path) then
      pcall(function()
        loadstring(readfile(path))()
        end)
    end
    deletefile("ZorexSystem/Bridge/Vars.lua")
    Vars = nil
  end
end
