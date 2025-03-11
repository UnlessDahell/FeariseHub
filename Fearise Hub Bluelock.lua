local link = "https://rscripts.net/script/fearise-hub-blue-lock-rivals-KCzr"
local function copyToClipboard()
    if setclipboard then
        setclipboard(link)
        print("✅ Copied to Clipboard: " .. link)
    else
        warn("❌ Executor not  support clipboard()")
    end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 120)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -60)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.Parent = screenGui

local topLabel = Instance.new("TextLabel")
topLabel.Size = UDim2.new(1, 0, 0.25, 0)
topLabel.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
topLabel.Text = "Zypher Notice"
topLabel.TextColor3 = Color3.fromRGB(250, 250, 250)
topLabel.TextSize = 20
topLabel.Font = Enum.Font.SourceSansBold
topLabel.Parent = mainFrame

local bottomLabel = Instance.new("TextLabel")
bottomLabel.Size = UDim2.new(1, 0, 0.75, 0)
bottomLabel.Position = UDim2.new(0, 0, 0.25, 0)
bottomLabel.BackgroundTransparency = 0.8
bottomLabel.Text = "Check out new loader : " .. link
bottomLabel.TextColor3 = Color3.fromRGB(250, 250, 250)
bottomLabel.TextSize = 16
bottomLabel.Font = Enum.Font.SourceSans
bottomLabel.TextWrapped = true
bottomLabel.Parent = mainFrame

copyToClipboard()
