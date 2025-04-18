local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local plr = Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "BeUnuHub"
gui.ResetOnSpawn = false

-- Notification-style popup
gui.Enabled = false
wait(1)
gui.Enabled = true

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0) -- CENTER of screen
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = false

-- Rounded corners
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

-- Tween pop-in
mainFrame.Position = UDim2.new(0.5, 0, 1.2, 0)
local TweenService = game:GetService("TweenService")
TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

-- ✅ Drag from anywhere
local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Sidebar
local sidebar = Instance.new("Frame", mainFrame)
sidebar.Size = UDim2.new(0, 180, 1, 0)
sidebar.Position = UDim2.new(0, 0, 0, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", sidebar)

-- Game Categories
local categories = {
	["Credits"] = {
		{ name = "Discord Server (click to copy)", action = function() setclipboard("https://discord.gg/dmg4DtBk") end },
		{ name = "DM jiggyv2. for help", action = function() end },
		{ name = "Credits to everyone!", action = function() end }
	},
	["Bubble Gum Simulator"] = {
		{ name = "vinqDevelops", url = "https://raw.githubusercontent.com/vinqDevelops/erwwefqweqewqwe/refs/heads/main/lol.txt" },
		{ name = "Endless hub", url = "https://raw.githubusercontent.com/Droidlol/BGSI/refs/heads/main/Endless.lua" }
	},
	["Blade Ball"] = {
		{ name = "Plutonium Hub", url = "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua" },
		{ name = "Frostware Farms", action = function()
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Note!",
				Text = "This script takes 10 seconds to load and may lag when loading",
				Button1 = "Yes",
				Button2 = "Cancel",
				Duration = 30
			})
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Fsploit/Frostware-/refs/heads/main/Bypass.lua"))()
		end }
	},
	["Pet Simulator 99"] = {
		{ name = "Coming Soon", action = function() end }
	},
	["GreenVile"] = {
		{ name = "overk1ll Tuning Garage", url = "https://raw.githubusercontent.com/typical-overk1ll/scripts/main/Greenville" }
	},
	["Demon Blade"] = {
		{ name = "Auto Farm", url = "https://raw.githubusercontent.com/JackCSTM/eclipsex/main/script" }
	},
	["Arsenal"] = {
		{ name = "Solara", url = "https://raw.githubusercontent.com/JackyPoopoo/cartel/main/0000000000000000000000000000000000000000000000000" }
	}
}

-- Right Content Panel
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Position = UDim2.new(0, 185, 0, 10)
contentFrame.Size = UDim2.new(1, -195, 1, -50)
contentFrame.BackgroundTransparency = 1

local function clearContent()
	for _, child in pairs(contentFrame:GetChildren()) do
		child:Destroy()
	end
end

local function loadCategory(name)
	clearContent()
	local items = categories[name]
	if not items then return end

	for i, data in ipairs(items) do
		local btn = Instance.new("TextButton", contentFrame)
		btn.Size = UDim2.new(1, -10, 0, 40)
		btn.Position = UDim2.new(0, 5, 0, (i - 1) * 45)
		btn.Text = data.name
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 16
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Instance.new("UICorner", btn)

		btn.MouseButton1Click:Connect(function()
			if data.url then
				loadstring(game:HttpGet(data.url))()
			elseif data.action then
				data.action()
			end
		end)
	end
end

-- Create Sidebar Buttons
local yOffset = 10
for catName, _ in pairs(categories) do
	local btn = Instance.new("TextButton", sidebar)
	btn.Size = UDim2.new(1, -10, 0, 30)
	btn.Position = UDim2.new(0, 5, 0, yOffset)
	btn.Text = catName
	btn.TextColor3 = Color3.fromRGB(200, 200, 200)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Instance.new("UICorner", btn)

	btn.MouseButton1Click:Connect(function()
		loadCategory(catName)
	end)

	yOffset += 35
end

-- Default tab
loadCategory("Credits")

-- Footer
local footer = Instance.new("TextLabel", mainFrame)
footer.Text = "Made by BeUnu | #GGJS"
footer.Font = Enum.Font.GothamSemibold
footer.TextSize = 12
footer.TextColor3 = Color3.fromRGB(140, 140, 140)
footer.Size = UDim2.new(1, 0, 0, 20)
footer.Position = UDim2.new(0, 0, 1, -20)
footer.BackgroundTransparency = 1

-- Ctrl Toggle to hide/show
local hidden = false
UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftControl then
		hidden = not hidden
		mainFrame.Visible = not hidden
	end
end)
