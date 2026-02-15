-- Auto Collect Coins | Game: Saber Simulator

-- First we need to create a variable with the serverhop libary loadstring.
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-eths/serverhop-library/main/src.lua"))();

-- After that we index into the orb folder getting the descendants
for i, v in next, game:GetService("Workspace").CoinsHolder:GetDescendants() do
    -- We then check if the childs class is a TouchTransmitter
    if v:IsA("TouchTransmitter") then
        -- If it is then we fire the touch interest using are HumanoidRootPart on the item we wanna collect
        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v.Parent, 0);
        task.wait();
        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v.Parent, 1);
    end;
end;

-- After collecting all coins we wanna server hop
Serverhop:Dynamic(nil); -- We put the argument to nil to scrape inf servers