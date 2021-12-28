local githubBranch = "beta"
local githubUrl = "https://raw.githubusercontent.com/download4/idkeviction/" .. githubBranch .. "/"

function getFile(fileName)
    return game:HttpGet(githubUrl .. fileName)
end

local UiLibrary = loadstring(getFile("UILib.lua"))()

local MainWindow = UiLibrary:AddWindow("Eviction Notice")
local ChallengesFolder = MainWindow:AddTab("Challenges")

local TeleportSpeed = 32
local SpeedSlider = ChallengesFolder:AddSlider("TeleportSpeed", function(num)
    TeleportSpeed = num
end, {min = 16, max = 100, readonly = false})

SpeedSlider:Set(32)