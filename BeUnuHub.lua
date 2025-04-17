-- Define Roblox Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScriptHubGui"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
print("ScreenGui created and parented to PlayerGui")

-- Create the Main Frame (Hub Window)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 700, 0, 400)
mainFrame.Position = UDim2.new(0.5, -350, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
print("MainFrame created")

-- Add Gradient to Main Frame
local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 60))
})
mainGradient.Rotation = 45
mainGradient.Parent = mainFrame
print("MainFrame gradient added")

-- Add Rounded Corners to Main Frame
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame
print("MainFrame rounded corners added")

-- Add Glow Effect (Border)
local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 2
mainStroke.Color = Color3.fromRGB(0, 255, 255)
mainStroke.Transparency = 0.5
mainStroke.Parent = mainFrame
print("MainFrame glow effect added")

-- Add a Title Label (Draggable)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
titleLabel.Text = "BeUnu Hub"
titleLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.FredokaOne
titleLabel.Parent = mainFrame
print("TitleLabel added")

-- Add Gradient to Title Label
local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 80))
})
titleGradient.Rotation = 45
titleGradient.Parent = titleLabel
print("TitleLabel gradient added")

-- Add Rounded Corners to Title Label
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleLabel
print("TitleLabel rounded corners added")

-- Add a Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -80, 0, 10)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextScaled = true
minimizeButton.Parent = mainFrame
print("MinimizeButton added")

-- Add Rounded Corners to Minimize Button
local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 5)
minimizeCorner.Parent = minimizeButton
print("MinimizeButton rounded corners added")

-- Add an X Button to Close the GUI
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Parent = mainFrame
print("CloseButton added")

-- Add Rounded Corners to Close Button
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeButton
print("CloseButton rounded corners added")

-- Create a Warning Frame (hidden by default)
local warningFrame = Instance.new("Frame")
warningFrame.Size = UDim2.new(0, 300, 0, 150)
warningFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
warningFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
warningFrame.BorderSizePixel = 0
warningFrame.Visible = false
warningFrame.Parent = screenGui
print("WarningFrame created")

-- Add Rounded Corners to Warning Frame
local warningCorner = Instance.new("UICorner")
warningCorner.CornerRadius = UDim.new(0, 10)
warningCorner.Parent = warningFrame
print("WarningFrame rounded corners added")

-- Warning Label
local warningLabel = Instance.new("TextLabel")
warningLabel.Size = UDim2.new(1, 0, 0, 70)
warningLabel.Position = UDim2.new(0, 0, 0, 10)
warningLabel.BackgroundTransparency = 1
warningLabel.Text = "Are you sure you want to close the 'BeUnu Hub' script?"
warningLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
warningLabel.TextScaled = true
warningLabel.TextWrap = true
warningLabel.Parent = warningFrame
print("WarningLabel added")

-- Yes Button for Warning
local yesButton = Instance.new("TextButton")
yesButton.Size = UDim2.new(0, 100, 0, 40)
yesButton.Position = UDim2.new(0, 40, 1, -50)
yesButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
yesButton.Text = "Yes"
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
yesButton.TextScaled = true
yesButton.Parent = warningFrame
print("YesButton added")

-- Add Rounded Corners to Yes Button
local yesCorner = Instance.new("UICorner")
yesCorner.CornerRadius = UDim.new(0, 5)
yesCorner.Parent = yesButton
print("YesButton rounded corners added")

-- No Button for Warning
local noButton = Instance.new("TextButton")
noButton.Size = UDim2.new(0, 100, 0, 40)
noButton.Position = UDim2.new(1, -140, 1, -50)
noButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
noButton.Text = "No"
noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noButton.TextScaled = true
noButton.Parent = warningFrame
print("NoButton added")

-- Add Rounded Corners to No Button
local noCorner = Instance.new("UICorner")
noCorner.CornerRadius = UDim.new(0, 5)
noCorner.Parent = noButton
print("NoButton rounded corners added")

-- Create Left Frame for Game List
local leftFrame = Instance.new("Frame")
leftFrame.Size = UDim2.new(0, 250, 1, -60)
leftFrame.Position = UDim2.new(0, 10, 0, 60)
leftFrame.BackgroundTransparency = 1
leftFrame.Parent = mainFrame
print("LeftFrame created")

-- Create a ScrollingFrame for the Game List
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.Position = UDim2.new(0, 0, 0, 0)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 5
scrollingFrame.Parent = leftFrame
print("ScrollingFrame for games created")

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 10)
uiListLayout.Parent = scrollingFrame

-- Create Right Frame for Script List
local rightFrame = Instance.new("Frame")
rightFrame.Size = UDim2.new(0, 400, 1, -60)
rightFrame.Position = UDim2.new(0, 280, 0, 60)
rightFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
rightFrame.Parent = mainFrame
print("RightFrame created")

-- Add Rounded Corners to Right Frame
local rightCorner = Instance.new("UICorner")
rightCorner.CornerRadius = UDim.new(0, 10)
rightCorner.Parent = rightFrame
print("RightFrame rounded corners added")

-- Add a Script Title Label for Right Frame
local scriptTitle = Instance.new("TextLabel")
scriptTitle.Size = UDim2.new(1, 0, 0, 30)
scriptTitle.Position = UDim2.new(0, 0, 0, 0)
scriptTitle.BackgroundTransparency = 1
scriptTitle.Text = "Credits"
scriptTitle.TextColor3 = Color3.fromRGB(0, 255, 255)
scriptTitle.TextScaled = true
scriptTitle.Font = Enum.Font.FredokaOne
scriptTitle.Parent = rightFrame
print("ScriptTitle added")

-- Create a ScrollingFrame for the Script List
local scriptScrolling = Instance.new("ScrollingFrame")
scriptScrolling.Size = UDim2.new(1, -20, 1, -40)
scriptScrolling.Position = UDim2.new(0, 10, 0, 40)
scriptScrolling.BackgroundTransparency = 1
scriptScrolling.ScrollBarThickness = 5
scriptScrolling.Parent = rightFrame
print("ScriptScrolling created")

local scriptListLayout = Instance.new("UIListLayout")
scriptListLayout.SortOrder = Enum.SortOrder.LayoutOrder
scriptListLayout.Padding = UDim.new(0, 10)
scriptListLayout.Parent = scriptScrolling

-- Add Credits Section (Initially Visible)
local creditsLabel = Instance.new("TextLabel")
creditsLabel.Size = UDim2.new(1, 0, 0, 50)
creditsLabel.BackgroundTransparency = 1
creditsLabel.Text = "made by: BeUnu"
creditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsLabel.TextScaled = true
creditsLabel.Font = Enum.Font.FredokaOne
creditsLabel.Parent = scriptScrolling
print("CreditsLabel added")

-- Define the Scripts (Bubble Gum Simulator Infinity with updated and new script)
local scripts = {
    ["Bubble Gum Simulator Infinity"] = {
        {Name = "VINQ HUB", Code = function()
            loadstring(game:GetService("HttpService"):HttpGet('https://raw.githubusercontent.com/vinqDevelops/erwwefqweqewqwe/refs/heads/main/lol.txt'))()
        end},
        {Name = "BTDCBUSS HUB (key)", Code = function()
            loadstring(game:GetService("HttpService"):HttpGet("https://raw.githubusercontent.com/BTDCBUUS1/loader/refs/heads/main/loader.lua"))()
        end},
    },
}
print("Scripts table defined with " .. tostring(#scripts) .. " games")

-- Add Resize Handle (Bottom-Right Corner)
local resizeHandle = Instance.new("Frame")
resizeHandle.Size = UDim2.new(0, 20, 0, 20)
resizeHandle.Position = UDim2.new(1, -20, 1, -20)
resizeHandle.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
resizeHandle.Parent = mainFrame
print("ResizeHandle added")

-- Add Rounded Corners to Resize Handle
local resizeCorner = Instance.new("UICorner")
resizeCorner.CornerRadius = UDim.new(0, 5)
resizeCorner.Parent = resizeHandle
print("ResizeHandle rounded corners added")

-- Function to Create a Button
local function createButton(text, parent, callback, isScriptButton)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 50)
    if isScriptButton then
        button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    else
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
    button.Text = "# " .. text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true
    button.Font = Enum.Font.FredokaOne
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
    print("Button created: " .. text)

    -- Add Rounded Corners to Button
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button

    -- Add Glow Effect to Button
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Thickness = 1
    buttonStroke.Color = Color3.fromRGB(0, 255, 255)
    buttonStroke.Transparency = 0.7
    buttonStroke.Parent = button

    return button
end

-- Function to Create a Notification
local function createNotification(message)
    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 200, 0, 50)
    notification.Position = UDim2.new(0, 10, 1, -60)
    notification.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    notification.BorderSizePixel = 0
    notification.Parent = screenGui

    local notifLabel = Instance.new("TextLabel")
    notifLabel.Size = UDim2.new(1, 0, 1, 0)
    notifLabel.BackgroundTransparency = 1
    notifLabel.Text = message
    notifLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    notifLabel.TextScaled = true
    notifLabel.TextWrap = true
    notifLabel.Parent = notification

    -- Add Rounded Corners to Notification
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 5)
    notifCorner.Parent = notification

    -- Fade out and destroy after 3 seconds
    wait(3)
    for i = 1, 0, -0.1 do
        notification.BackgroundTransparency = 1 - i
        notifLabel.TextTransparency = 1 - i
        wait(0.1)
    end
    notification:Destroy()
end

-- Populate the Game List (Left Side) - Only Bubble Gum Simulator Infinity
for gameName, _ in pairs(scripts) do
    createButton(gameName, scrollingFrame, function()
        print("Game clicked: " .. gameName)
        scriptTitle.Text = gameName .. " Scripts"

        -- Clear previous content (Credits or other scripts)
        for _, child in pairs(scriptScrolling:GetChildren()) do
            if child:IsA("TextButton") or child:IsA("TextLabel") then
                child:Destroy()
            end
        end

        -- Populate scripts for the selected game
        for _, scriptData in ipairs(scripts[gameName]) do
            createButton(scriptData.Name, scriptScrolling, function()
                scriptData.Code()
                createNotification("Script Executed!")
            end, true)
        end
    end, false)
end

-- Connect the Close Button (Show Warning)
closeButton.MouseButton1Click:Connect(function()
    warningFrame.Visible = true
    mainFrame.Visible = false
end)

-- Connect the Yes Button (Close the GUI)
yesButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Connect the No Button (Return to Main Menu)
noButton.MouseButton1Click:Connect(function()
    warningFrame.Visible = false
    mainFrame.Visible = true
end)

-- Connect the Minimize Button
local isMinimized = false
minimizeButton.MouseButton1Click:Connect(function()
    if isMinimized then
        -- Restore GUI
        mainFrame.Size = UDim2.new( stormyFrame.Size.X.Offset, 0, 400)
        leftFrame.Visible = true
        rightFrame.Visible = true
        resizeHandle.Visible = true
        minimizeButton.Text = "-"
        isMinimized = false
        createNotification("GUI Restored!")
    else
        -- Minimize GUI
        mainFrame.Size = UDim2.new(0, mainFrame.Size.X.Offset, 0, 50)
        leftFrame.Visible = false
        rightFrame.Visible = false
        resizeHandle.Visible = false
        minimizeButton.Text = "+"
        isMinimized = true
        createNotification("GUI Minimized!")
    end
end)

-- Make the GUI Draggable (Title Bar)
local dragging = false
local dragStart = nil
local startPos = nil

titleLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

titleLabel.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Make the GUI Resizable (Bottom-Right Corner)
local resizing = false
local resizeStart = nil
local startSize = nil

resizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = true
        resizeStart = input.Position
        startSize = mainFrame.Size
    end
end)

resizeHandle.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and resizing then
        local delta = input.Position - resizeStart
        local newWidth = math.max(400, startSize.X.Offset + delta.X) -- Minimum width
        local newHeight = math.max(200, startSize.Y.Offset + delta.Y) -- Minimum height
        mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)

        -- Adjust child frames dynamically
        leftFrame.Size = UDim2.new(0, newWidth * (250/700), 1, -60)
        rightFrame.Size = UDim2.new(0, newWidth * (400/700), 1, -60)
        rightFrame.Position = UDim2.new(0, newWidth * (280/700), 0, 60)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = false
    end
end)

-- Adjust ScrollingFrame CanvasSize dynamically
uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y)
end)

scriptListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scriptScrolling.CanvasSize = UDim2.new(0, 0, 0, scriptListLayout.AbsoluteContentSize.Y)
end)
