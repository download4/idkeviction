local githubBranch = "beta"
local githubUrl = "https://raw.githubusercontent.com/download4/idkeviction/" .. githubBranch .. "/"

function getFile(fileName)
    return game:HttpGet(githubUrl .. fileName)
end

local UiLibrary = loadstring(getFile("UILib.lua"))()

local MainWindow = UiLibrary:AddWindow("Eviction Notice")
local MainFolder = MainWindow:AddTab("Main")
local MiscFolder = MainWindow:AddTab("MiscFolder")