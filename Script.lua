local githubBranch = "beta"
local githubUrl = "https://raw.githubusercontent.com/download4/idkeviction/" .. githubBranch .. "/"

function getFile(fileName)
    return game:HttpGet(githubUrl .. fileName)
end

local UiLibrary = loadstring(getFile("UILib.lua"))()

print(UiLibrary)

local MainWindow = UiLibrary:AddWindow("Eviction Notice")
local ChallengesFolder = MainWindow:AddTab("Challenges")