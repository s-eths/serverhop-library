-- Auto gain strength / Game: Muscle Legends

-- First we need to create a variable with the serverhop libary loadstring.
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-eths/serverhop-library/main/src.lua"))();

-- After that we create a thread to hold a infinite loop
task.spawn(function()
    -- Then we create a infinite loop
    while task.wait() do
        -- Then we check if the weight is not inside the players hand
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Weight") then
            -- If not then we set the parent of the weight to the character
            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Weight").Parent = game:GetService("Players").LocalPlayer.Character
        end
    end
end)

-- After that we create a for loop
for i = 1, 100 do
    -- We then call the rep function getting us muscle
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
    task.wait(3)
end

-- After the for loop has ran 100 times we will rejoin the same server
Serverhop:Rejoin(true) -- We put the first arg to true to enable logs
