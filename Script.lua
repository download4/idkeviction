local githubBranch = "beta"
local githubUrl = "https://raw.githubusercontent.com/download4/idkeviction/" .. githubBranch .. "/"

function getFile(fileName)
    return game:HttpGet(githubUrl .. fileName)
end

local UiLibrary = loadstring(getFile("UILib.lua"))()

local MainWindow = UiLibrary:AddWindow("Eviction Notice")
local ChallengesFolder = MainWindow:AddTab("Challenges")
local MiscFolder = MainWindow:AddTab("Misc")

ChallengesFolder:Show()

local TeleportSpeed = 32
local SpeedSlider = MiscFolder:AddSlider("Teleport Speed", function(num)
    TeleportSpeed = num
end, {min = 32, max = 100})

SpeedSlider:Set(32)

ChallengesFolder:AddLabel("Challenge List")
ChallengesFolder:AddButton("Stratosfear", function()
    workspace.House.Stratosfear.Kill.TouchInterest:Destroy() -- remove the touch interest
end)

MiscFolder:AddButton("Crash Challenge", function()
    local ChosenEvent = game.ReplicatedStorage.Comps:GetChildren()[math.random(1,#game.ReplicatedStorage.Comps:GetChildren())]
    for i = 1, 200 do
        ChosenEvent:FireServer()
    end
end)