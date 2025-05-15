--[[
  Универсальный Хаб + PoolKids GUI Universal v2.0
  На OrionLib: основной скрипт + возможность подгрузить PoolKids GUI
--]]

-- Загружаем OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Создаём главное окно
local Window = OrionLib:MakeWindow({
    Name = "Universal Hub + PoolKids v2.0",
    HidePremium = false,
    SaveConfig = false,
    IntroText = "Universal Hub",
    IntroIcon = "rbxassetid://4483345998"
})

-- === Вкладка 1: Основное (от первого скрипта) ===
local MainTab = Window:MakeTab({
    Name = "Основное",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Переменные для хаба
local AutoWallHop = false
local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- Удобный доступ к Humanoid/HRP
local function getChar()
    return Player.Character or Player.CharacterAdded:Wait()
end
local function getHumanoid()
    return getChar():FindFirstChildWhichIsA("Humanoid")
end
local function getHRP()
    return getChar():FindFirstChild("HumanoidRootPart")
end

-- Auto WallHop
MainTab:AddToggle({
    Name = "Авто Валлхоп",
    Default = false,
    Callback = function(state)
        AutoWallHop = state
        spawn(function()
            while AutoWallHop do
                task.wait(0.1)
                local char = getChar()
                local hum = getHumanoid()
                local hrp = getHRP()
                if hum and hrp and hum.FloorMaterial == Enum.Material.Air then
                    local ray = Ray.new(hrp.Position, hrp.CFrame.LookVector * 2)
                    local hit = workspace:FindPartOnRay(ray, char)
                    if hit then
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end
        end)
    end
})

-- Super Jump
MainTab:AddButton({
    Name = "Супер Прыжок",
    Callback = function()
        local hum = getHumanoid()
        if hum then hum.JumpPower = 150 end
    end
})

-- Fast Run
MainTab:AddButton({
    Name = "Фаст Бег",
    Callback = function()
        local hum = getHumanoid()
        if hum then hum.WalkSpeed = 50 end
    end
})

-- God Mode
MainTab:AddButton({
    Name = "Режим Бога",
    Callback = function()
        local char = getChar()
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
                part.Transparency = 0.5
            end
        end
        local hum = getHumanoid()
        if hum then hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false) end
    end
})

-- Teleport Up
MainTab:AddBind({
    Name = "Тп вверх (X)",
    Default = Enum.KeyCode.X,
    Hold = false,
    Callback = function()
        local hrp = getHRP()
        if hrp then hrp.CFrame = hrp.CFrame + Vector3.new(0,10,0) end
    end
})

-- === Вкладка 2: PoolKids Injection ===
local InjectTab = Window:MakeTab({
    Name = "PoolKids Inject",
    Icon = "rbxassetid://6026568191",
    PremiumOnly = false
})

InjectTab:AddLabel("Нажми, чтобы загрузить PoolKids GUI v2.0:")

InjectTab:AddButton({
    Name = "Load PoolKids v2.0",
    Callback = function()
        local scriptCode = [[
--[[ PoolKids GUI Universal v2.0 ]]
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({
    Name = "PoolKids GUI v2.0",
    HidePremium = false,
    SaveConfig = false,
    IntroText = "PoolKids Universal v2.0",
    IntroIcon = "rbxassetid://6026568191"
})
local MainTab = Window:MakeTab({ Name = "PoolKids", Icon = "rbxassetid://6026568191", PremiumOnly = false })
local selectedPart

MainTab:AddLabel("🔍 Выберите объект и настройте его ниже:")
MainTab:AddDropdown({
--[[
  Универсальный Хаб + PoolKids GUI Universal v2.0
  На OrionLib: основной скрипт + возможность подгрузить PoolKids GUI
--]]

-- Загружаем OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Создаём главное окно
local Window = OrionLib:MakeWindow({
    Name = "Universal Hub + PoolKids v2.0",
    HidePremium = false,
    SaveConfig = false,
    IntroText = "Universal Hub",
    IntroIcon = "rbxassetid://4483345998"
})

-- === Вкладка 1: Основное (от первого скрипта) ===
local MainTab = Window:MakeTab({
    Name = "Основное",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Переменные для хаба
local AutoWallHop = false
local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- Удобный доступ к Humanoid/HRP
local function getChar()
    return Player.Character or Player.CharacterAdded:Wait()
end
local function getHumanoid()
    return getChar():FindFirstChildWhichIsA("Humanoid")
end
local function getHRP()
    return getChar():FindFirstChild("HumanoidRootPart")
end

-- Auto WallHop
MainTab:AddToggle({
    Name = "Авто Валлхоп",
    Default = false,
    Callback = function(state)
        AutoWallHop = state
        spawn(function()
            while AutoWallHop do
                task.wait(0.1)
                local char = getChar()
                local hum = getHumanoid()
                local hrp = getHRP()
                if hum and hrp and hum.FloorMaterial == Enum.Material.Air then
                    local ray = Ray.new(hrp.Position, hrp.CFrame.LookVector * 2)
                    local hit = workspace:FindPartOnRay(ray, char)
                    if hit then
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end
        end)
    end
})

-- Super Jump
MainTab:AddButton({
    Name = "Супер Прыжок",
    Callback = function()
        local hum = getHumanoid()
        if hum then hum.JumpPower = 150 end
    end
})

-- Fast Run
MainTab:AddButton({
    Name = "Фаст Бег",
    Callback = function()
        local hum = getHumanoid()
        if hum then hum.WalkSpeed = 50 end
    end
})

-- God Mode
MainTab:AddButton({
    Name = "Режим Бога",
    Callback = function()
        local char = getChar()
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
                part.Transparency = 0.5
            end
        end
        local hum = getHumanoid()
        if hum then hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false) end
    end
})

-- Teleport Up
MainTab:AddBind({
    Name = "Тп вверх (X)",
    Default = Enum.KeyCode.X,
    Hold = false,
    Callback = function()
        local hrp = getHRP()
        if hrp then hrp.CFrame = hrp.CFrame + Vector3.new(0,10,0) end
    end
})

-- === Вкладка 2: PoolKids Injection ===
local InjectTab = Window:MakeTab({
    Name = "PoolKids Inject",
    Icon = "rbxassetid://6026568191",
    PremiumOnly = false
})

InjectTab:AddLabel("Нажми, чтобы загрузить PoolKids GUI v2.0:")

InjectTab:AddButton({
    Name = "Load PoolKids v2.0",
    Callback = function()
        local scriptCode = [[
--[[ PoolKids GUI Universal v2.0 ]]
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({
    Name = "PoolKids GUI v2.0",
    HidePremium = false,
    SaveConfig = false,
    IntroText = "PoolKids Universal v2.0",
    IntroIcon = "rbxassetid://6026568191"
})
local MainTab = Window:MakeTab({ Name = "PoolKids", Icon = "rbxassetid://6026568191", PremiumOnly = false })
local selectedPart

MainTab:AddLabel("🔍 Выберите объект и настройте его ниже:")
MainTab:AddDropdown({

Name = "Выбрать Part",
    Default = nil,
    Options = (function()
        local list = {}
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("MeshPart") then
                table.insert(list, v:GetFullName())
            end
        end
        return list
    end)(),
    Callback = function(choice)
        local obj = workspace
        for _, name in ipairs(string.split(choice, ".")) do
            obj = obj[name]
            if not obj then break end
        end
        selectedPart = obj
    end
})

-- Anchor Toggle
MainTab:AddToggle({
    Name = "✨ Anchor / Unanchor",
    Default = false,
    Callback = function(enabled)
        if selectedPart and selectedPart:IsA("BasePart") then
            selectedPart.Anchored = enabled
        end
    end
})

-- Color Picker
MainTab:AddColorPicker({
    Name = "🎨 Цвет",
    Default = Color3.new(1,1,1),
    Callback = function(col)
        if selectedPart and selectedPart:IsA("BasePart") then
            selectedPart.Color = col
        end
    end
})

-- Transparency Slider
MainTab:AddSlider({
    Name = "🌫️ Прозрачность",
    Min = 0, Max = 1, Default = 0, Increment = 0.05,
    Callback = function(val)
        if selectedPart and selectedPart:IsA("BasePart") then
            selectedPart.Transparency = val
        end
    end
})

-- Scale Slider
MainTab:AddSlider({
    Name = "📐 Scale",
    Min = 0.1, Max = 10, Default = 1, Increment = 0.1,
    Callback = function(scale)
        if selectedPart and selectedPart:IsA("BasePart") then
            local s = selectedPart.Size
            selectedPart.Size = Vector3.new(s.X*scale, s.Y*scale, s.Z*scale)
        end
    end
})

-- Material Dropdown
local mats = {}
for _, m in ipairs(Enum.Material:GetEnumItems()) do table.insert(mats, m.Name) end
MainTab:AddDropdown({
    Name = "🧱 Материал",
    Default = nil, Options = mats,
    Callback = function(matName)
        if selectedPart and selectedPart:IsA("BasePart") then
            selectedPart.Material = Enum.Material[matName]
        end
    end
})

-- Reflectance Slider
MainTab:AddSlider({
    Name = "🔆 Reflectance",
    Min = 0, Max = 1, Default = 0, Increment = 0.05,
    Callback = function(r)
        if selectedPart and selectedPart:IsA("BasePart") then
            selectedPart.Reflectance = r
        end
    end
})

-- Friction & Elasticity
MainTab:AddSlider({
    Name = "⚙️ Friction",
    Min = 0, Max = 1, Default = 0.5, Increment = 0.05,
    Callback = function(f)
        if selectedPart and selectedPart:IsA("BasePart") then
            local p = selectedPart.CustomPhysicalProperties
            selectedPart.CustomPhysicalProperties = PhysicalProperties.new(f, p.Elasticity, p.FrictionWeight, p.ElasticityWeight, p.Density)
        end
    end
})
MainTab:AddSlider({
    Name = "⚙️ Elasticity",
    Min = 0, Max = 1, Default = 0, Increment = 0.05,
    Callback = function(e)
        if selectedPart and selectedPart:IsA("BasePart") then
            local p = selectedPart.CustomPhysicalProperties
            selectedPart.CustomPhysicalProperties = PhysicalProperties.new(p.Friction, e, p.FrictionWeight, p.ElasticityWeight, p.Density)
        end
    end
})

-- Change Image ID
MainTab:AddTextbox({
    Name = "🖼️ Новый Image ID",
    Default = "", TextDisappear = true,
    Callback = function(id)
        if selectedPart then
            for _, v in ipairs(selectedPart:GetDescendants()) do
                if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ImageLabel") then
                    v.Texture = "rbxassetid://"..id
                end
            end
        end
    end
})

-- Clone & Delete
MainTab:AddButton({ Name = "📄 Clone Part", Callback = function()
    if selectedPart then
        local c = selectedPart:Clone()
        c.Parent = selectedPart.Parent
    end
end})
MainTab:AddButton({ Name = "🗑️ Delete Part", Callback = function()
    if selectedPart then
        selectedPart:Destroy()
        selectedPart = nil
    end
end})
