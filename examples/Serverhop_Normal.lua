-- Auto collect orbs / Game: Legends Of Speed

-- First we need to create a variable with the serverhop libary loadstring.
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-eths/serverhop-library/main/src.lua"))();

-- After that we index into the orb folder getting the descendants
for i, v in pairs(game:GetService("Workspace").orbFolder.City:GetDescendants()) do
    -- We then check if the childs class is a TouchTransmitter
    if v:IsA("TouchTransmitter") then
        -- If it is then we fire the touch interest using are HumanoidRootPart on the item we wanna collect
        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
    end
end

-- After collecting all orbs we wanna server hop
Serverhop:Normal(true, 100) -- We put the first arg to true to enable logs, then we put the second arg to 100 to scrape ~100 servers
