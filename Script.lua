local GitHubUrl = "https://raw.githubusercontent.com/download4/idkeviction"
local Branch = "beta" -- switch to main when not in beta

local UILib = loadstring(game:HttpGet(("%s/%s/UILib.lua"):format(GitHubUrl, Branch)))()
local Configuration = loadstring(game:HttpGet(("%s/%s/Configuration.lua"):format(GitHubUrl, Branch)))()

local LocalPlayerWindow = UILib:AddWindow(Configuration.LocalStuff.Title)
local MainWindow = UILib:AddWindow(Configuration.MainWindow.Title)
local Challenges = MainWindow:AddTab(Configuration.Challenges.Title)

Challenges:Show()
Challenges:AddLabel(Configuration.AFK)

for _, ChallengeName in ipairs(Configuration.ChallengeButtons) do

end