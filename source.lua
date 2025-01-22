local UI = {}
local connections = {}
local connectionCount = 0

local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")

local function add()
	connectionCount += 1
	return connectionCount
end

function UI:CreateWindow(c)
	local screenGui = Instance.new("ScreenGui")
	local frame = Instance.new("Frame")
	local title = Instance.new("TextLabel")
	elemFrame = Instance.new("Frame")
	uipl = Instance.new("UIPageLayout")
	tabFrame = Instance.new("ScrollingFrame")
	local uill = Instance.new("UIListLayout")

	local setting =  Instance.new("ImageButton")
	settingsFrame = Instance.new("Frame")
	local uill_settings = Instance.new("UIListLayout")
	local togFrame = Instance.new("Frame")
	local togTextLabel = Instance.new("TextLabel")
	local togTrigger = Instance.new("TextButton")
	local destroyAero = Instance.new("TextButton")
	local keybind = Enum.KeyCode.LeftControl

	local minMax = Instance.new("ImageButton")

	screenGui.Name = "Aero"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.Parent = CoreGui

	frame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
	frame.BorderSizePixel = 0
	frame.ClipsDescendants = true
	frame.Position = UDim2.new(0.375, 0, 0.375, 0)
	frame.Size = UDim2.new(0.25, 0, 0.25, 0)
	frame.Parent = screenGui

	title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Name = "Title"
	title.Size = UDim2.new(1, 0, 0.1, 0)
	title.Font = Enum.Font.SourceSans
	title.RichText = true
	title.Text = c.Title
	title.TextColor3 = Color3.new(1, 1, 1)
	title.TextScaled = true
	title.Parent = frame

	settingsFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
	settingsFrame.BorderSizePixel = 0
	settingsFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
	settingsFrame.Size = UDim2.new(0.8, 0, 0.9, 0)
	settingsFrame.ClipsDescendants = true
	settingsFrame.Visible = false
	settingsFrame.Name = "Settings"
	settingsFrame.Parent = frame

	uill_settings.SortOrder = Enum.SortOrder.LayoutOrder
	uill_settings.Parent = settingsFrame

	togFrame.BackgroundTransparency = 1
	togFrame.Name = "ToggleAero"
	togFrame.BorderSizePixel = 0
	togFrame.Size = UDim2.new(1, 0, 0.2, 0)
	togFrame.Parent = settingsFrame

	togTextLabel.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	togTextLabel.Name = "ToggleAero"
	togTextLabel.BorderSizePixel = 0
	togTextLabel.RichText = true
	togTextLabel.Size = UDim2.new(0.75, 0, 1, 0)
	togTextLabel.Font = Enum.Font.SourceSans
	togTextLabel.Text = "Toggle Aero"
	togTextLabel.TextColor3 = Color3.new(1, 1, 1)
	togTextLabel.TextScaled = true
	togTextLabel.Parent = togFrame

	local connectionName = "togTrigger_" .. add()
	togTrigger.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	togTrigger.BorderSizePixel = 0
	togTrigger.Name = "Trigger"
	togTrigger.RichText = true
	togTrigger.Position = UDim2.new(0.75, 0, 0, 0)
	togTrigger.Size = UDim2.new(0.25, 0, 1, 0)
	togTrigger.Font = Enum.Font.SourceSans
	togTrigger.Text = "LeftControl"
	togTrigger.TextColor3 = Color3.new(1, 1, 1)
	togTrigger.TextScaled = true
	togTrigger.MouseButton1Down:Connect(function()
		if connections[connectionName] then
			return
		else
			togTrigger.Text = "..."
			connections[connectionName] = UIS.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					connections[connectionName]:Disconnect()
					connections[connectionName] = nil
					togTrigger.Text = input.KeyCode.Name
					task.wait()
					keybind = input.KeyCode
				end
			end)
		end
	end)
	togTrigger.Parent = togFrame

	local areyousure = nil
	destroyAero.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	destroyAero.Name = "DestroyAero"
	destroyAero.BorderSizePixel = 0
	destroyAero.RichText = true
	destroyAero.Size = UDim2.new(1, 0, 0.2, 0)
	destroyAero.Font = Enum.Font.SourceSans
	destroyAero.Text = "Destroy Aero"
	destroyAero.TextColor3 = Color3.new(1, 1, 1)
	destroyAero.TextScaled = true
	destroyAero.MouseButton1Down:Connect(function()
		if not areyousure then
			areyousure = true
			destroyAero.Text = "<font color='#ff0000'>Are you sure?</font>"
			task.delay(2, function()
				areyousure = nil
				destroyAero.Text = "Destroy Aero"
			end)
		else
			for _, v in pairs(connections) do
				v:Disconnect()
				v = nil
			end
			connections = nil
			frame.Parent:Destroy()
		end
	end)
	destroyAero.Parent = settingsFrame

	setting.Size = UDim2.new(0.05, 0, 1, 0)
	setting.Name = "Settings"
	setting.AutoButtonColor = false
	setting.BorderSizePixel = 0
	setting.Position = UDim2.new(0.95, 0, 0, 0)
	setting.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/GameSettingsTab@2x.png"
	setting.ScaleType = Enum.ScaleType.Fit
	setting.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	setting.MouseButton1Down:Connect(function()
		settingsFrame.Visible = not settingsFrame.Visible
		elemFrame.Visible = not elemFrame.Visible
	end)
	setting.Parent = title

	elemFrame.BackgroundTransparency = 1
	elemFrame.BorderSizePixel = 0
	elemFrame.Name = "Elements"
	elemFrame.ClipsDescendants = true
	elemFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
	elemFrame.Size = UDim2.new(0.8, 0, 0.9, 0)
	elemFrame.Parent = frame

	local minIcon = "rbxasset://textures/MenuBar/icon_minimize.png"
	local maxIcon = "rbxasset://textures/MenuBar/icon_maximize.png"
	minMax.Image = minIcon
	minMax.Name = "MinMax"
	minMax.AutoButtonColor = false
	minMax.BorderSizePixel = 0
	minMax.Size = UDim2.new(0.05, 0, 1, 0)
	minMax.Position = UDim2.new(0.9, 0, 0, 0)
	minMax.ScaleType = Enum.ScaleType.Fit
	minMax.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	minMax.MouseButton1Down:Connect(function()
		if minMax.Image == minIcon then
			minMax.Image = maxIcon
			setting.BackgroundTransparency = 1
			setting.ImageTransparency =  1
			setting.Interactable = false
			settingsFrame.Visible = false
			tabFrame.Visible = false
			elemFrame.Visible = false
			frame.BackgroundTransparency = 1
			title.TextTransparency = 1
			title.BackgroundTransparency = 1
		else
			minMax.Image = minIcon
			setting.BackgroundTransparency = 0
			setting.ImageTransparency = 0
			setting.Interactable = true
			tabFrame.Visible = true
			frame.BackgroundTransparency = 0
			elemFrame.Visible = true
			title.TextTransparency = 0
			title.BackgroundTransparency = 0
		end
	end)
	minMax.Parent = title

	uipl.Animated = false
	uipl.Parent = elemFrame

	tabFrame.Active = false
	tabFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	tabFrame.BorderSizePixel = 0
	tabFrame.Name = "TabFrame"
	tabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	tabFrame.CanvasSize = UDim2.new(0, 0, 0.1, 0)
	tabFrame.ElasticBehavior = Enum.ElasticBehavior.Never
	tabFrame.ScrollBarThickness = 0
	tabFrame.ScrollingDirection = Enum.ScrollingDirection.Y
	tabFrame.Position = UDim2.new(0, 0, 0.1, 0)
	tabFrame.Size = UDim2.new(0.2, 0, 0.9, 0)
	tabFrame.Parent = frame

	uill.SortOrder = Enum.SortOrder.LayoutOrder
	uill.Parent = tabFrame

	connections[add()] = UIS.InputBegan:Connect(function(input)
		if input.KeyCode == keybind then
			frame.Visible = not frame.Visible
		end
	end)

	if c.Draggable then
		local dragStartMousePosition = nil
		local startFramePosition = nil
		local isDragging = false

		connections[add()] = title.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				isDragging = true
				dragStartMousePosition = input.Position
				startFramePosition = frame.Position
			end
		end)

		connections[add()] = UIS.InputChanged:Connect(function(input)
			if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				local delta = input.Position - dragStartMousePosition
				frame.Position = UDim2.new(
					startFramePosition.X.Scale, startFramePosition.X.Offset + delta.X,
					startFramePosition.Y.Scale, startFramePosition.Y.Offset + delta.Y
				)
			end
		end)

		connections[add()] = UIS.InputEnded:Connect(function(input)
			if isDragging and input.UserInputType == Enum.UserInputType.MouseButton1 then
				isDragging = false
				dragStartMousePosition = nil
				startFramePosition = nil
			end
		end)
	end
end

function UI:CreateTab(c)
	local tabButton = Instance.new("TextButton")
	local sf = Instance.new("ScrollingFrame")
	local uill = Instance.new("UIListLayout")

	if #tabFrame:GetChildren() == 1 then 
		tabButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215) 
	else
		tabButton.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	end

	tabButton.BorderSizePixel = 0
	tabButton.Name = c.Name
	tabButton.RichText = true
	tabButton.Size = UDim2.new(1, 0, 0.2, 0)
	tabButton.Font = Enum.Font.SourceSans
	tabButton.Text = c.Name
	tabButton.TextColor3 = Color3.new(1, 1, 1)
	tabButton.TextScaled = true
	tabButton.MouseButton1Down:Connect(function()
		local page = elemFrame:FindFirstChild(tabButton.Name)
		uipl:JumpTo(page)
		page.CanvasPosition = Vector2.new(0, 0)
		settingsFrame.Visible = false
		elemFrame.Visible = true

		for _, v in pairs(tabFrame:GetChildren()) do
			if v:IsA("TextButton") then
				v.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
			end
		end
		tabButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
	end)
	tabButton.Parent = tabFrame

	sf.BackgroundTransparency = 1
	sf.BorderSizePixel = 0
	sf.Active = false
	sf.Size = UDim2.new(1, 0, 1, 0)
	sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
	sf.CanvasSize = UDim2.new(0, 0, 1, 0)
	sf.ScrollBarThickness = 0
	sf.ElasticBehavior = Enum.ElasticBehavior.Never
	sf.ScrollingDirection = Enum.ScrollingDirection.Y
	sf.Name = c.Name
	sf.Parent = elemFrame

	uill.SortOrder = Enum.SortOrder.LayoutOrder
	uill.Parent = sf
end

function UI:CreateButton(c)
	local button = Instance.new("TextButton")

	button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	button.BorderSizePixel = 0
	button.Name = c.Text
	button.Size = UDim2.new(1, 0, 0.2, 0)
	button.Font = Enum.Font.SourceSans
	button.Text = c.Text
	button.RichText = true
	button.TextColor3 = Color3.new(1, 1, 1)
	button.TextScaled = true
	button.MouseButton1Down:Connect(c.Callback)
	button.Parent = elemFrame:FindFirstChild(c.Tab)
end

function UI:CreateToggle(c)
	local button = Instance.new("TextButton")
	local boolean = true

	button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	button.BorderSizePixel = 0
	button.Name = c.Text
	button.RichText = true
	button.Size = UDim2.new(1, 0, 0.2, 0)
	button.Font = Enum.Font.SourceSans
	button.Text = c.Text
	button.TextColor3 = Color3.new(1, 1, 1)
	button.TextScaled = true

	button.MouseButton1Down:Connect(function()
		c.Callback(boolean)
		button.Text = boolean and c.TrueText or c.FalseText
		boolean = not boolean
	end)
	button.Parent = elemFrame:FindFirstChild(c.Tab)
end

function UI:Notify(c)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = c.Title or "",
		Text = c.Text or "",
		Duration = c.Duration or 5,
		Icon = c.Icon or nil
	})
end

function UI:CreateTextBox(c)
	local frame = Instance.new("Frame")
	local textLabel = Instance.new("TextLabel")
	local textBox = Instance.new("TextBox")

	frame.Name = c.Text
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Size = UDim2.new(1, 0, 0.2, 0)
	frame.Parent = elemFrame:FindFirstChild(c.Tab)

	textBox.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	textBox.BorderSizePixel = 0
	textBox.RichText = true
	textBox.Position = UDim2.new(0.75, 0, 0, 0)
	textBox.Size = UDim2.new(0.25, 0, 1, 0)
	textBox.Font = Enum.Font.SourceSans
	textBox.PlaceholderText = c.PlaceholderText
	textBox.Text = ""
	textBox.TextColor3 = Color3.new(1, 1, 1)
	textBox.TextScaled = true
	textBox.Parent = frame

	textLabel.Name = c.Text
	textLabel.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	textLabel.BorderSizePixel = 0
	textLabel.RichText = true
	textLabel.Size = UDim2.new(0.75, 0, 1, 0)
	textLabel.Font = Enum.Font.SourceSans
	textLabel.Text = c.Text
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	textLabel.Parent = frame

	textBox.FocusLost:Connect(function()
		if textBox.Text == "" then
			if c.Default then
				textBox.Text = c.Default
				c.Callback(textBox.Text)
			else
				return
			end
		else
			c.Callback(textBox.Text)
		end
	end)
end

function UI:CreateKeybind(c)
	local frame = Instance.new("Frame")
	local textLabel = Instance.new("TextLabel")
	local trigger = Instance.new("TextButton")
	local connectionName = "Keybind_" .. add()
	local keybind = c.DefaultKeybind
	local boolean = true

	frame.Name = c.Text
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Size = UDim2.new(1, 0, 0.2, 0)
	frame.Parent = elemFrame:FindFirstChild(c.Tab)

	trigger.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	trigger.BorderSizePixel = 0
	trigger.Position = UDim2.new(0.75, 0, 0, 0)
	trigger.Size = UDim2.new(0.25, 0, 1, 0)
	trigger.RichText = true
	trigger.Font = Enum.Font.SourceSans
	trigger.Text = c.DefaultKeybind.Name
	trigger.TextColor3 = Color3.new(1, 1, 1)
	trigger.TextScaled = true
	trigger.Parent = frame

	textLabel.Name = c.Text
	textLabel.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	textLabel.BorderSizePixel = 0
	textLabel.RichText = true
	textLabel.Size = UDim2.new(0.75, 0, 1, 0)
	textLabel.Font = Enum.Font.SourceSans
	textLabel.Text = c.Text
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	textLabel.Parent = frame

	connections[add()] = UIS.InputBegan:Connect(function(input)
		if input.KeyCode == keybind then
			if c.Toggle then
				c.Callback(boolean)
				boolean = not boolean
			else
				c.Callback()
			end
		end
	end)

	trigger.MouseButton1Down:Connect(function()
		if connections[connectionName] then
			return
		else
			trigger.Text = "..."
			connections[connectionName] = UIS.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					connections[connectionName]:Disconnect()
					connections[connectionName] = nil
					trigger.Text = input.KeyCode.Name
					task.wait()
					keybind = input.KeyCode
				end
			end)
		end
	end)
end

function UI:UpdateButton(c)
	elemFrame:FindFirstChild(c.Tab):FindFirstChild(c.Button).Text = c.Text
end

return UI
