repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character
getgenv().Settings = {
    WalkSpeedToggle = nil,
    WalkSpeedInput = nil,
    JumpPowerToggle = nil,
    JumpPowerInput = nil,
    HitboxToggle = nil,
    HitboxInput = nil,
    HitboxKeybind = nil,
    AutoDribble = nil,
    vipToggle = nil,
    InstantKickKeybind = nil,
    InputPower = nil,
    espToggle = nil,
    espStyleToggle = nil,
    espAwakeningToggle = nil,
    espFlowToggle  = nil,
    espStaminaToggle = nil,
    BallPredicToggle = nil,
    AutoFarmTweenToggle = nil,
    AutoFarmTeleportToggle = nil,
    InfiniteStamina = false,
    WhiteScreen = nil,
    AutoGoalKeeper = nil,
    AutoGKKeybind = "",
    TeamPositionDropdown = nil,
    AutoTeamToggle = nil,
    AutoTeamForAutoFarmToggle = nil,
    InstantGoalToggle = nil,
    AutoHopToggle = nil,
    AutoHopThresholdInput = nil,
    KaiserToggle = nil,
    KaiserKeybide = nil,
    CurveShotProMaxToggle = nil,
    CurveShotProMaxKeybind = nil,
    NoCooldownStealToggle = nil,
    NoCooldownAirDribbleToggle = nil,
    NoCooldownAirDashToggle = nil,
    StyleLockDropdown = nil,
    AutoSpinToggle = nil,
    FlowLockDropdown = nil,
    AutoFlowToggle = nil,
    EffectsDropdown = nil,
    CosmeticsDropdown = nil,
    CardsDropdown = nil,
    LagSwitchToggle = nil,
}

local function CreateToggle()
    local toggleGui = Instance.new("ScreenGui")
    toggleGui.Name = "ToggleGui"
    toggleGui.DisplayOrder = 1e+04
    toggleGui.IgnoreGuiInset = true
    toggleGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    toggleGui.ResetOnSpawn = false
    toggleGui.Parent = game:GetService("CoreGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.BackgroundTransparency = 1
    mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    mainFrame.BorderSizePixel = 0
    mainFrame.Position = UDim2.fromScale(0.925, 0.116)
    mainFrame.Size = UDim2.fromScale(0.083, 0.148)

    local uICorner = Instance.new("UICorner")
    uICorner.Name = "UICorner"
    uICorner.CornerRadius = UDim.new(1, 0)
    uICorner.Parent = mainFrame

    local toggleButton = Instance.new("ImageButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Image = "rbxassetid://112196145837803"
    toggleButton.ImageTransparency = 0.3
    toggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.BackgroundTransparency = 1
    toggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    toggleButton.BorderSizePixel = 0
    toggleButton.Position = UDim2.fromScale(0.491, 0.482)
    toggleButton.Size = UDim2.fromScale(1, 1)

    local uICorner1 = Instance.new("UICorner")
    uICorner1.Name = "UICorner"
    uICorner1.CornerRadius = UDim.new(1, 0)
    uICorner1.Parent = toggleButton

    toggleButton.Parent = mainFrame

    local uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    uIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
    uIAspectRatioConstraint.AspectRatio = 1
    uIAspectRatioConstraint.Parent = mainFrame

    mainFrame.Parent = toggleGui

    return toggleButton
end

local Device;
function checkDevice()
    local player = game.Players.LocalPlayer
    if player then
        local UserInputService = game:GetService("UserInputService")
        
        if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
            local FeariseToggle = CreateToggle()
            FeariseToggle.MouseButton1Click:Connect(function()
                for _, guiObject in ipairs(game:GetService("CoreGui"):GetChildren()) do
                    if guiObject.Name == "FeariseHub" and guiObject:IsA("ScreenGui") then
                        for FrameIndex, FrameValue in pairs(guiObject:GetChildren()) do
                            if FrameValue:IsA("Frame") and FrameValue:FindFirstChild("CanvasGroup") then
                                FrameValue.Visible = not FrameValue.Visible
                            end
                        end
                    end
                end
            end)
            game:GetService("CoreGui").ChildRemoved:Connect(function(Value)
                if Value.Name == "FeariseHub" then
                    FeariseToggle.Parent.Parent:Destroy()
                end
            end)
            Device = UDim2.fromOffset(480, 360)
        else
            Device = UDim2.fromOffset(580, 460)
        end
    end
end
checkDevice()

local FileName = tostring(game.Players.LocalPlayer.UserId).."_Settings.json"
local BaseFolder = "FeariseHub"
local SubFolder = "BlueLockRivals"

function SaveSetting() 
    local json
    local HttpService = game:GetService("HttpService")
    
    if writefile then
        json = HttpService:JSONEncode(getgenv().Settings)

        if not isfolder(BaseFolder) then
            makefolder(BaseFolder)
        end
        if not isfolder(BaseFolder.."/"..SubFolder) then
            makefolder(BaseFolder.."/"..SubFolder)
        end
        
        writefile(BaseFolder.."/"..SubFolder.."/"..FileName, json)
    else
        error("ERROR: Can't save your settings")
    end
end

function LoadSetting()
    local HttpService = game:GetService("HttpService")
    if readfile and isfile and isfile(BaseFolder.."/"..SubFolder.."/"..FileName) then
        getgenv().Settings = HttpService:JSONDecode(readfile(BaseFolder.."/"..SubFolder.."/"..FileName))
    end
end

LoadSetting()

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/imyourlio/Cracked/refs/heads/main/Fearise%20UI"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fearise Hub" .. " | ".."BlueLock : Rival".." | ".."[Version 3]",
    SubTitle = "by Rowlet/Blobby",
    TabWidth = 160,
    Size =  Device, --UDim2.fromOffset(480, 360), --default size (580, 460)
    Acrylic = false, -- การเบลออาจตรวจจับได้ การตั้งค่านี้เป็น false จะปิดการเบลอทั้งหมด
    Theme = "Rose", --Amethyst
    MinimizeKey = Enum.KeyCode.LeftControl --RightControl
})

local Tabs = {
    --[[ Tabs --]]
    pageLegit = Window:AddTab({ Title = "Legit", Icon = "align-justify" }),
    pageVisual = Window:AddTab({ Title = "Visual", Icon = "view" }),
    pageKaitan = Window:AddTab({ Title = "Kaitan", Icon = "crown" }),
    pageOP = Window:AddTab({ Title = "OP", Icon = "apple" }),
    pageRage = Window:AddTab({ Title = "Rage", Icon = "bug" }),
    pageSpin = Window:AddTab({ Title = "Spin", Icon = "box" }),
    pageItem = Window:AddTab({ Title = "Item", Icon = "archive" }),
    pageSettings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

do
    -------------------------------------------------------[[ LEGIT ]]-------------------------------------------------------
    local SpeedTitle = Tabs.pageLegit:AddSection("Player Modifiers")
    local WalkSpeedToggle = Tabs.pageLegit:AddToggle("WalkSpeedToggle", {Title = "Toggle WalkSpeed", Default = getgenv().Settings.WalkSpeedToggle or false })
    local WalkSpeedInput = Tabs.pageLegit:AddInput("WalkSpeedInput", {
        Title = "WalkSpeed Input",
        Default = getgenv().Settings.WalkSpeedInput or 16,
        Numeric = true,
        Finished = false,
        Callback = function(Value)
            getgenv().Settings.WalkSpeedInput = Value
            SaveSetting()
        end
    })
    WalkSpeedInput:OnChanged(function(Value)
        getgenv().Settings.WalkSpeedInput = Value
        SaveSetting()
    end)
    local JumpPowerToggle = Tabs.pageLegit:AddToggle("JumpPowerToggle", {Title = "Toggle JumpPower", Default = getgenv().Settings.JumpPowerToggle or false })
    local JumpPowerInput = Tabs.pageLegit:AddInput("JumpPowerInput", {
        Title = "JumpPower Input",
        Default = getgenv().Settings.JumpPowerInput or 50,
        Numeric = true,
        Finished = false,
        Callback = function(Value)
            getgenv().Settings.JumpPowerInput = Value
            SaveSetting()
        end
    })
    JumpPowerInput:OnChanged(function(Value)
        getgenv().Settings.JumpPowerInput = Value
        SaveSetting()
    end)
    local HitboxTitle = Tabs.pageLegit:AddSection("Hitbox")
    local HitboxToggle = Tabs.pageLegit:AddToggle("HitboxToggle", { Title = "Hitbox", Default = getgenv().Settings.HitboxToggle or false })
    local HitboxInput = Tabs.pageLegit:AddInput("HitboxInput", {
        Title = "Hitbox Input",
        Default = getgenv().Settings.HitboxInput or 10,
        Placeholder = "Enter size (1-30)",
        Numeric = true,
        Finished = false,
        Callback = function(Value)
            getgenv().Settings.HitboxInput = Value
            SaveSetting()
        end
    })
    HitboxInput:OnChanged(function(Value)
        getgenv().Settings.HitboxInput = Value
        SaveSetting()
    end)
    local HitboxKeybind = Tabs.pageLegit:AddKeybind("HitboxKeybind", {
        Title = "Toggle Hitbox Keybind",
        Mode = "Toggle",
        Default = "",
        Callback = function(Value)
            getgenv().Settings.HitboxKeybind = Value
        end,
        ChangedCallback = function(NewKey)
            getgenv().Settings.HitboxKeybind = NewKey
        end
    })
    local MiscTitle = Tabs.pageLegit:AddSection("Misc")
    local AutoDribble = Tabs.pageLegit:AddToggle("AutoDribble", {Title = "AutoDribble", Description = "Testing.", Default = getgenv().Settings.AutoDribble or false })
    local vipToggle = Tabs.pageLegit:AddToggle("vipToggle", {Title = "vipToggle", Description = "Testing.", Default = getgenv().Settings.vipToggle or false })
    local InfiniteStaminaButton Tabs.pageLegit:AddButton({
        Title = "Infinite Stamina",
        Description = "Click to enable Infinite Stamina (cannot be disabled)",
        Callback = function()
            if not getgenv().Settings.InfiniteStamina then
                getgenv().Settings.InfiniteStamina = true
                SaveSetting()
                Fluent:Notify({
                    Title = "Infinite Stamina",
                    Content = "Enabled",
                    Duration = 3
                })
            else
                Fluent:Notify({
                    Title = "Infinite Stamina",
                    Content = "Already Enabled",
                    Duration = 3
                })
            end
        end
    })
    task.spawn(function()
        while task.wait(0.1) do
            if getgenv().Settings.InfiniteStamina then
                pcall(function()
                    local plr = game.Players.LocalPlayer
                    local stats = plr:FindFirstChild("PlayerStats")
                    if stats then
                        local stamina = stats:FindFirstChild("Stamina")
                        if stamina then
                            stamina:Destroy()
                            local fakeStamina = Instance.new("NumberValue")
                            fakeStamina.Name = "Stamina"
                            fakeStamina.Value = math.huge
                            fakeStamina.Parent = stats
                        end
                    end
                end)
            end
        end
    end)
    local EnchantedTitle = Tabs.pageLegit:AddSection("Enchanted")
    local InstantKickKeybind = Tabs.pageLegit:AddKeybind("InstantKickKeybind", {
        Title = "Shoot Keybind",
        Mode = "Toggle",
        Default = "",
        Callback = function(Value)
            getgenv().Settings.InstantKickKeybind = Value
        end,
        ChangedCallback = function(Value)
            getgenv().Settings.InstantKickKeybind = Value
        end
    })
    local InputPower = Tabs.pageLegit:AddInput("InputPower", {
        Title = "Adjust Power (1-100000)",
        Default = getgenv().Settings.InputPower or "500",
        Placeholder = "Enter power...",
        Numeric = true,
        Finished = false,
        Callback = function(Value)
            getgenv().Settings.InputPower = tonumber(Value)
            SaveSetting()
        end
    })
    InputPower:OnChanged(function(Value)
        getgenv().Settings.InputPower = tonumber(Value)
        SaveSetting()
    end)

    -------------------------------------------------------[[ VISUAL ]]-------------------------------------------------------
    local espToggle = Tabs.pageVisual:AddToggle("espToggle", {Title = "Enable ESP", Default = getgenv().Settings.espToggle or false })
    local espStyleToggle = Tabs.pageVisual:AddToggle("espStyleToggle", {Title = "Enable Style", Default = getgenv().Settings.espStyleToggle or false })
    local espAwakeningToggle = Tabs.pageVisual:AddToggle("espAwakeningToggle", {Title = "Enable Awakning", Default = getgenv().Settings.espAwakeningToggle or false })
    local espFlowToggle = Tabs.pageVisual:AddToggle("espFlowToggle", {Title = "Enable Flow", Default = getgenv().Settings.espFlowToggle or false })
    local espStaminaToggle = Tabs.pageVisual:AddToggle("espStaminaToggle", {Title = "Enable Stamina", Default = getgenv().Settings.espStaminaToggle or false })
    local BallPredicToggle = Tabs.pageVisual:AddToggle("BallPredicToggle", {Title = "ESP BallPredic", Default = getgenv().Settings.BallPredicToggle or false})

    -------------------------------------------------------[[ KAITAN ]]-------------------------------------------------------
    local Striker = Tabs.pageKaitan:AddSection("Striker")
    local AutoFarmTweenToggle = Tabs.pageKaitan:AddToggle("AutoFarmTweenToggle", { Title = "Auto Farm(Tween)", Default = getgenv().Settings.AutoFarmTweenToggle or false })
    local AutoFarmTeleportToggle = Tabs.pageKaitan:AddToggle("AutoFarmTeleportToggle", { Title = "Auto Farm(TP)", Default = getgenv().Settings.AutoFarmTeleportToggle or false })
    local WhiteScreen = Tabs.pageKaitan:AddToggle("WhiteScreen", { Title = "WhiteScreen [GPU 0%]", Default = getgenv().Settings.WhiteScreen or false })
    local GoalTitle = Tabs.pageKaitan:AddSection("Goal (In Testing)")
    local AutoGoalKeeper = Tabs.pageKaitan:AddToggle("WhitAutoGoalKeepereScreen", { Title = "Auto GK", Default = getgenv().Settings.AutoGoalKeeper or false })
    local AutoGKKeybind = Tabs.pageKaitan:AddKeybind("AutoGKKeybind", {
        Title = "Auto GK Keybind",
        Mode = "Toggle",
        Default = "",
        Callback = function(Value)
            getgenv().Settings.AutoGKKeybind = Value
        end,
        ChangedCallback = function(Value)
            getgenv().Settings.AutoGKKeybind = Value
        end
    })
    -- AutoGKKeybind:OnChanged(function(Value)
    --     getgenv().Settings.AutoGKKeybind = Value
    --     SaveSetting()
    -- end)
    local Properties = Tabs.pageKaitan:AddSection("Properties")
    local TeamPositionDropdown = Tabs.pageKaitan:AddDropdown("TeamPositionDropdown", {
        Title = "Team and Position",
        Description = "Select your preferred team and position.",
        Values = {
            "Home_CF", "Home_LW", "Home_RW", "Home_CM", "Home_DM", "Home_CB", "Home_GK",
            "Away_CF", "Away_LW", "Away_RW", "Away_CM", "Away_DM", "Away_CB", "Away_GK"
        },
        Multi = false,
        Default = getgenv().Settings.TeamPositionDropdown or "Home_CF",
        Callback = function(Value)
            getgenv().Settings.TeamPositionDropdown = Value
            SaveSetting()
        end
    })
    TeamPositionDropdown:OnChanged(function(Value)
        getgenv().Settings.TeamPositionDropdown = Value
        SaveSetting()
    end)
    local AutoTeamToggle = Tabs.pageKaitan:AddToggle("AutoTeamToggle", { Title = "Auto Team & Position", Default = getgenv().Settings.AutoTeamToggle or false })
    local AutoTeamForAutoFarmToggle = Tabs.pageKaitan:AddToggle("AutoTeamForAutoFarmToggle", { Title = "Auto Team & Position (For Auto Farm)", Default = getgenv().Settings.AutoTeamForAutoFarmToggle or false })
    local InstantGoalToggle = Tabs.pageKaitan:AddToggle("InstantGoalToggle", { Title = "Instant Goal (Auto Farm Only)", Default = getgenv().Settings.InstantGoalToggle or false })
    local HopTitle = Tabs.pageKaitan:AddSection("Hop Server")
    local AutoHopToggle = Tabs.pageKaitan:AddToggle("AutoHopToggle", { Title = "Auto Hop", Default = getgenv().Settings.AutoHopToggle or false })
    local AutoHopThresholdInput = Tabs.pageKaitan:AddInput("AutoHopThresholdInput", {
        Title = "Auto Hop When Players ≤",
        Description = "ย้ายเซิฟหากผู้เล่นน้อยกว่า",
        Default = getgenv().Settings.AutoHopThresholdInput or 4,
        Placeholder = "Enter Number Of Players",
        Numeric = true,
        Finished = false,
        Callback = function(v)
            getgenv().Settings.AutoHopThresholdInput = tonumber(v)
            SaveSetting()
        end
    })
    AutoHopThresholdInput:OnChanged(function(v)
        getgenv().Settings.AutoHopThresholdInput = tonumber(v)
        SaveSetting()
    end)

    -------------------------------------------------------[[ OP ]]-------------------------------------------------------
    local KaiserToggle = Tabs.pageOP:AddToggle("KaiserToggle", { Title = "Kaiser Impack", Default = getgenv().Settings.KaiserToggle or false })
    local KaiserKeybide = Tabs.pageOP:AddKeybind("KaiserKeybide", {
        Title = "Toggle Kaiser Impack Keybind",
        Mode = "Toggle",
        Default = "",
        Callback = function(Value)
            getgenv().Settings.KaiserKeybide = Value
        end,
        ChangedCallback = function(Value)
            getgenv().Settings.KaiserKeybide = Value
        end
    })
    local CurveShotProMaxToggle = Tabs.pageOP:AddToggle("CurveShotProMaxToggle", { Title = "Gyro Shot Pro Max", Default = getgenv().Settings.CurveShotProMaxToggle or false })
    local CurveShotProMaxKeybind = Tabs.pageOP:AddKeybind("CurveShotProMaxKeybind", {
        Title = "Toggle Gyro Shot Keybind",
        Mode = "Toggle",
        Default = "",
        Callback = function(Value)
            getgenv().Settings.CurveShotProMaxKeybind = Value
        end,
        ChangedCallback = function(Value)
            getgenv().Settings.CurveShotProMaxKeybind = Value
        end
    })
    local SkillTitle = Tabs.pageOP:AddSection("No CD Skill (Wave Required)")
    local NoCooldownStealToggle = Tabs.pageOP:AddToggle("NoCooldownStealToggle", { Title = "No Cooldown - Steal", Default = getgenv().Settings.NoCooldownStealToggle or false })
    local NoCooldownAirDribbleToggle = Tabs.pageOP:AddToggle("NoCooldownAirDribbleToggle", { Title = "No Cooldown - AirDribble", Default = getgenv().Settings.NoCooldownAirDribbleToggle or false })
    local NoCooldownAirDashToggle = Tabs.pageOP:AddToggle("NoCooldownAirDashToggle", { Title = "No Cooldown - AirDash", Default = getgenv().Settings.NoCooldownAirDashToggle or false })

    -------------------------------------------------------[[ RAGE ]]-------------------------------------------------------
    local LagSwitchToggle = Tabs.pageRage:AddToggle("LagSwitchToggle", {Title = "Lag Switch", Default = getgenv().Settings.LagSwitchToggle or false })

    -------------------------------------------------------[[ SPIN ]]-------------------------------------------------------
    local StyleTitle = Tabs.pageSpin:AddSection("Style Spin")
    local StyleLockDropdown = Tabs.pageSpin:AddDropdown("StyleLockDropdown", {
        Title = "Style Lock",
        Description = "Select styles to stop spinning.",
        Values = {"Isagi", "Chigiri", "Bachira", "Otoya", "Hiori", "Gagamaru", "King", "Nagi", "Reo",  "Karasu", "Shidou", "Kunigami", "Sae", "Aiku", "Rin", "Yukimiya", "Don Lorenzo"}, -- Replace with actual style names
        Multi = true,
        Default = {}
    })
    StyleLockDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        getgenv().Settings.StyleLockDropdown = Values
        SaveSetting()
    end)
    local AutoSpinToggle = Tabs.pageSpin:AddToggle("AutoSpinToggle", { Title = "Auto Style Spin", Default = getgenv().Settings.AutoSpinToggle or false })
    local FlowTitle = Tabs.pageSpin:AddSection("Flow Spin")
    local FlowLockDropdown = Tabs.pageSpin:AddDropdown("FlowLockDropdown", {
        Title = "Flow Lock",
        Description = "Select Flow to stop spinning.",
        Values = { "Ice", "Lightning", "Puzzle", "Monster", "Gale Burst", "Genius", "King's Instinct", "Trap", "Crow", "Demon Wings", "Chameleon", "Wild Card", "Snake", "Prodigy", "Awakened Genius", "Dribbler"}, -- Actual flow names
        Multi = true,
        Default = {}
    })
    FlowLockDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        getgenv().Settings.FlowLockDropdown = Values
        SaveSetting()
    end)
    local AutoFlowToggle = Tabs.pageSpin:AddToggle("AutoFlowToggle", { Title = "Auto Flow Spin", Default = getgenv().Settings.AutoFlowToggle or false })

    -------------------------------------------------------[[ ITEM ]]-------------------------------------------------------
    local EffectsTitle = Tabs.pageItem:AddSection("Goal Effects")
    local ItemsList = {
        EFX = {},
        Cosmatics = {},
        Cards = {},

    }
    local function GetAllItem()
        for _, v in ipairs(game:GetService("ReplicatedStorage").Assets.GoalEffects:GetChildren()) do
            table.insert(ItemsList.EFX, v.Name)
        end
        for _, v in ipairs(game:GetService("ReplicatedStorage").Assets.Cosmetics:GetChildren()) do
            table.insert(ItemsList.Cosmatics, v.Name)
        end
        for _, v in ipairs(game:GetService("ReplicatedStorage").Assets.Customization.Cards:GetChildren()) do
            table.insert(ItemsList.Cards, v.Name)
        end
    end
    GetAllItem()
    local EffectsDropdown = Tabs.pageItem:AddDropdown("EffectsDropdown", {
        Title = "Goal Effects",
        Values = ItemsList.EFX,
        Multi = false,
        Default = getgenv().Settings.EffectsDropdown or "",
        Callback = function(Value)
            getgenv().Settings.EffectsDropdown = Value
            SaveSetting()
        end
    })
    EffectsDropdown:OnChanged(function(Value)
        getgenv().Settings.EffectsDropdown = Value
        SaveSetting()
    end)
    local ApplyEffectButton = Tabs.pageItem:AddButton({
        Title = "Apply Effect",
        Callback = function()
            if getgenv().Settings.EffectsDropdown ~= "" then
                game:GetService("ReplicatedStorage").Packages.Knit.Services.CustomizationService.RE.Customize:FireServer("GoalEffects", getgenv().Settings.EffectsDropdown)
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Your Wear Goal Effect "..tostring(getgenv().Settings.EffectsDropdown),
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Please Select Goal Effect Before Use.",
                    Duration = 3
                })
            end
        end
    })
    local CosmeticsTitle = Tabs.pageItem:AddSection("Cosmetics")
    local CosmeticsDropdown = Tabs.pageItem:AddDropdown("CosmeticsDropdown", {
        Title = "Cosmetics",
        Values = ItemsList.Cosmatics,
        Multi = false,
        Default = getgenv().Settings.CosmeticsDropdown or "",
        Callback = function(Value)
            getgenv().Settings.CosmeticsDropdown = Value
            SaveSetting()
        end
    })
    CosmeticsDropdown:OnChanged(function(Value)
        getgenv().Settings.CosmeticsDropdown = Value
        SaveSetting()
    end)
    local ApplyCosmetic = Tabs.pageItem:AddButton({
        Title = "Apply Cosmetic",
        Callback = function()
            if getgenv().Settings.CosmeticsDropdown ~= "" then
                game:GetService("ReplicatedStorage").Packages.Knit.Services.CustomizationService.RE.Customize:FireServer("Cosmetics", getgenv().Settings.CosmeticsDropdown)
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Your Wear Cosmetic "..tostring(getgenv().Settings.CosmeticsDropdown),
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Please Select Cosmetic Before Use.",
                    Duration = 3
                })
            end
        end
    })
    local CardsTitle = Tabs.pageItem:AddSection("Cards")
    local CardsDropdown = Tabs.pageItem:AddDropdown("CardsDropdown", {
        Title = "Cards",
        Values = ItemsList.Cards,
        Multi = false,
        Default = getgenv().Settings.CardsDropdown or "",
        Callback = function(Value)
            getgenv().Settings.CardsDropdown = Value
            SaveSetting()
        end
    })
    CardsDropdown:OnChanged(function(Value)
        getgenv().Settings.CardsDropdown = Value
        SaveSetting()
    end)
    local ApplyCard = Tabs.pageItem:AddButton({
        Title = "Apply Card",
        Callback = function()
            if getgenv().Settings.CardsDropdown ~= "" then
                game:GetService("ReplicatedStorage").Packages.Knit.Services.CustomizationService.RE.Customize:FireServer("Cards", getgenv().Settings.CardsDropdown)
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Your Wear Card "..tostring(getgenv().Settings.CardsDropdown),
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Please Select Card Before Use.",
                    Duration = 3
                })
            end
        end
    })

    -------------------------------------------------------[[ ABOUT SCRIPT ]]-------------------------------------------------------
    -------------------------------------------------------[[ VARIABLES ]]-------------------------------------------------------
    local Services = {
        Players = game:GetService("Players"),
        RunServices = game:GetService("RunService"),
        ReplicatedStorage = game:GetService("ReplicatedStorage"),
        Workspace = game:GetService("Workspace"),
        VirtualInputManager = game:GetService("VirtualInputManager"),
        TeleportService = game:GetService("TeleportService"),
        HttpService = game:GetService("HttpService"),
        TweenService = game:GetService("TweenService"),
        CollectionService = game:GetService("CollectionService"),
        CoreGui = game:GetService("CoreGui")
    }

    local player = Services.Players.LocalPlayer
    local mouse = player:GetMouse()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid") or character:WaitForChild("Humanoid", 9e99)
    local humanoidrootpart = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 9e99)
    local camera = Services.Workspace.CurrentCamera

    local Remotes = {
        Dribble = Services.ReplicatedStorage.Packages.Knit.Services.BallService.RE.Dribble,
        Shoot = Services.ReplicatedStorage.Packages.Knit.Services.BallService.RE.Shoot,
        Drive = Services.ReplicatedStorage.Packages.Knit.Services.BallService.RE.Dive,
        TeamService = Services.ReplicatedStorage.Packages.Knit.Services.TeamService
    
    }
    local Debris_Variables = {
        Function_Variables = {
            getAllFromCollection = {
                taggedInstances
            },
            GetBallInPlayer =  {
                FootBall
            },
            triggerQ = {
                Distance
            },
            createBillboard = {
                BillboardGui
            },
            createBarGui = {
                gui,
                frame
            },
            createBar = {
                BackgroundFrame,
                FillFrame
            },
            onCharacterAdded = {
                HumanoidRootPart,
                styleGui,
                styleTxt,
                awakeGui,
                awakeFrame,
                flowGui,
                flowFrame,
                stamGui,
                stamFrame,
                awkBar,
                flowBar,
                stmBar,
                Distance,
                PlayerStats,
            },
            createESP = {
                espData,
            },
            warpBallToGoal = {
                ball
            }
        },
        Modules = {

        },
        ESP_Features = {
            espEnabled = false,
            espFeatures = {Style = false, Awakening = false, Flow = false, Stamina = false},
            espObjects = {}
        },
        WalkSpeedToggle = {
            WalkSpeedConnect
        },
        HitboxToggle = {
            FootBall,
            HitBox,
            Char,
        },
        HitboxKeybind = {
            State
        },
        AutoDribble = {
            tracked = {},
            TargetPlayer,
            Distance,
            Sliding,
            isSliding
        },
        vipToggle = {
            hasVIP
        },
        Raycast = {
            ball,
            lastPosition,
            GRAVITY = workspace.Gravity,
            TIME_STEP = 0.1,
            MAX_TIME = 3,
            VELOCITY_THRESHOLD = 1,
            MOVEMENT_THRESHOLD = 1,
            rayPart, -- เส้นที่แสดงวิถีลูกบอล
            tween -- Tween ปัจจุบัน
            
        },
        AutoGKKeybind = {
            State,
            ball,
            Distance
        },
        AutoTeamToggle = {
            selectedValue,
            team,
            position
        },
        KaiserKeybide = {
            State
        },
        CurveShotProMaxKeybind = {
            State
        },
        NoCooldownStealToggle = {
            newSteal
        },
        NoCooldownAirDribbleToggle = {
            --airdribbleModule = require(game:GetService("ReplicatedStorage").Controllers.AbilityController.Abilities.Nagi.AirDribble)
        },
        NoCooldownAirDashToggle = {
            --originalAirDash = require(game:GetService("ReplicatedStorage").Controllers.AbilityController.Abilities.Nagi.AirDash)
        }
    }

    local goalCFrames = {
        Home = {
            CFrame.new(323.849396, 11.1665344, -29.958168, -0.346998423, -2.85511348e-08, -0.937865734, 2.543152e-08, 1, -3.98520079e-08, 0.937865734, -3.76799356e-08, -0.346998423),
            CFrame.new(326.027893, 11.1665325, -67.0218277, 0.910013974, -1.74189319e-09, -0.414577574, -1.44234642e-08, 1, -3.58616781e-08, 0.414577574, 3.86142709e-08, 0.910013974)
        },
        Away = {
            CFrame.new(-247.79953, 11.1665344, -68.2236633, 0.441729337, -3.98036413e-08, -0.897148371, 8.61732801e-08, 1, -1.93767069e-09, 0.897148371, -7.64542918e-08, 0.441729337),
            CFrame.new(-247.711075, 25.6309118, -30.344408, 0.936370671, 0.0215997752, -0.350347638, -3.86210353e-08, 0.99810493, 0.0615354702, 0.351012826, -0.0576199964, 0.934596181)
        }
    }
    -------------------------------------------------------[[ FUNCTION STORAGE ]]-------------------------------------------------------
    local Function_Storage = {}

    Function_Storage.getAllFromCollection = function(tagName)
        Debris_Variables.Function_Variables.getAllFromCollection.taggedInstances = Services.CollectionService:GetTagged(tagName)
        return Debris_Variables.Function_Variables.getAllFromCollection.taggedInstances
    end
    Function_Storage.GetBall = function()
        for _, obj in pairs(Function_Storage.getAllFromCollection("Football")) do
            if obj.Name == "Football" and obj.Parent ~= Services.ReplicatedStorage.Assets then
                return obj
            end
        end
    end
    Function_Storage.GetBallInPlayer = function()
        Debris_Variables.Function_Variables.GetBallInPlayer.FootBall = Function_Storage.GetBall()
        if not Debris_Variables.Function_Variables.GetBallInPlayer.FootBall then return false end
        
        for PlayerIndex, PlayerValue in ipairs(game.Players:GetPlayers()) do
            if PlayerValue ~= player and PlayerValue.Character and Debris_Variables.Function_Variables.GetBallInPlayer.FootBall:IsDescendantOf(PlayerValue.Character) then
                return true
            end
        end
        return false
    end
    Function_Storage.PressKey = function(KeyCode) --Example: Enum.KeyCode.Q
        Services.VirtualInputManager:SendKeyEvent(true, KeyCode, false, nil)
        task.wait(0.1)
        Services.VirtualInputManager:SendKeyEvent(false, KeyCode, false, nil)
    end
    Function_Storage.UpdateHitboxSize = function(TargetHitbox, Transparency, HitboxSize)
        TargetHitbox.Material = Enum.Material.ForceField
        TargetHitbox.BrickColor = BrickColor.new("Neon orange")
        TargetHitbox.Transparency = Transparency
        TargetHitbox.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
    end
    Function_Storage.triggerQ = function(Target)
        if Target and Target:FindFirstChild("HumanoidRootPart") and character and character:FindFirstChild("HumanoidRootPart") then
            if Target.Team == player.Team then return end
            
            Debris_Variables.Function_Variables.triggerQ.Distance = (humanoidrootpart.Position - Target.HumanoidRootPart.Position).Magnitude
            if Debris_Variables.Function_Variables.triggerQ.Distance <= 20 then
                Remotes.Dribble:FireServer()
                return true
            end
        end
        return false
    end
    Function_Storage.shootBall = function()
        local args = {
            [1] = getgenv().Settings.InputPower,
            [4] = mouse.Hit.Position
        }
        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(unpack(args))        
    end
    Function_Storage.createESP = function(plr)
        if plr == player then return end
        Debris_Variables.Function_Variables.createESP.espData = {}

        function onCharacterAdded(c)
            local h = c:WaitForChild("HumanoidRootPart", 10)
            if not h then return end

            function createBillboard(size, offset)
                local b = Instance.new("BillboardGui")
                b.Adornee = h
                b.Size = size
                b.StudsOffset = offset
                b.AlwaysOnTop = true
                b.Parent = game.CoreGui
                return b
            end

            local styleGui = createBillboard(UDim2.new(3, 0, 1, 0), Vector3.new(0, 4, 0))
            local styleTxt = Instance.new("TextLabel", styleGui)
            styleTxt.Size = UDim2.new(1, 0, 1, 0)
            styleTxt.BackgroundTransparency = 1
            styleTxt.TextStrokeTransparency = 0.5
            styleTxt.TextColor3 = Color3.new(1, 1, 1)
            styleTxt.TextScaled = true
            styleTxt.Text = "Style: ???"

            function createBarGui(offset)
                local gui = createBillboard(UDim2.new(2, 0, 6, 0), offset)
                local frame = Instance.new("Frame", gui)
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundTransparency = 1
                return gui, frame
            end

            function createBar(parent, color, pos)
                local bg = Instance.new("Frame", parent)
                bg.Size = UDim2.new(0.2, 0, 0.8, 0)
                bg.Position = UDim2.new(pos, 0, 0.1, 0)
                bg.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
                bg.BackgroundTransparency = 0.3
                bg.BorderSizePixel = 0

                local fill = Instance.new("Frame", bg)
                fill.Size = UDim2.new(1, 0, 1, 0)
                fill.AnchorPoint = Vector2.new(0, 1)
                fill.Position = UDim2.new(0, 0, 1, 0)
                fill.BackgroundColor3 = color
                fill.BorderSizePixel = 0

                return fill
            end

            local awakeGui, awakeFrame = createBarGui(Vector3.new(4, 0, 0))
            local flowGui, flowFrame = createBarGui(Vector3.new(4.2, 0, 0))
            local stamGui, stamFrame = createBarGui(Vector3.new(4.4, 0, 0))

            local awkBar = createBar(awakeFrame, Color3.new(1, 0.2, 0.2), 0)
            local flowBar = createBar(flowFrame, Color3.new(0.921569, 1.000000, 0.200000), 0.25)
            local stmBar = createBar(stamFrame, Color3.new(0.196078, 0.019608, 1.000000), 0.5)

            table.insert(Debris_Variables.Function_Variables.createESP.espData, {gui = styleGui, feature = "Style"})
            table.insert(Debris_Variables.Function_Variables.createESP.espData, {gui = awakeGui, feature = "Awakening"})
            table.insert(Debris_Variables.Function_Variables.createESP.espData, {gui = flowGui, feature = "Flow"})
            table.insert(Debris_Variables.Function_Variables.createESP.espData, {gui = stamGui, feature = "Stamina"})

            Services.RunServices.RenderStepped:Connect(function()
                if c and h and camera then
                    local dist = (camera.CFrame.Position - h.Position).Magnitude
                    styleGui.Size = UDim2.new(math.clamp(dist / 10, 3, 10), 0, math.clamp(dist / 20, 1, 5), 0)

                    local s = plr:FindFirstChild("PlayerStats")
                    if s then
                        styleTxt.Text = (s:FindFirstChild("Style") and s.Style.Value or "None")
                        awkBar.Size = UDim2.new(1, 0, math.clamp((s:FindFirstChild("AwakeningBar") and s.AwakeningBar.Value or 0) / 100, 0, 1), 0)
                        flowBar.Size = UDim2.new(1, 0, math.clamp((s:FindFirstChild("FlowBar") and s.FlowBar.Value or 0) / 100, 0, 1), 0)
                        stmBar.Size = UDim2.new(1, 0, math.clamp((s:FindFirstChild("Stamina") and s.Stamina.Value or 0) / 100, 0, 1), 0)
                    end

                    for _, obj in ipairs(Debris_Variables.Function_Variables.createESP.espData) do
                        obj.gui.Enabled = Debris_Variables.ESP_Features.espEnabled and Debris_Variables.ESP_Features.espFeatures[obj.feature]
                    end
                end
            end)
        end

        if plr.Character then
            onCharacterAdded(plr.Character)
        end
        plr.CharacterAdded:Connect(onCharacterAdded)

        Debris_Variables.ESP_Features.espObjects[plr] = Debris_Variables.Function_Variables.createESP.espData
    end
    Function_Storage.warpBallToGoal = function()
        Debris_Variables.Function_Variables.warpBallToGoal.ball = Function_Storage.GetBall()
        if Debris_Variables.Function_Variables.warpBallToGoal.ball then
            -- Find the goal based on the player's team
            local goal
            if player.Team and player.Team.Name == "Home" then
                goal = workspace.Goals.Home -- Warp ball to the opponent's goal
            elseif player.Team and player.Team.Name == "Away" then
                goal = workspace.Goals.Away -- Warp ball to the opponent's goal
            end

            if goal then
                Debris_Variables.Function_Variables.warpBallToGoal.ball.CFrame = goal.CFrame + Vector3.new(0, 1, 0) -- Warp ball directly to the goal's position with slight offset
            end
        end
    end
    Function_Storage.autoHop = function()
        local v = getgenv().Settings
        while v.AutoHopToggle do
            local t = tonumber(v.AutoHopThresholdInput) or 4
            if #game:GetService("Players"):GetPlayers() <= t then
                local s, p, sId = game:GetService("TeleportService"), game.JobId, game.PlaceId
                local g = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. sId .. "/servers/Public?sortOrder=Asc&limit=100"))
                for _, d in ipairs(g.data) do
                    if d.id ~= p and d.playing < d.maxPlayers then
                        game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
                            if state == Enum.TeleportState.Started then
                                queue_on_teleport([[loadstring(game:HttpGet(""))()]]) -- ใส่ลิงก์โหลดสคริปต์ใหม่
                            end
                        end)
                        s:TeleportToPlaceInstance(sId, d.id, game:GetService("Players").LocalPlayer)
                        return
                    end
                end
                task.wait(3)
            end
            task.wait(1)
        end
    end
    Function_Storage.getRandomTargetCFrame = function(team)
        if team == "Home" then
            return goalCFrames.Away[math.random(1, #goalCFrames.Away)]
        elseif team == "Away" then
            return goalCFrames.Home[math.random(1, #goalCFrames.Home)]
        end
    end
    Function_Storage.KaiserShoot = function(ball, startPos, targetCF, height, duration, curveIntensity)
        local startTime = tick()
        local connection
        local endPos = targetCF.Position
        connection = Services.RunServices.RenderStepped:Connect(function()
            local elapsed = tick() - startTime
            if elapsed > duration then
                ball.CFrame = targetCF
                connection:Disconnect()
                return
            end
    
            local t = elapsed / duration
            local currentXZ = startPos:Lerp(endPos, t)
            local arcHeight = math.sin(t * math.pi) * height
            local curve = math.sin(t * math.pi * curveIntensity) * 15 
    
            ball.CFrame = CFrame.new(currentXZ.X + curve, startPos.Y + arcHeight, currentXZ.Z)
        end)
    end
    Function_Storage.CurveShoot = function(ball, startPos, targetCF, height, duration, curveIntensity)
        local startTime = tick()
        local connection
        local endPos = targetCF.Position
        
        local curveDirection = math.random(0, 1) == 0 and -1 or 1
        
        connection = Services.RunServices.RenderStepped:Connect(function()
            local elapsed = tick() - startTime
            if elapsed > duration then
                ball.CFrame = targetCF
                connection:Disconnect()
                return
            end
    
            local t = elapsed / duration
            local lerpPos = startPos:Lerp(endPos, t)
    
            -- ใช้ sin และ cos เพื่อทำให้วิถีการเคลื่อนที่เป็นวงกลม (เส้นวงแหวน)
            local angle = t * math.pi * 2 * curveIntensity -- ควบคุมความเร็วการหมุน
            local radius = 10 -- กำหนดรัศมีของวงแหวน
            
            local horizontalOffset = math.cos(angle) * radius
            local verticalOffset = math.sin(angle) * radius
    
            -- เพิ่มความสูงให้ลูกลอยขึ้นไปก่อนตกลงมาแบบโค้ง
            local arcHeight = math.sin(t * math.pi) * height
    
            -- หมุนรอบตัวเอง
            local spinEffect = math.rad(t * 360 * 4) -- หมุนเร็วขึ้น
    
            -- ปรับตำแหน่งลูกบอลให้เคลื่อนที่เป็นวงแหวน
            ball.CFrame = CFrame.new(
                lerpPos.X + horizontalOffset,  -- หมุนซ้ายขวาเป็นวงกลม
                startPos.Y + arcHeight + verticalOffset, -- ให้วิถีอยู่ในแนวโค้ง
                lerpPos.Z
            ) * CFrame.Angles(0, spinEffect, 0) -- หมุนรอบตัวเอง
        end)
    end
    Function_Storage.teleportBallToGoalKaiser = function()
        local ball = Function_Storage.GetBall()
        if ball and ball.Position then
            print("Ball Position:", ball.Position)
            local team = player.Team and player.Team.Name
            if team then
                local startPos = ball.Position
                local targetCFrame = Function_Storage.getRandomTargetCFrame(team)
                if targetCFrame then
                    Function_Storage.KaiserShoot(ball, startPos, targetCFrame, 40, 1, 5)
                end
            end
        else
            warn("Failed to retrieve ball object")
        end
    end
    Function_Storage.teleportBallToGoalCurve = function()
        local ball = Function_Storage.GetBall()
        if ball and ball.Position then
            print("Ball Position:", ball.Position)
            local team = player.Team and player.Team.Name
            if team then
                local startPos = ball.Position
                local targetCFrame = Function_Storage.getRandomTargetCFrame(team)
                if targetCFrame then
                    Function_Storage.CurveShoot(ball, startPos, targetCFrame, 40, 1.5, 5)
                end
            end
        else
            warn("Failed to retrieve ball object")
        end
    end
    Function_Storage.CreateFeariseHubMobileToggle = function()
        local feariseHubMobile = Instance.new("ScreenGui")
        feariseHubMobile.Name = "FeariseHubMobile"
        feariseHubMobile.IgnoreGuiInset = true
        feariseHubMobile.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
        feariseHubMobile.ResetOnSpawn = false
        feariseHubMobile.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        if protect_gui then
            feariseHubMobile.Parent = protect_gui(game:GetService("CoreGui"))
        elseif gethui then
            feariseHubMobile.Parent = gethui(game:GetService("CoreGui"))
        else
            feariseHubMobile.Parent = game:GetService("CoreGui")
        end

        local mainFrame = Instance.new("Frame")
        mainFrame.Name = "MainFrame"
        mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        mainFrame.BackgroundTransparency = 1
        mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        mainFrame.BorderSizePixel = 0
        mainFrame.Position = UDim2.fromScale(0.5, 0.5)
        mainFrame.Size = UDim2.fromScale(1, 1)

        local uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        uIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
        uIAspectRatioConstraint.AspectRatio = 1.78
        uIAspectRatioConstraint.Parent = mainFrame

        local instantKick = Instance.new("ImageButton")
        instantKick.Name = "InstantKick"
        instantKick.Image = "rbxassetid://100284446653174"
        instantKick.AnchorPoint = Vector2.new(0.5, 0.5)
        instantKick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        instantKick.BackgroundTransparency = 1
        instantKick.BorderColor3 = Color3.fromRGB(0, 0, 0)
        instantKick.BorderSizePixel = 0
        instantKick.Position = UDim2.fromScale(0.954, 0.725)
        instantKick.Size = UDim2.fromScale(0.124, 0.124)
        instantKick.SizeConstraint = Enum.SizeConstraint.RelativeYY

        local buttonName = Instance.new("TextLabel")
        buttonName.Name = "ButtonName"
        buttonName.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontWeight.ExtraBold,
        Enum.FontStyle.Normal
        )
        buttonName.Text = "Instant Kick"
        buttonName.TextColor3 = Color3.fromRGB(255, 255, 255)
        buttonName.TextScaled = true
        buttonName.TextSize = 14
        buttonName.TextWrapped = true
        buttonName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        buttonName.BackgroundTransparency = 1
        buttonName.BorderColor3 = Color3.fromRGB(0, 0, 0)
        buttonName.BorderSizePixel = 0
        buttonName.Position = UDim2.fromScale(-0.215, 0.33)
        buttonName.Size = UDim2.fromScale(1.4, 0.449)
        buttonName.ZIndex = 2

        local uIStroke = Instance.new("UIStroke")
        uIStroke.Name = "UIStroke"
        uIStroke.Thickness = 3
        uIStroke.Transparency = 0.5
        uIStroke.Parent = buttonName

        local uIPadding = Instance.new("UIPadding")
        uIPadding.Name = "UIPadding"
        uIPadding.PaddingBottom = UDim.new(0.00668, 0)
        uIPadding.PaddingLeft = UDim.new(0.223, 0)
        uIPadding.PaddingRight = UDim.new(0.223, 0)
        uIPadding.PaddingTop = UDim.new(0.00668, 0)
        uIPadding.Parent = buttonName

        buttonName.Parent = instantKick

        instantKick.Parent = mainFrame

        local kaiserImpack = Instance.new("ImageButton")
        kaiserImpack.Name = "KaiserImpack"
        kaiserImpack.Image = "rbxassetid://100284446653174"
        kaiserImpack.AnchorPoint = Vector2.new(0.5, 0.5)
        kaiserImpack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        kaiserImpack.BackgroundTransparency = 1
        kaiserImpack.BorderColor3 = Color3.fromRGB(0, 0, 0)
        kaiserImpack.BorderSizePixel = 0
        kaiserImpack.Position = UDim2.fromScale(0.903, 0.846)
        kaiserImpack.Size = UDim2.fromScale(0.124, 0.124)
        kaiserImpack.SizeConstraint = Enum.SizeConstraint.RelativeYY

        local buttonName1 = Instance.new("TextLabel")
        buttonName1.Name = "ButtonName"
        buttonName1.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontWeight.ExtraBold,
        Enum.FontStyle.Normal
        )
        buttonName1.Text = "Kaiser Impack"
        buttonName1.TextColor3 = Color3.fromRGB(255, 255, 255)
        buttonName1.TextScaled = true
        buttonName1.TextSize = 14
        buttonName1.TextWrapped = true
        buttonName1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        buttonName1.BackgroundTransparency = 1
        buttonName1.BorderColor3 = Color3.fromRGB(0, 0, 0)
        buttonName1.BorderSizePixel = 0
        buttonName1.Position = UDim2.fromScale(-0.215, 0.33)
        buttonName1.Size = UDim2.fromScale(1.4, 0.449)
        buttonName1.ZIndex = 2

        local uIStroke1 = Instance.new("UIStroke")
        uIStroke1.Name = "UIStroke"
        uIStroke1.Thickness = 3
        uIStroke1.Transparency = 0.5
        uIStroke1.Parent = buttonName1

        local uIPadding1 = Instance.new("UIPadding")
        uIPadding1.Name = "UIPadding"
        uIPadding1.PaddingBottom = UDim.new(0.00668, 0)
        uIPadding1.PaddingLeft = UDim.new(0.223, 0)
        uIPadding1.PaddingRight = UDim.new(0.223, 0)
        uIPadding1.PaddingTop = UDim.new(0.00668, 0)
        uIPadding1.Parent = buttonName1

        buttonName1.Parent = kaiserImpack

        kaiserImpack.Parent = mainFrame

        local curveShotProMax = Instance.new("ImageButton")
        curveShotProMax.Name = "CurveShotProMax"
        curveShotProMax.Image = "rbxassetid://100284446653174"
        curveShotProMax.AnchorPoint = Vector2.new(0.5, 0.5)
        curveShotProMax.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        curveShotProMax.BackgroundTransparency = 1
        curveShotProMax.BorderColor3 = Color3.fromRGB(0, 0, 0)
        curveShotProMax.BorderSizePixel = 0
        curveShotProMax.Position = UDim2.fromScale(0.786, 0.344)
        curveShotProMax.Size = UDim2.fromScale(0.124, 0.124)
        curveShotProMax.SizeConstraint = Enum.SizeConstraint.RelativeYY

        local buttonName2 = Instance.new("TextLabel")
        buttonName2.Name = "ButtonName"
        buttonName2.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontWeight.ExtraBold,
        Enum.FontStyle.Normal
        )
        buttonName2.Text = "Curve Shot"
        buttonName2.TextColor3 = Color3.fromRGB(255, 255, 255)
        buttonName2.TextScaled = true
        buttonName2.TextSize = 14
        buttonName2.TextWrapped = true
        buttonName2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        buttonName2.BackgroundTransparency = 1
        buttonName2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        buttonName2.BorderSizePixel = 0
        buttonName2.Position = UDim2.fromScale(-0.215, 0.33)
        buttonName2.Size = UDim2.fromScale(1.4, 0.449)
        buttonName2.ZIndex = 2

        local uIStroke2 = Instance.new("UIStroke")
        uIStroke2.Name = "UIStroke"
        uIStroke2.Thickness = 3
        uIStroke2.Transparency = 0.5
        uIStroke2.Parent = buttonName2

        local uIPadding2 = Instance.new("UIPadding")
        uIPadding2.Name = "UIPadding"
        uIPadding2.PaddingBottom = UDim.new(0.00668, 0)
        uIPadding2.PaddingLeft = UDim.new(0.223, 0)
        uIPadding2.PaddingRight = UDim.new(0.223, 0)
        uIPadding2.PaddingTop = UDim.new(0.00668, 0)
        uIPadding2.Parent = buttonName2

        buttonName2.Parent = curveShotProMax

        curveShotProMax.Parent = mainFrame

        local autoGK = Instance.new("ImageButton")
        autoGK.Name = "AutoGK"
        autoGK.Image = "rbxassetid://100284446653174"
        autoGK.AnchorPoint = Vector2.new(0.5, 0.5)
        autoGK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        autoGK.BackgroundTransparency = 1
        autoGK.BorderColor3 = Color3.fromRGB(0, 0, 0)
        autoGK.BorderSizePixel = 0
        autoGK.Position = UDim2.fromScale(0.0837, 0.315)
        autoGK.Size = UDim2.fromScale(0.124, 0.124)
        autoGK.SizeConstraint = Enum.SizeConstraint.RelativeYY

        local buttonName3 = Instance.new("TextLabel")
        buttonName3.Name = "ButtonName"
        buttonName3.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontWeight.ExtraBold,
        Enum.FontStyle.Normal
        )
        buttonName3.Text = "AutoGK Toggle"
        buttonName3.TextColor3 = Color3.fromRGB(255, 255, 255)
        buttonName3.TextScaled = true
        buttonName3.TextSize = 14
        buttonName3.TextWrapped = true
        buttonName3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        buttonName3.BackgroundTransparency = 1
        buttonName3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        buttonName3.BorderSizePixel = 0
        buttonName3.Position = UDim2.fromScale(-0.215, 0.33)
        buttonName3.Size = UDim2.fromScale(1.4, 0.449)
        buttonName3.ZIndex = 2

        local uIStroke3 = Instance.new("UIStroke")
        uIStroke3.Name = "UIStroke"
        uIStroke3.Thickness = 3
        uIStroke3.Transparency = 0.5
        uIStroke3.Parent = buttonName3

        local uIPadding3 = Instance.new("UIPadding")
        uIPadding3.Name = "UIPadding"
        uIPadding3.PaddingBottom = UDim.new(0.00668, 0)
        uIPadding3.PaddingLeft = UDim.new(0.223, 0)
        uIPadding3.PaddingRight = UDim.new(0.223, 0)
        uIPadding3.PaddingTop = UDim.new(0.00668, 0)
        uIPadding3.Parent = buttonName3

        buttonName3.Parent = autoGK

        autoGK.Parent = mainFrame

        local hitBox = Instance.new("ImageButton")
        hitBox.Name = "HitBox"
        hitBox.Image = "rbxassetid://100284446653174"
        hitBox.AnchorPoint = Vector2.new(0.5, 0.5)
        hitBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        hitBox.BackgroundTransparency = 1
        hitBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
        hitBox.BorderSizePixel = 0
        hitBox.Position = UDim2.fromScale(0.0837, 0.465)
        hitBox.Size = UDim2.fromScale(0.124, 0.124)
        hitBox.SizeConstraint = Enum.SizeConstraint.RelativeYY

        local buttonName4 = Instance.new("TextLabel")
        buttonName4.Name = "ButtonName"
        buttonName4.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontWeight.ExtraBold,
        Enum.FontStyle.Normal
        )
        buttonName4.Text = "HitBox Toggle"
        buttonName4.TextColor3 = Color3.fromRGB(255, 255, 255)
        buttonName4.TextScaled = true
        buttonName4.TextSize = 14
        buttonName4.TextWrapped = true
        buttonName4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        buttonName4.BackgroundTransparency = 1
        buttonName4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        buttonName4.BorderSizePixel = 0
        buttonName4.Position = UDim2.fromScale(-0.215, 0.33)
        buttonName4.Size = UDim2.fromScale(1.4, 0.449)
        buttonName4.ZIndex = 2

        local uIStroke4 = Instance.new("UIStroke")
        uIStroke4.Name = "UIStroke"
        uIStroke4.Thickness = 3
        uIStroke4.Transparency = 0.5
        uIStroke4.Parent = buttonName4

        local uIPadding = Instance.new("UIPadding")
        uIPadding.Name = "UIPadding"
        uIPadding.PaddingBottom = UDim.new(0.00668, 0)
        uIPadding.PaddingLeft = UDim.new(0.223, 0)
        uIPadding.PaddingRight = UDim.new(0.223, 0)
        uIPadding.PaddingTop = UDim.new(0.00668, 0)
        uIPadding.Parent = buttonName4

        buttonName4.Parent = hitBox

        hitBox.Parent = mainFrame

        mainFrame.Parent = feariseHubMobile

        local ToggleList = {
            feariseHubMobileUI = feariseHubMobile,
            instantKickToggle = instantKick,
            kaiserImpackToggle = kaiserImpack,
            curveShotProMaxToggle = curveShotProMax,
            autoGKToggle = autoGK,
            hitBoxToggle = hitBox
        }

        return ToggleList
    end
    
    -------------------------------------------------------[[ CONNECTION ]]-------------------------------------------------------
    player.CharacterAdded:Connect(function(newCharacter)
        character = newCharacter
        humanoid = newCharacter:FindFirstChild("Humanoid") or newCharacter:WaitForChild("Humanoid", 9e99)
        humanoidrootpart = newCharacter:FindFirstChild("HumanoidRootPart") or newCharacter:WaitForChild("HumanoidRootPart", 9e99)
    end)
    for _, v in pairs(Services.Players:GetPlayers()) do
        Function_Storage.createESP(v)
    end
    Services.Players.PlayerAdded:Connect(Function_Storage.createESP)


    -------------------------------------------------------[[ SCRIPT WORKING ]]-------------------------------------------------------
    -------------------------------------------------------[[ LEGITS SCRIPT ]]-------------------------------------------------------
    
    WalkSpeedToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.WalkSpeedToggle = WalkSpeedToggle.Value
            SaveSetting()
            if WalkSpeedToggle.Value then
                Debris_Variables.WalkSpeedToggle.WalkSpeedConnect = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                    if humanoid.WalkSpeed ~= getgenv().Settings.WalkSpeedInput then
                        humanoid.WalkSpeed = getgenv().Settings.WalkSpeedInput
                    end
                end)
    
                task.spawn(function()
                    while WalkSpeedToggle.Value do
                        task.wait(0.1)
                        if humanoid.WalkSpeed ~= getgenv().Settings.WalkSpeedInput then
                            humanoid.WalkSpeed = getgenv().Settings.WalkSpeedInput
                        end
                    end
    
                    if Debris_Variables.WalkSpeedToggle.WalkSpeedConnect then
                        Debris_Variables.WalkSpeedToggle.WalkSpeedConnect:Disconnect()
                        Debris_Variables.WalkSpeedToggle.WalkSpeedConnect = nil
                    end
                end)
            else
                if Debris_Variables.WalkSpeedToggle.WalkSpeedConnect then
                    Debris_Variables.WalkSpeedToggle.WalkSpeedConnect:Disconnect()
                    Debris_Variables.WalkSpeedToggle.WalkSpeedConnect = nil
                end
            end
        end)
    end)
    JumpPowerToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.JumpPowerToggle = JumpPowerToggle.Value
            SaveSetting()
            while JumpPowerToggle.Value do
                task.wait()
                humanoid.UseJumpPower = true
                humanoid.JumpPower = getgenv().Settings.JumpPowerInput
            end
            task.wait(.1)
            if not JumpPowerToggle.Value then
                humanoid.JumpPower = 50
            end
        end)
    end)
    HitboxToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.HitboxToggle = HitboxToggle.Value
            SaveSetting()
            while HitboxToggle.Value do
                task.wait()
                Debris_Variables.HitboxToggle.FootBall = Function_Storage.GetBall()
                Debris_Variables.HitboxToggle.HitBox = Debris_Variables.HitboxToggle.FootBall:FindFirstChild("Hitbox")
                Debris_Variables.HitboxToggle.Char = Debris_Variables.HitboxToggle.FootBall:FindFirstChild("Char")
                if Debris_Variables.HitboxToggle.HitBox:IsA("Part") and Debris_Variables.HitboxToggle.HitBox then
                    Function_Storage.UpdateHitboxSize(Debris_Variables.HitboxToggle.HitBox, 0.5, getgenv().Settings.HitboxInput)
                end
                -- if Debris_Variables.HitboxToggle.FootBall and Debris_Variables.HitboxToggle.FootBall.Parent == Services.Workspace then
                --     if Debris_Variables.HitboxToggle.Char.Value ~= character then
                --         if Debris_Variables.HitboxToggle.HitBox:IsA("Part") and Debris_Variables.HitboxToggle.HitBox then
                --             Function_Storage.UpdateHitboxSize(Debris_Variables.HitboxToggle.HitBox, 0.5, getgenv().Settings.HitboxInput)
                --         end
                --     else
                --         if Debris_Variables.HitboxToggle.HitBox:IsA("Part") and Debris_Variables.HitboxToggle.HitBox then
                --             Function_Storage.UpdateHitboxSize(Debris_Variables.HitboxToggle.HitBox, 1, 2.5)
                --         end
                --     end
                -- else
                --     if Debris_Variables.HitboxToggle.Char.Value ~= character then
                --         if Debris_Variables.HitboxToggle.HitBox:IsA("Part") and Debris_Variables.HitboxToggle.HitBox then
                --             Function_Storage.UpdateHitboxSize(Debris_Variables.HitboxToggle.HitBox, 0.5, getgenv().Settings.HitboxInput)
                --         end
                --     else
                --         if Debris_Variables.HitboxToggle.HitBox:IsA("Part") and Debris_Variables.HitboxToggle.HitBox then
                --             Function_Storage.UpdateHitboxSize(Debris_Variables.HitboxToggle.HitBox, 1, 2.5)
                --         end
                --     end
                -- end
            end
            task.wait(.1)
            if not HitboxToggle.Value and Debris_Variables.HitboxToggle.HitBox then
                Function_Storage.UpdateHitboxSize(Debris_Variables.HitboxToggle.HitBox, 1, 2.5)
            end
        end)
    end)
    HitboxKeybind:OnClick(function()
        task.spawn(function()
            Debris_Variables.HitboxKeybind.State = not HitboxToggle.Value
            HitboxToggle:SetValue(Debris_Variables.HitboxKeybind.State)
        end)
    end)
    AutoDribble:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.AutoDribble = AutoDribble.Value
            SaveSetting()
        end)
    end)
    Services.RunServices.Heartbeat:Connect(function()
        if not AutoDribble.Value then return end

        local animationController = Services.ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AnimatonController")
        local slideAnimation = animationController:WaitForChild("Isagi")

        local animator = humanoid:FindFirstChildOfClass("Animator")
        if not animator then
            animator = Instance.new("Animator")
            animator.Parent = humanoid
        end

        local animationTrack = animator:LoadAnimation(slideAnimation)

        for DribbleIndex, DribbleValue in pairs(workspace:GetChildren()) do
            if DribbleValue:IsA("Model") and DribbleValue ~= character and DribbleValue:FindFirstChild("Values") then
                local TargetHumanoidRootPart = DribbleValue:FindFirstChild("HumanoidRootPart")
                local TargetValue = DribbleValue:FindFirstChild("Values")
                local Distance = (TargetHumanoidRootPart.Position - humanoidrootpart.Position).Magnitude
                if Distance <= 20 and TargetValue.Sliding.Value then
                    Remotes.Dribble:FireServer()
                    if character.Values.Dribbling.Value then
                        animationTrack:Play()
                    end
                end
            end
        end

        -- for PlayerIndex, PlayerValue in pairs(Debris_Variables.AutoDribble.tracked) do
        --     if PlayerIndex and PlayerIndex:FindFirstChild("HumanoidRootPart") then
        --         Debris_Variables.AutoDribble.TargetPlayer = Services.Players:FindFirstChild(PlayerIndex.Name)
        --         if Debris_Variables.AutoDribble.TargetPlayer and Debris_Variables.AutoDribble.TargetPlayer.Team == player.Team then wait() end

        --         Debris_Variables.AutoDribble.Distance = (humanoidrootpart.Position - PlayerIndex.HumanoidRootPart.Position).Magnitude
        --         Debris_Variables.AutoDribble.Sliding = PlayerIndex:FindFirstChild("Values") and PlayerIndex.Values:FindFirstChild("Sliding")
        --         Debris_Variables.AutoDribble.isSliding = Debris_Variables.AutoDribble.Sliding and Debris_Variables.AutoDribble.Sliding.Value

        --         for SlideIndex, SlideValue in pairs(PlayerIndex:GetChildren()) do
        --             if SlideValue.Name:match("^Slide%d+$") or Debris_Variables.AutoDribble.isSliding then
        --                 if Debris_Variables.AutoDribble.Distance <= 20 and not data.inside then
        --                     if Function_Storage.triggerQ(PlayerIndex) then
        --                         Debris_Variables.AutoDribble.tracked[PlayerIndex].inside = true
        --                     end
        --                 elseif Debris_Variables.AutoDribble.Distance > 20 then
        --                     Debris_Variables.AutoDribble.tracked[PlayerIndex].inside = false
        --                 end
        --                 break
        --             end
        --         end
        --     end
        -- end
    end)
    vipToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.vipToggle = vipToggle.Value
            SaveSetting()

            Debris_Variables.vipToggle.hasVIP = player:FindFirstChild("HasVIP")

            if Debris_Variables.vipToggle.hasVIP then
                Debris_Variables.vipToggle.hasVIP.Value = vipToggle.Value
                if vipToggle.Value then
                    Fluent:Notify({
                        Title = "VIP Activated",
                        Content = "You are now a VIP! Enjoy your perks!",
                        Duration = 3
                    })
                else
                    Fluent:Notify({
                        Title = "VIP Deactivated",
                        Content = "VIP status disabled. You lost your perks.",
                        Duration = 3
                    })
                end
            else
                Fluent:Notify({
                    Title = "Error",
                    Content = "Could not find the 'HasVIP' property Try Again.",
                    Duration = 3
                })
                vipToggle:SetValue(false)
            end
        end)
    end)
    InstantKickKeybind:OnClick(function()
        task.spawn(function()
            Function_Storage.shootBall()
        end)
    end)

    -------------------------------------------------------[[ VISUAL SCRIPT ]]-------------------------------------------------------
    espToggle:OnChanged(function()
        Debris_Variables.ESP_Features.espEnabled = espToggle.Value
        getgenv().Settings.espToggle = espToggle.Value
        SaveSetting()
        task.spawn(function()
            for _, data in pairs(Debris_Variables.ESP_Features.espObjects) do
                for _, obj in ipairs(data) do
                    obj.gui.Enabled = Debris_Variables.ESP_Features.espEnabled and Debris_Variables.ESP_Features.espFeatures[obj.feature]
                end
            end
        end)
    end)
    espStyleToggle:OnChanged(function()
        task.spawn(function()
            Debris_Variables.ESP_Features.espFeatures["Style"] = espStyleToggle.Value
            getgenv().Settings.espStyleToggle = espStyleToggle.Value
            SaveSetting()
            for _, data in pairs(Debris_Variables.ESP_Features.espObjects) do
                for _, obj in ipairs(data) do
                    if obj.feature == "Style" then
                        obj.gui.Enabled = Debris_Variables.ESP_Features.espEnabled and Debris_Variables.ESP_Features.espFeatures["Style"]
                    end
                end
            end
        end)
    end)
    espAwakeningToggle:OnChanged(function()
        task.spawn(function()
            Debris_Variables.ESP_Features.espFeatures["Awakening"] = espAwakeningToggle.Value
            getgenv().Settings.espAwakeningToggle = espAwakeningToggle.Value
            SaveSetting()
            for _, data in pairs(Debris_Variables.ESP_Features.espObjects) do
                for _, obj in ipairs(data) do
                    if obj.feature == "Awakening" then
                        obj.gui.Enabled = Debris_Variables.ESP_Features.espEnabled and Debris_Variables.ESP_Features.espFeatures["Awakening"]
                    end
                end
            end
        end)
    end)
    espFlowToggle:OnChanged(function()
        task.spawn(function()
            Debris_Variables.ESP_Features.espFeatures["Flow"] = espFlowToggle.Value
            getgenv().Settings.espFlowToggle = espFlowToggle.Value
            SaveSetting()
            for _, data in pairs(Debris_Variables.ESP_Features.espObjects) do
                for _, obj in ipairs(data) do
                    if obj.feature == "Flow" then
                        obj.gui.Enabled = Debris_Variables.ESP_Features.espEnabled and Debris_Variables.ESP_Features.espFeatures["Flow"]
                    end
                end
            end
        end)
    end)
    espStaminaToggle:OnChanged(function()
        task.spawn(function()
            Debris_Variables.ESP_Features.espFeatures["Stamina"] = espStaminaToggle.Value
            getgenv().Settings.espStaminaToggle = espStaminaToggle.Value
            SaveSetting()
            for _, data in pairs(Debris_Variables.ESP_Features.espObjects) do
                for _, obj in ipairs(data) do
                    if obj.feature == "Stamina" then
                        obj.gui.Enabled = Debris_Variables.ESP_Features.espEnabled and Debris_Variables.ESP_Features.espFeatures["Stamina"]
                    end
                end
            end
        end)
    end)
    BallPredicToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.BallPredicToggle = BallPredicToggle.Value
            SaveSetting()
        end)
    end)
    getgenv().SettingsRay = {
        ["RayColor"] = Color3.new(1, 0, 0), -- สีของเส้น (แดง)
        ["RayThickness"] = 0.2, -- ความหนาของเส้น
        ["TweenSpeed"] = 0.0001 -- ความเร็วของ Tween
    }  

    function getballs()
        for _, v in pairs(workspace:GetChildren()) do
            if v.Name == "Football" and v:FindFirstChild("Hitbox") then
                return v
            end
        end
        return nil
    end
    
    function updateBall()
        if not getgenv().Settings.BallPredicToggle then return end -- ถ้า Toggle ปิด ไม่ต้องอัปเดตบอล
    
        local newBall = getballs()
        if newBall and newBall ~= Debris_Variables.Raycast.ball then
            Debris_Variables.Raycast.ball = newBall
            Debris_Variables.Raycast.lastPosition = Debris_Variables.Raycast.ball.Position
        end
    end
    
    function createRayPart()
        if not Debris_Variables.Raycast.rayPart then
            Debris_Variables.Raycast.rayPart = Instance.new("Part")
            Debris_Variables.Raycast.rayPart.Anchored = true
            Debris_Variables.Raycast.rayPart.CanCollide = false
            Debris_Variables.Raycast.rayPart.Material = Enum.Material.Neon
            Debris_Variables.Raycast.rayPart.Color = getgenv().SettingsRay["RayColor"]
            Debris_Variables.Raycast.rayPart.Size = Vector3.new(getgenv().SettingsRay["RayThickness"], getgenv().SettingsRay["RayThickness"], 1)
            Debris_Variables.Raycast.rayPart.Parent = workspace
        end
    end
    
    function predictBallPath()
        if not getgenv().Settings.BallPredicToggle then
            if Debris_Variables.Raycast.rayPart then
                Debris_Variables.Raycast.rayPart.Transparency = 1 -- ซ่อนเส้นเมื่อปิด Toggle
            end
            return
        end
    
        if not Debris_Variables.Raycast.ball then return end
    
        local velocity = Debris_Variables.Raycast.ball.Velocity
        local currentPosition = Debris_Variables.Raycast.ball.Position
        local movementAmount = (currentPosition - Debris_Variables.Raycast.lastPosition).Magnitude
    
        -- ตรวจสอบว่าบอลกำลังเคลื่อนที่หรือไม่
        if velocity.Magnitude < Debris_Variables.Raycast.VELOCITY_THRESHOLD or movementAmount < Debris_Variables.Raycast.MOVEMENT_THRESHOLD then
            if Debris_Variables.Raycast.rayPart then
                -- ถ้าบอลช้ามาก ปรับขนาดเส้นให้เล็กลง แทนที่จะซ่อน
                local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local tweenGoal = {Size = Vector3.new(getgenv().SettingsRay["RayThickness"], getgenv().SettingsRay["RayThickness"], 0.1)}
                if Debris_Variables.Raycast.tween then Debris_Variables.Raycast.tween:Cancel() end
                Debris_Variables.Raycast.tween = Services.TweenService:Create(Debris_Variables.Raycast.rayPart, tweenInfo, tweenGoal)
                Debris_Variables.Raycast.tween:Play()
            end
            return
        end
    
        -- สร้างเส้นถ้ายังไม่มี
        createRayPart()
    
        local position = currentPosition
        local lastPos = position
        local endPos = position
    
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {Debris_Variables.Raycast.ball}
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    
        for t = 0, Debris_Variables.Raycast.MAX_TIME, Debris_Variables.Raycast.TIME_STEP do
            local newPosition = position + velocity * t + Vector3.new(0, -0.5 * Debris_Variables.Raycast.GRAVITY * t^2, 0)
    
            local result = workspace:Raycast(lastPos, newPosition - lastPos, raycastParams)
            if result then
                endPos = result.Position
                break
            end
    
            lastPos = newPosition
            endPos = newPosition
        end
    
        -- อัปเดตตำแหน่งของเส้นด้วย Tween
        local distance = (endPos - Debris_Variables.Raycast.ball.Position).Magnitude
        local newSize = Vector3.new(getgenv().SettingsRay["RayThickness"], getgenv().SettingsRay["RayThickness"], distance)
        local newPosition = Debris_Variables.Raycast.ball.Position + (endPos - Debris_Variables.Raycast.ball.Position) / 2
        local newCFrame = CFrame.lookAt(newPosition, endPos)
    
        local tweenInfo = TweenInfo.new(getgenv().SettingsRay["TweenSpeed"], Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tweenGoal = {Size = newSize, Position = newPosition, CFrame = newCFrame}
    
        if Debris_Variables.Raycast.tween then Debris_Variables.Raycast.tween:Cancel() end
        Debris_Variables.Raycast.tween = Services.TweenService:Create(Debris_Variables.Raycast.rayPart, tweenInfo, tweenGoal)
        Debris_Variables.Raycast.tween:Play()
    
        -- แสดงเส้นตลอดเวลา
        Debris_Variables.Raycast.rayPart.Transparency = 0
    
        Debris_Variables.Raycast.lastPosition = currentPosition -- อัปเดตตำแหน่งล่าสุด
    end
    
    Services.RunServices.Stepped:Connect(function()
        updateBall()
    end)
    
    Services.RunServices.RenderStepped:Connect(predictBallPath)

    -------------------------------------------------------[[ KAITAN SCRIPT ]]-------------------------------------------------------
    AutoFarmTweenToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.AutoFarmTweenToggle = AutoFarmTweenToggle.Value
            SaveSetting()
            if AutoFarmTweenToggle.Value then
                task.spawn(function()
                    while AutoFarmTweenToggle.Value do
                        task.wait()
                        local function noclip()
                            for i, v in pairs(character:GetChildren()) do
                                if v:IsA("BasePart") and v.CanCollide == true then
                                    v.CanCollide = false
                                    humanoidrootpart.Velocity = Vector3.new(0,0,0)
                                end
                            end
                        end
        
                        local function Goto(Target, Goal, Action)
                            local NoClipConnect
                            local TweenService = game:GetService("TweenService")
                            local Distance = (humanoidrootpart.Position - Target.Position).Magnitude
                            local Speed = 80
                            local Tween = TweenService:Create(humanoidrootpart, TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {CFrame = Target})
                            NoClipConnect = game:GetService("RunService").Stepped:Connect(noclip)
                            Tween:Play()
                            local ActionActive = Action or "None"
                            if ActionActive == "Slide" then
                                Tween.Completed:Connect(function()
                                    if Distance < 3 then
                                        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Slide:FireServer()
                                    end
                                end)
                            elseif ActionActive == "Kick" then
                                Tween.Completed:Connect(function()
                                    local args = {
                                        [1] = 100,
                                        [4] = workspace.Goals[Goal].Position
                                    }
                                    game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(unpack(args))
                                    task.wait(.1)
                                    local Ball = workspace:FindFirstChild("Football") or workspace:WaitForChild("Football", 5)
                                    if Ball then
                                        repeat task.wait()
                                            Ball.CFrame = workspace.Goals[Goal].CFrame * CFrame.new(0, 0, 10)
                                            NoClipConnect:Disconnect()
                                        until Ball.CFrame == workspace.Goals[Goal].CFrame * CFrame.new(0, 0, 10)
                                    end
                                end)
                            end
                        end
        
                        function ClosestCharacter(originCharacter, searchInWorkspace)
                            local closestCharacter = nil
                            local shortestDistance = math.huge
                            
                            if not originCharacter or not originCharacter:FindFirstChild("HumanoidRootPart") then
                                return nil
                            end
                            
                            local originPosition = originCharacter.HumanoidRootPart.Position
        
                            local searchArea = searchInWorkspace or game.Workspace
        
                            for _, model in ipairs(searchArea:GetDescendants()) do
                                if model:IsA("Model") and model ~= originCharacter and model:FindFirstChild("Humanoid") and model:FindFirstChild("HumanoidRootPart") and model:FindFirstChild("Football") then
                                    local targetPosition = model.HumanoidRootPart.Position
                                    local distance = (originPosition - targetPosition).Magnitude
        
                                    if distance < shortestDistance then 
                                        shortestDistance = distance
                                        closestCharacter = model
                                    end
                                end
                            end
        
                            return closestCharacter
                        end
        
                        while AutoFarmTweenToggle.Value do
                            task.wait()
                            local Values = character:FindFirstChild("Values") or character:WaitForChild("Values", 5)
                            local HasBall = Values:FindFirstChild("HasBall") or Values:WaitForChild("HasBall", 5)
                            local Goal = {
                                ["Away"] = "Away",
                                ["Home"] = "Home"
                            }
                            if player.Team.Name == "Visitor" then
                                task.wait(.1)
                            else
                                if humanoidrootpart:FindFirstChild("Antifall") then
                                    if HasBall.Value then
                                        Goto(humanoidrootpart.CFrame * CFrame.new(0, 50, 0), Goal[game.Players.LocalPlayer.Team.Name], "Kick")
                                        task.wait(2)
                                    else
                                        if workspace:FindFirstChild("Football") then
                                            for BallIndex, BallValue in pairs(workspace:GetChildren()) do
                                                if BallValue.Name == "Football" and BallValue:FindFirstChild("Hitbox") then
                                                    Goto(BallValue.CFrame * CFrame.new(0, 3.5, 0), Goal[game.Players.LocalPlayer.Team.Name])
                                                end
                                            end
                                        else
                                            local Target = ClosestCharacter(character)
                                            local Ball = Target:FindFirstChild("Football") or Target:WaitForChild("Football")
        
                                            Goto(Ball.CFrame, Goal[game.Players.LocalPlayer.Team.Name], "Slide")
                                        end
                                    end
                                else
                                    local antifall = Instance.new("BodyVelocity", humanoidrootpart)
                                    antifall.P = 1250
                                    antifall.Velocity = Vector3.new(0, 0, 0)
                                    antifall.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                    antifall.Name = "Antifall"
                                end
                            end
                        end
                        task.wait(.1)
                        if not AutoFarmTweenToggle.Value then
                            for i, v in pairs(humanoidrootpart:GetChildren()) do
                                if v.Name == "Antifall" and v:IsA("BodyVelocity") then
                                    v:Destroy()
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end)
    AutoFarmTeleportToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.AutoFarmTeleportToggle = AutoFarmTeleportToggle.Value
            SaveSetting()
            if AutoFarmTeleportToggle.Value then
                task.spawn(function()
                    while AutoFarmTeleportToggle.Value do
                        task.wait()
                        function Goto(t, g, a)
                            humanoidrootpart.CFrame = t
                            if a == "Slide" then
                                game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Slide:FireServer()
                            elseif a == "Kick" then
                                game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(100, nil, nil, workspace.Goals[g].Position)
                                task.wait(.1)
                                local ball = workspace:FindFirstChild("Football") or workspace:WaitForChild("Football", 5)
                                if ball then
                                    repeat task.wait()
                                        ball.CFrame = workspace.Goals[g].CFrame * CFrame.new(0, 0, 10)
                                    until ball.CFrame == workspace.Goals[g].CFrame * CFrame.new(0, 0, 10)
                                end
                            end
                        end

                        function ClosestCharacter(o, w)
                            local c, d = nil, math.huge
                            if not o or not o:FindFirstChild("HumanoidRootPart") then return nil end
                            for _, m in ipairs((w or workspace):GetDescendants()) do
                                if m:IsA("Model") and m ~= o and m:FindFirstChild("Humanoid") and m:FindFirstChild("HumanoidRootPart") and m:FindFirstChild("Football") then
                                    local dist = (o.HumanoidRootPart.Position - m.HumanoidRootPart.Position).Magnitude
                                    if dist < d then c, d = m, dist end
                                end
                            end
                            return c
                        end

                        while AutoFarmTeleportToggle.Value do
                            task.wait()
                            local v = character:FindFirstChild("Values") or character:WaitForChild("Values", 5)
                            local h = v:FindFirstChild("HasBall") or v:WaitForChild("HasBall", 5)
                            local g = {["Away"] = "Away", ["Home"] = "Home"}
                            if player.Team.Name == "Visitor" then
                                task.wait(.1)
                            else
                                if humanoidrootpart:FindFirstChild("Antifall") then
                                    if h.Value then
                                        Goto(humanoidrootpart.CFrame * CFrame.new(0, 50, 0), g[player.Team.Name], "Kick")
                                        task.wait(2)
                                    else
                                        local b = workspace:FindFirstChild("Football")
                                        if b then
                                            for _, v in pairs(workspace:GetChildren()) do
                                                if v.Name == "Football" and v:FindFirstChild("Hitbox") then
                                                    Goto(v.CFrame * CFrame.new(0, 3.5, 0), g[player.Team.Name])
                                                end
                                            end
                                        else
                                            local t = ClosestCharacter(character)
                                            local b = t and t:FindFirstChild("Football") or t:WaitForChild("Football")
                                            if b then Goto(b.CFrame, g[player.Team.Name], "Slide") end
                                        end
                                    end
                                else
                                    local af = Instance.new("BodyVelocity", humanoidrootpart)
                                    af.P = 1250
                                    af.Velocity = Vector3.new(0, 0, 0)
                                    af.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                    af.Name = "Antifall"
                                end
                            end
                        end
                        task.wait(.1)
                        if not AutoFarmTeleportToggle.Value then
                            for _, v in pairs(humanoidrootpart:GetChildren()) do
                                if v.Name == "Antifall" and v:IsA("BodyVelocity") then
                                    v:Destroy()
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end)
    WhiteScreen:OnChanged(function()
        getgenv().Settings.WhiteScreen = WhiteScreen.Value
        SaveSetting()
        task.spawn(function()
            Services.RunServices:Set3dRenderingEnabled(not WhiteScreen.Value)
        end)
    end)
    AutoGoalKeeper:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.AutoGoalKeeper = AutoGoalKeeper.Value
            SaveSetting()
        end)
    end)
    AutoGKKeybind:OnClick(function()
        task.spawn(function()
            Debris_Variables.AutoGKKeybind.State = not AutoGoalKeeper.Value
            AutoGoalKeeper:SetValue(Debris_Variables.AutoGKKeybind.State)
        end)
    end)
    Services.RunServices.RenderStepped:Connect(function()
        if not AutoGoalKeeper.Value then return end
    
        Debris_Variables.AutoGKKeybind.ball = Function_Storage.GetBall()
        if not Debris_Variables.AutoGKKeybind.ball or not Debris_Variables.AutoGKKeybind.ball.Parent or Function_Storage.GetBallInPlayer() then return end
    
        Debris_Variables.AutoGKKeybind.Distance = (humanoidrootpart.Position - Debris_Variables.AutoGKKeybind.ball.Position).Magnitude
        if Debris_Variables.AutoGKKeybind.Distance > 3 and Debris_Variables.AutoGKKeybind.Distance <= 50 then
            humanoidrootpart.CFrame = CFrame.new(Debris_Variables.AutoGKKeybind.ball.Position)
            Remotes.Drive:FireServer()
        end
    end)
    AutoTeamToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.AutoTeamToggle = AutoTeamToggle.Value
            SaveSetting()
            while AutoTeamToggle.Value do
                -- ตรวจสอบว่าผู้เล่นอยู่ในทีม Visitor
                if player.Team and player.Team.Name == "Visitor" then
                    Remotes.TeamService.RE.Select:FireServer(unpack(string.split(getgenv().Settings.TeamPositionDropdown, "_")))
                end
        
                task.wait(3) -- รอ 3 วินาทีก่อนตรวจสอบใหม่
            end
        end)
    end)
    AutoTeamForAutoFarmToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.AutoTeamForAutoFarmToggle = AutoTeamForAutoFarmToggle.Value
            SaveSetting()
            while AutoTeamForAutoFarmToggle.Value do
                local Teams = {
                    "Home",
                    "Away"
                }
                local Position = {
                    "CF",
                    "LE",
                    "RW",
                    "CM",
                    "GK",
                }
                if player.Team and player.Team.Name == "Visitor" then
                    for _, team in ipairs(Teams) do
                        for _, position in ipairs(Position) do
                            Remotes.TeamService.RE.Select:FireServer(team, position)
                        end
                    end                    
                end
        
                task.wait(3) -- รอ 3 วินาทีก่อนตรวจสอบใหม่
            end
        end)
    end)
    InstantGoalToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.InstantGoalToggle = InstantGoalToggle.Value
            SaveSetting()
        end)
    end)
    Remotes.Shoot.OnClientEvent:Connect(function()
        if getgenv().Settings.InstantGoalToggle then
            Function_Storage.warpBallToGoal()
        end
    end)
    AutoHopToggle:OnChanged(function(v)
        getgenv().Settings.AutoHopToggle = v
        SaveSetting()
        if v then
            task.spawn(Function_Storage.autoHop)
        end
    end)

    -------------------------------------------------------[[ OP SCRIPT ]]-------------------------------------------------------
    KaiserToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.KaiserToggle = KaiserToggle.Value
            SaveSetting()
        end)
    end)
    Remotes.Shoot.OnClientEvent:Connect(function()
        if getgenv().Settings.KaiserToggle then
            Function_Storage.teleportBallToGoalKaiser()
        end
    end)
    KaiserKeybide:OnClick(function()
        task.spawn(function()
            Debris_Variables.KaiserKeybide.State = not KaiserToggle.Value
            KaiserToggle:SetValue(Debris_Variables.KaiserKeybide.State)
        end)
    end)
    CurveShotProMaxToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.CurveShotProMaxToggle = CurveShotProMaxToggle.Value
            getgenv().Settings.CurveShotProMaxToggle = CurveShotProMaxToggle.Value
            SaveSetting()
        end)
    end)
    Remotes.Shoot.OnClientEvent:Connect(function()
        if getgenv().Settings.CurveShotProMaxToggle then
            Function_Storage.teleportBallToGoalCurve()
        end
    end)
    CurveShotProMaxKeybind:OnClick(function()
        task.spawn(function()
            Debris_Variables.CurveShotProMaxKeybind.State = not CurveShotProMaxToggle.Value
            CurveShotProMaxToggle:SetValue(Debris_Variables.CurveShotProMaxKeybind.State)
        end)
    end)
    NoCooldownStealToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.NoCooldownStealToggle = NoCooldownStealToggle.Value
            SaveSetting()
            if NoCooldownStealToggle.Value then   
                local originalSteal = require(game:GetService("ReplicatedStorage").Controllers.AbilityController.Abilities.Bachira.Steal)
                
                Debris_Variables.NoCooldownStealToggle.newSteal = function(v11, v12, v13)
                    -- ข้ามเงื่อนไขคูลดาวน์และพลังงาน
                    if false then -- ข้ามการตรวจสอบทุกอย่าง
                        return
                    end
                
                    if v11.ABC then
                        v11.ABC:Clean()
                    end
                    if v11.SlideTrove then
                        v11.SlideTrove:Destroy()
                    end
                
                    -- ส่วนสำหรับเมื่อผู้เล่นมีบอล
                    if v13.Values.HasBall.Value then
                        v11.AbilityController:AbilityCooldown("1", 1) -- ไม่มีคูลดาวน์
                        v11.StaminaService.DecreaseStamina:Fire(10) -- ไม่ลด Stamina
                        v11.StatesController.States.Ability = true
                        v11.StatesController.OwnWalkState = true
                        v11.StatesController.SpeedBoost = 5
                
                        task.delay(2, function()
                            v11.StatesController.States.Ability = false
                            v11.StatesController.OwnWalkState = false
                            v11.StatesController.SpeedBoost = 0
                        end)
                
                        v11.Animations:StopAnims()
                        v11.Animations.Abilities.HeelPass.Priority = Enum.AnimationPriority.Action3
                        v11.Animations.Abilities.HeelPass:Play()
                        v11.Animations.Ball.HeelPass.Priority = Enum.AnimationPriority.Action3
                        v11.Animations.Ball.HeelPass:Play()
                        v11.AbilityService.Ability:Fire("HeelPass")
                        v11.ABC:Connect(v11.AbilityService.Ability, function(v14)
                            v11.ABC:Clean()
                            v11.StatesController.States.Ability = false
                            v11.StatesController.OwnWalkState = false
                            v11.StatesController.SpeedBoost = 0
                            v14.AssemblyLinearVelocity = (v13.HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 0.55, 0)) * 80
                            v11.BallController:DragBall(v14)
                        end)
                    else
                        -- ส่วนสำหรับเมื่อผู้เล่นไม่มีบอล
                        v11.AbilityController:AbilityCooldown("1", 1) -- ไม่มีคูลดาวน์
                        v11.StaminaService.DecreaseStamina:Fire(10) -- ไม่ลด Stamina
                        v11.Animations:StopAnims()
                        v11.Animations.Abilities.Steal.Priority = Enum.AnimationPriority.Action
                        v11.Animations.Abilities.Steal:Play()
                
                        -- เรียกใช้ RemoteEvent "Slide" เพื่อ FireServer
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Slide:FireServer()
                
                        -- ใช้ TweenService แทนการพุ่งด้วย BodyVelocity
                        local rootPart = v13.HumanoidRootPart
                        if rootPart then
                            local targetPosition = rootPart.Position + (rootPart.CFrame.LookVector * 30) -- พุ่งไปข้างหน้า 10 หน่วย
                
                            local tweenInfo = TweenInfo.new(
                                0.4, -- ระยะเวลาพุ่ง (0.5 วินาที)
                                Enum.EasingStyle.Linear, -- รูปแบบการเคลื่อนไหวแบบ Linear
                                Enum.EasingDirection.Out, -- ทิศทางการเคลื่อนไหวแบบ Out
                                0, -- จำนวนรอบ (0 = ไม่ทำซ้ำ)
                                false, -- ไม่ย้อนกลับ
                                0 -- ไม่มีดีเลย์ก่อนเริ่ม Tween
                            )
                
                            local tweenGoal = {Position = targetPosition}
                            local tween = Services.TweenService:Create(rootPart, tweenInfo, tweenGoal)
                
                            tween:Play()
                
                            tween.Completed:Connect(function()
                                tween:Destroy() -- ลบ Tween หลังการใช้งาน
                            end)
                        end
                    end
                end
                
                -- แทนที่ฟังก์ชันใน ModuleScript
                hookfunction(originalSteal, Debris_Variables.NoCooldownStealToggle.newSteal)
                Fluent:Notify({ Title = "No Cooldown - Steal Enabled", Content = "Cooldown removed for Steal.", Duration = 3 })
            else
                Fluent:Notify({ Title = "No Cooldown - Steal Disabled", Content = "Cooldown restored for Steal.", Duration = 3 })
            end
        end)
    end)
    NoCooldownAirDribbleToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.NoCooldownAirDribbleToggle = NoCooldownAirDribbleToggle.Value
            SaveSetting()
            if NoCooldownAirDribbleToggle.Value then
                -- Hook the original AirDribble function
                local airdribbleModule = require(game:GetService("ReplicatedStorage").Controllers.AbilityController.Abilities.Nagi.AirDribble)
                
                -- Define the new function
                local function newAirDribble(v13, v14, v15)
                    if v13.__trapped then
                        if not v15.Values.HasBall.Value then
                            return
                        else
                            v14.PlayerGui.InGameUI.Bottom.Abilities["1"].Timer.Text = "Trap"
                            v13.Animations:StopAnims()
                            v13.Animations.Abilities.AirDribbleShoot.Priority = Enum.AnimationPriority.Action4
                            v13.Animations.Abilities.AirDribbleShoot:Play()
                            v13.Animations.Ball.AirDribbleShoot.Priority = Enum.AnimationPriority.Action4
                            v13.Animations.Ball.AirDribbleShoot:Play()
                            if v13.ABC then
                                v13.ABC:Clean()
                            end
                            v13.ABC:Add(function()
                                v13.__trapped = nil
                            end)
                            task.delay(0.35, function()
                                v13.AbilityService.Ability:Fire("AirDribble", "shotStart")
                            end)
                            v13.ABC:Add(v13.AbilityService.Ability:Connect(function(v16)
                                v16.AssemblyLinearVelocity = (workspace.CurrentCamera.CFrame.LookVector + Vector3.new(0, 0.35, 0)) * 125
                                v13.BallController:DragBall(v16)
                            end))
                            return
                        end
                    else
                        if v13.ABC then
                            v13.ABC:Clean()
                        end
                        v14.PlayerGui.InGameUI.Bottom.Abilities["1"].Timer.Text = "Shoot"
                        task.delay(0.45, function()
                            v13.InAbility = true
                        end)
                        local l_Value_0 = v15.Values.HasBall.Value
                        v15.HumanoidRootPart.Anchored = true
                        v13.AbilityService.Ability:Fire("AirDribble")
                        v13.Animations:StopAnims()
                        if l_Value_0 then
                            v13.Animations.Abilities.AirDribbleUp.Priority = Enum.AnimationPriority.Action2
                            v13.Animations.Abilities.AirDribbleUp:Play()
                            v13.Animations.Ball.AirDribbleUp.Priority = Enum.AnimationPriority.Action2
                            v13.Animations.Ball.AirDribbleUp:Play()
                            v13.Animations.Abilities.AirDribbleUp:AdjustSpeed(1.35)
                            v13.Animations.Ball.AirDribbleUp:AdjustSpeed(1.35)
                        end
                        v13.Animations.Ball.AirDribbleStart.Priority = Enum.AnimationPriority.Action3
                        v13.Animations.Ball.AirDribbleStart:Play()
                        v13.Animations.Ball.AirDribbleStart:AdjustSpeed(1.35)
                        v13.Animations.Abilities.AirDribbleStart.Priority = Enum.AnimationPriority.Action3
                        v13.Animations.Abilities.AirDribbleStart:Play()
                        v13.__trapped = true
                        v13.ABC:Add(function()
                            v13.__trapped = nil
                        end)
                        local v18 = os.time() + 4
                        task.delay(0.65, function()
                            v13.ABC:Connect(game:GetService("RunService").Heartbeat, function()
                                if v15 == nil then
                                    if v13.ABC then
                                        v13.ABC:Clean()
                                    end
                                    v13.InAbility = false
                                    return
                                else
                                    if v15.Values.HasBall.Value then
                                        l_Value_0 = true
                                    end
                                    if (v18 < os.time() or not v13.InAbility or not v15.Values.HasBall.Value and l_Value_0) and v13.ABC then
                                        v13.ABC:Clean()
                                    end
                                    return
                                end
                            end)
                        end)
                        v13.ABC:Add(function()
                            v14.PlayerGui.InGameUI.Bottom.Abilities["1"].Timer.Text = "Trap"
                            task.delay(0.15, function()
                                v15.HumanoidRootPart.Anchored = false
                            end)
                            v13.InAbility = false
                            v13.Animations.Abilities.AirDribbleStart:Stop()
                            v13.Animations.Ball.AirDribbleStart:Stop()
                        end)
                        return
                    end
                end
                
                -- Hook the function using hookfunction
                hookfunction(airdribbleModule, newAirDribble)
                Fluent:Notify({ Title = "No Cooldown - AirDribble Enabled", Content = "Cooldown removed for AirDribble.", Duration = 3 })
            else
                Fluent:Notify({ Title = "No Cooldown - AirDribble Disabled", Content = "Cooldown restored for AirDribble.", Duration = 3 })
            end
        end)
    end)
    NoCooldownAirDashToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.NoCooldownAirDashToggle = NoCooldownAirDashToggle.Value
            SaveSetting()
            if NoCooldownAirDashToggle.Value then
                local originalAirDash = require(game:GetService("ReplicatedStorage").Controllers.AbilityController.Abilities.Nagi.AirDash)
                
                local function newAirDash(v13, v14, v15)
                    if v13.ABC then
                        v13.ABC:Clean()
                    end
    
                    v15.HumanoidRootPart.Anchored = false
                    v13.Animations:StopAnims()
    
                    local hrp = v15.HumanoidRootPart
                    local dashDirection = hrp.CFrame:VectorToObjectSpace(v15.Humanoid.MoveDirection).X < 0 and "Left" or "Right"
                    local directionVector = dashDirection == "Right" and hrp.CFrame.RightVector or hrp.CFrame.RightVector * -1
    
                    v13.AbilityService.Ability:Fire("AirDash", directionVector)
                    v13.Animations.Abilities["AirDribble" .. dashDirection].Priority = Enum.AnimationPriority.Action4
                    v13.Animations.Abilities["AirDribble" .. dashDirection]:Play()
                    v13.Animations.Ball["AirDribble" .. dashDirection].Priority = Enum.AnimationPriority.Action4
                    v13.Animations.Ball["AirDribble" .. dashDirection]:Play()
                end
    
                hookfunction(originalAirDash, newAirDash)
                Fluent:Notify({ Title = "No Cooldown - AirDash Enabled", Content = "Cooldown removed for AirDash.", Duration = 3 })
            else
                Fluent:Notify({ Title = "No Cooldown - AirDash Disabled", Content = "Cooldown restored for AirDash.", Duration = 3 })
            end
        end)
    end)

    -------------------------------------------------------[[ RAGE SCRIPT ]]-------------------------------------------------------
    LagSwitchToggle:OnChanged(function()
        task.spawn(function()
            getgenv().Settings.LagSwitchToggle = LagSwitchToggle.Value
            SaveSetting()
            while LagSwitchToggle.Value do
                task.wait()
                local args = {
                    [1] = 1,
                    [4] = mouse
                }
                
                for i = 1, 400 do
                    spawn(function()
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(unpack(args))
                        task.wait(0.00001)
                    end)
                end
            end
        end)
    end)

    -------------------------------------------------------[[ SPIN SCRIPT ]]-------------------------------------------------------
    local ProfileStats = player:WaitForChild("ProfileStats")
    local PlayerStats = player:WaitForChild("PlayerStats")
    local Spins = ProfileStats:WaitForChild("Spins")
    local Money = ProfileStats:WaitForChild("Money")
    local FlowSpins = ProfileStats:WaitForChild("FlowSpins")
    local Style = PlayerStats:WaitForChild("Style")
    local Flow = PlayerStats:WaitForChild("Flow")
    AutoSpinToggle:OnChanged(function()
        task.spawn(function()
            while AutoSpinToggle.Value do
                -- Check if player has Spins and Money
                if Spins.Value > 0 or Money.Value > 2500 then
                    -- Check if the current style matches any selected style
                    if table.find(getgenv().Settings.StyleLockDropdown, Style.Value) then
                        Fluent:Notify({
                            Title = "Style Locked",
                            Content = "You obtained: " .. Style.Value,
                            Duration = 5
                        })
                        AutoSpinToggle:SetValue(false)
                        break
                    end

                    -- Fire the Spin Remote
                    game:GetService("ReplicatedStorage").Packages.Knit.Services.StyleService.RE.Spin:FireServer()
                    task.wait(0.5) -- Add a small delay to prevent spamming

                else
                    Fluent:Notify({
                        Title = "Auto Spin",
                        Content = "Insufficient Spins or Money.",
                        Duration = 5
                    })
                    AutoSpinToggle:SetValue(false)
                    break
                end
            end
        end)
    end)
    AutoFlowToggle:OnChanged(function()
        task.spawn(function()
            while AutoFlowToggle.Value do
                -- Check if player has Spins and Money
                if FlowSpins.Value > 0 or Money.Value >= 2000 then -- Adjusted Money value for spin cost
                    -- Check if the current style matches any selected style
                    if table.find(getgenv().Settings.FlowLockDropdown, Flow.Value) then
                        Fluent:Notify({
                            Title = "Flow Lock Activated",
                            Content = "You obtained: " .. Flow.Value,
                            Duration = 5
                        })
                        AutoFlowToggle:SetValue(false)
                        break
                    end

                    -- Fire the Spin Remote
                    game:GetService("ReplicatedStorage").Packages.Knit.Services.FlowService.RE.Spin:FireServer()
                    task.wait(0.5) -- Delay to prevent spamming

                else
                    Fluent:Notify({
                        Title = "Auto Flow Spin",
                        Content = "Insufficient Spins or Money.",
                        Duration = 5
                    })
                    AutoFlowToggle:SetValue(false)
                    break
                end
            end
        end)
    end)

    -------------------------------------------------------[[ MOBILE SCRIPT ]]-------------------------------------------------------
    function checkDeviceUi()
        local player = game.Players.LocalPlayer
        if player then
            local UserInputService = game:GetService("UserInputService")
            
            if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
                if getgenv().Configs["Mobile Mode"] then
                    local MobileUI = Function_Storage.CreateFeariseHubMobileToggle()

                    MobileUI.instantKickToggle.MouseButton1Click:Connect(function()
                        Function_Storage.shootBall()
                    end)
                    MobileUI.kaiserImpackToggle.MouseButton1Click:Connect(function()
                        Debris_Variables.KaiserKeybide.State = not KaiserToggle.Value
                        KaiserToggle:SetValue(Debris_Variables.KaiserKeybide.State)
                        if Debris_Variables.KaiserKeybide.State then
                            Fluent:Notify({
                                Title = "Fearise Hub",
                                Content = "Kaiser Impack Actived.",
                                Duration = 3
                            })
                        else
                            Fluent:Notify({
                                Title = "Fearise Hub",
                                Content = "Kaiser Impack Not Actived.",
                                Duration = 3
                            })
                        end
                    end)
                    MobileUI.curveShotProMaxToggle.MouseButton1Click:Connect(function()
                        Debris_Variables.CurveShotProMaxKeybind.State = not CurveShotProMaxToggle.Value
                        CurveShotProMaxToggle:SetValue(Debris_Variables.CurveShotProMaxKeybind.State)
                        if Debris_Variables.CurveShotProMaxKeybind.State then
                            Fluent:Notify({
                                Title = "Fearise Hub",
                                Content = "CurveShotProMax Actived.",
                                Duration = 3
                            })
                        else
                            Fluent:Notify({
                                Title = "Fearise Hub",
                                Content = "CurveShotProMax Not Actived.",
                                Duration = 3
                            })
                        end
                    end)
                    MobileUI.autoGKToggle.MouseButton1Click:Connect(function()
                        Debris_Variables.AutoGKKeybind.State = not AutoGoalKeeper.Value
                        AutoGoalKeeper:SetValue(Debris_Variables.AutoGKKeybind.State)
                        if Debris_Variables.AutoGKKeybind.State then
                            Fluent:Notify({
                                Title = "Fearise Hub",
                                Content = "AutoGK Actived.",
                                Duration = 3
                            })
                        else
                            Fluent:Notify({
                                Title = "Fearise Hub",
                                Content = "AutoGK Not Actived.",
                                Duration = 3
                            })
                        end
                    end)
                    MobileUI.hitBoxToggle.MouseButton1Click:Connect(function()
                        Debris_Variables.HitboxKeybind.State = not HitboxToggle.Value
                        HitboxToggle:SetValue(Debris_Variables.HitboxKeybind.State)
                        if Debris_Variables.HitboxKeybind.State then
                            Fluent:Notify({
                                Title = "Fearise Hub",
                                Content = "Hitbox Actived.",
                                Duration = 3
                            })
                        else
                            Fluent:Notify({
                                Title = "Fearise Hub",
                                Content = "Hitbox Not Actived.",
                                Duration = 3
                            })
                        end
                    end)
                    game:GetService("CoreGui").ChildRemoved:Connect(function(Value)
                        if Value.Name == "FeariseHub" then
                            MobileUI.feariseHubMobileUI:Destroy()
                        end
                    end)
                else
                    warn("Error: Your Forget Configs")    
                end
            end
        end
    end
    checkDeviceUi()
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:SetFolder("Fearise Hub")
InterfaceManager:SetFolder("Fearise Hub")

SaveManager:BuildConfigSection(Tabs.pageSettings)
InterfaceManager:BuildInterfaceSection(Tabs.pageSettings)

-- Anti AFK
task.spawn(function()
    while wait(320) do
        pcall(function()
            local anti = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                anti:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                anti:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end)
    end
end)

Fluent:Notify({
    Title = "Fearise Hub",
    Content = "Anti AFK Is Actived",
    Duration = 5
})

Window:SelectTab(1)