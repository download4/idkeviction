local githubBranch = "beta"
local githubUrl = "https://raw.githubusercontent.com/download4/idkeviction/" .. githubBranch .. "/"

function getFile(fileName)
    return game:HttpGet(githubUrl .. fileName)
end

local UiLibrary = loadstring(getFile("UILib.lua"))()

local MainWindow = UiLibrary:AddWindow("Eviction Notice")
local ChallengesFolder = MainWindow:AddTab("Challenges")

ChallengesFolder:Show()

local TeleportSpeed = 32
local SpeedSlider = ChallengesFolder:AddSlider("Teleport Speed", function(num)
    TeleportSpeed = num
end, {min = 16, max = 100})

SpeedSlider:Set(32)