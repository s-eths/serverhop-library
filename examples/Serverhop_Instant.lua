-- Auto collect coins / Game: Ninja Legends

-- First we need to create a variable with the serverhop libary loadstring.
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-eths/serverhop-library/main/src.lua"))();

-- After that we need to index into the coins folder
for i, v in pairs(game:GetService("Workspace").spawnedCoins.Valley:GetChildren()) do
    -- We now need to collect this coin by teleporting to it
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
    task.wait(.5) 
end

-- After all the coins have been collected we will server hop
Serverhop:Instant(true) -- We put the first arg to true to enable logs
