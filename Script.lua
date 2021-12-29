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

ChallengesFolder:AddLabel("Challenge List")
ChallengesFolder:AddButton("Stratosfear", function()
    workspace.House.Stratosfear.Kill.TouchInterest:Destroy() -- remove the touch interest
end)

ChallengesFolder:AddButton("Straight Shooters", function()
    for i = 1, 3 do
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                game.ReplicatedStorage.Comps.Health:FireServer(plr.Character.Health) -- nice job eviction notice!
            end
        end
    end
end)

ChallengesFolder:AddButton("Tile Trekkers", function()
    for i = 1, 120 * 2 do
        for _,v in ipairs(workspace.House['Tile Trekkers'].Tiles:GetChildren()) do
            firetouchinterest(v, game.Players.LocalPlayer.PrimaryPart, 0)
            firetouchinterest(v, game.Players.LocalPlayer.PrimaryPart, 1)
        end
        task.wait(.5)
    end
end)

ChallengesFolder:AddButton("Watch Your Step", function()

    local ops = {}
    local current = workspace.House["Watch Your Step"].Platforms:GetChildren()[math.random(1, #workspace.House["Watch Your Step"].Platforms:GetChildren())]

    local function getRandom()
        for _,v in ipairs(workspace.House["Watch Your Step"].Platforms:GetChildren()) do
            if v ~= current and v.Position == ops[v] then
                return v
            end
        end
    end

    game.Players.LocalPlayer:MoveTo(current.Position)
    for _,v in ipairs(workspace.House["Watch Your Step"].Platforms:GetChildren()) do
        local originalPosition = v.Position
        ops[v] = originalPosition
        v.Changed:Connect(function()
            if v.Position ~= originalPosition and current == v then
                current = getRandom()
                game.Players.LocalPlayer.Character:MoveTo(current.Position)
            end
        end)
    end
end)

MiscFolder:AddButton("Crash Challenge", function()
    local ChosenEvent = game.ReplicatedStorage.Comps:GetChildren()[math.random(1,#game.ReplicatedStorage.Comps:GetChildren())]
    for i = 1, 400 do
        ChosenEvent:FireServer()
    end
end)