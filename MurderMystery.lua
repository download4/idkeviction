local githubBranch = "beta"
local githubUrl = "https://raw.githubusercontent.com/download4/idkeviction/" .. githubBranch .. "/"

function getFile(fileName)
    return game:HttpGet(githubUrl .. fileName)
end

local UiLibrary = loadstring(getFile("UILib.lua"))()

local MainWindow = UiLibrary:AddWindow("Murder Mystery")
local MainFolder = MainWindow:AddTab("Main")
local MiscFolder = MainWindow:AddTab("Misc")

local MurderLabel = MainFolder:AddLabel("Murderer: idk")
local SherrifLabel = MainFolder:AddLabel("Sherrif: idk")

local nameDisplayDistance = 0 

function handlePlayer(plr)

    if plr.Character then

        plr.Character:WaitForChild("Humanoid").NameDisplayDistance = nameDisplayDistance

    end

    plr.CharacterAdded:Connect(function(d)
        d:WaitForChild("Humanoid").NameDisplayDistance = nameDisplayDistance
    end)

end

for _, plr in ipairs(game.Players:GetPlayers()) do handlePlayer(plr) end
game.Players.PlayerAdded:Connect(handlePlayer)

function findM()

    local m = nil

    repeat
        for _,v in ipairs(game.Players:GetPlayers()) do
            if v.Backpack:FindFirstChild("Knife") then
    
                m = v
                break
    
            end
        end
        task.wait()
    until m ~= nil

    return m.DisplayName .. " (@" .. m.Name .. ")"
    -- bad

end

function findS()
    
    local m = nil

    repeat
        for _,v in ipairs(game.Players:GetPlayers()) do
            if v.Backpack:FindFirstChild("Gun") then
    
                m = v
                break
    
            end
        end
        task.wait()
    until m ~= nil

    return m.DisplayName .. " (@" .. m.Name .. ")"

    -- bad

end

MainFolder:AddSwitch("Display Names", function(bool)

    nameDisplayDistance = bool and 100 or 0
    for _,v in ipairs(game.Players:GetPlayers()) do
        local char = v.Character or v.CharacterAdded:Wait()
        char:WaitForChild("Humanoid").Changed:Connect(function()
            char.Humanoid.NameDisplayDistance = nameDisplayDistance
        end)
        char:WaitForChild("Humanoid").NameDisplayDistance = nameDisplayDistance
    end

end)

MurderLabel.Text = ("Murderer: " .. findM())
SherrifLabel.Text = ("Sherrif: " .. findS())

game.ReplicatedStorage.RoleSelect.OnClientEvent:Connect(function()
    
    -- game started
    MurderLabel.Text = ("Murderer: " .. findM())
    SherrifLabel.Text = ("Sherrif: " .. findS())


end)