-- Collect a bloxfruit / Game: Blox Fruits

-- First we need to create a variable with the serverhop libary loadstring.
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-eths/serverhop-library/main/src.lua"))();

-- After that we need to teleport to the fruits location
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1, 1, 1) -- This is obv not a real location and is only for example

-- After collecting the fruit we will join the inputed JobID
Serverhop:JoinJobID(true, "656405d8-50b4-4c68-b43c-10435b4cc34f") -- We put the first arg to true to enable logs, then we inputed a JobID in the second arg to teleport too
