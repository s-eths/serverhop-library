-- Auto gift claim / Game: Treasure Chest Simulator

-- First we need to create a variable with the serverhop libary loadstring.
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-eths/serverhop-library/main/src.lua"))();

-- After that we need to teleport to the sand (while waiting for the gift we dont wanna waste time)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new("84.01899719238281, -94.90139770507812, 236.93600463867188")
-- After that we create a thread to hold a infinite loop
task.spawn(function()
    -- Then we create a infinite loop
    while task.wait() do
        -- We then call the Click function getting us sand
        game:GetService("ReplicatedStorage").Remotes.Events.Click:FireServer("Click")
    end
end)
-- We then need to wait 60 seconds for the gift to be ready to claim
task.wait(60)
-- Then we claim the gift
game:GetService("ReplicatedStorage").Remotes.Events.Click:FireServer("Gifts", 60)

-- After the gift has been claimed we will server hop
Serverhop:LowPlayers(false, nil, 10) -- We put the first arg to false to disable logs, then we put the second arg to nil to scrape inf servers, then we put the third arg to 10 to find servers with or below 10 players
