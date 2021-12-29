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

local mParent = MainFolder:AddHorizontalAlignment()
local sParent = MainFolder:AddHorizontalAlignment()

local button = mParent:AddButton("e")
mParent = button.Parent
button:Destroy()

button = sParent:AddButton("e")
sParent = button.Parent
button:Destroy()

MurderLabel.Parent = mParent
SherrifLabel.Parent = sParent

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

    return m
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

    return m

    -- bad

end

game.ReplicatedStorage.RoleSelect.OnClientEvent:Connect(function()
    
    -- game started
    MurderLabel.Text = ("Murderer: " .. findM().Name)
    SherrifLabel.Text = ("Sherrif: " .. findS().Name)


end)