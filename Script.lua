local githubBranch = "beta"
local githubUrl = "https://raw.githubusercontent.com/download4/idekeviction/" .. githubBranch .. "/"

function getFile(fileName)
    return game:HttpGet(githubUrl .. fileName)
end

local UiLibrary = loadstring(getFile("UILib.lua"))()
local MainWindow = UiLibrary:CreateWindow("Eviction Notice")

local ChallengesFolder = MainWindow:CreateFolder("Challenges")