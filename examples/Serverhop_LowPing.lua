-- Auto collect cash / Game: Da Hood

-- First we need to create a variable with the serverhop libary loadstring.
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-eths/serverhop-library/main/src.lua"))();

-- After that we need to index into the drop folder
for i, v in pairs(game:GetService("Workspace").Ignored.Drop:GetChildren()) do
    -- Then we check if the child is a Part and the name is MoneyDrop
    if v:IsA("Part") and v.Name == "MoneyDrop" then
        -- Then we teleport to the parts cframe
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        task.wait(1) -- Bypasses "stop."
        -- We then fire the click detector to collect the cash
        fireclickdetector(v:FindFirstChild("ClickDetector"), 3)
        task.wait(3) -- Once again bypasses "stop."
    end
end

-- After all the cash has been collected we will server hop
Serverhop:LowPing(true, 20, nil) -- We put the first arg to true to enable logs, then we put the second arg to 20 to only scrape ~20 servers, then we put the third arg to nil to find servers with or below 100 ping
