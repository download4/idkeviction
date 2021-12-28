local GithubURL = "https://raw.githubusercontent.com/download4/idkeviction"
local Branch = "beta" -- switch to main when not in beta

local UILib = loadstring(game:HttpGet(("%s/%s/UILib.lua"):format(GitHubUrl, Branch)))()
local Configuration = loadstring(game:HttpGet(("%s/%s/Configuration.lua"):format(GitHubUrl, Branch)))()

UILib:AddWindow("Games", Configuration.GamesWindow)
