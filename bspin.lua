local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local afkTime = 0
local maxAfk = 60
local lastPosition = hrp.Position

for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
        v.Material = Enum.Material.SmoothPlastic
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Enabled = false
    elseif v:IsA("SurfaceAppearance") then
        v:Destroy()
    end
end

settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
workspace.FallenPartsDestroyHeight = -500
if workspace:FindFirstChild("Terrain") then
    workspace.Terrain.WaterWaveSize = 0
    workspace.Terrain.WaterWaveSpeed = 0
    workspace.Terrain.WaterReflectance = 0
    workspace.Terrain.WaterTransparency = 1
end

lighting.GlobalShadows = false
lighting.FogEnd = 9e9
lighting.Brightness = 0

local function hideFolder(folder)
    if folder then
        for _, v in pairs(folder:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 1
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            end
        end
    end
end

local map = workspace:FindFirstChild("Map")
if map then
    hideFolder(map:FindFirstChild("Tiles"))
    hideFolder(map:FindFirstChild("Vegetation"))
    hideFolder(map:FindFirstChild("RoadNetwork"))

    local props = map:FindFirstChild("Props")
    if props then
        for _, obj in pairs(props:GetChildren()) do
            if obj.Name ~= "ATMs" then
                hideFolder(obj)
            end
        end
    end
end

RunService.Heartbeat:Connect(function(delta)
    if (hrp.Position - lastPosition).magnitude < 0.1 then
        afkTime = afkTime + delta
        if afkTime >= maxAfk then
            TeleportService:Teleport(game.PlaceId, player)
        end
    else
        afkTime = 0
        lastPosition = hrp.Position
    end
end)
