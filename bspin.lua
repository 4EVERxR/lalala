--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0=game:GetService("Players");local v1=game:GetService("RunService");local v2=game:GetService("TeleportService");local v3=v0.LocalPlayer;local v4=v3.Character or v3.CharacterAdded:Wait() ;local v5=v4:WaitForChild("HumanoidRootPart");local v6=0 + 0 ;local v7=85 -25 ;local v8=v5.Position;v1.Heartbeat:Connect(function(v13) if ((v5.Position-v8).magnitude<(1065.1 -(68 + 997))) then local v16=0;while true do if (v16==(1270 -(226 + 1044))) then v6=v6 + v13 ;if (v6>=v7) then v2:Teleport(game.PlaceId,v3);end break;end end else v6=0;v8=v5.Position;end end);local v9=workspace:WaitForChild("Map");local function v10(v14) if v14:IsA("BasePart") then local v18=0 -0 ;while true do if ((118 -(32 + 85))==v18) then v14.Material=Enum.Material.SmoothPlastic;v14.Reflectance=0 + 0 ;break;end if (v18==(0 + 0)) then v14.Transparency=958 -(892 + 65) ;v14.CanCollide=false;v18=1;end end elseif (v14:IsA("Decal") or v14:IsA("Texture") or v14:IsA("SurfaceAppearance")) then local v23=0;local v24;while true do if (v23==0) then v24=v14.Parent;if (v24 and v24:IsA("BasePart")) then v24.Transparency=2 -1 ;end break;end end elseif (v14:IsA("ParticleEmitter") or v14:IsA("Trail")) then v14.Enabled=false;end end local function v11(v15) if v15 then for v21,v22 in pairs(v15:GetDescendants()) do v10(v22);end end end v11(v9:FindFirstChild("Tiles"));v11(v9:FindFirstChild("Vegetation"));v11(v9:FindFirstChild("RoadNetwork"));local v12=v9:FindFirstChild("Props");if v12 then for v19,v20 in pairs(v12:GetChildren()) do if (v20.Name~="ATMs") then v11(v20);end end end
