local UI = {}
local cnx = {}
local notified = false

local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")
local validKey = Instance.new("BindableEvent")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Aero"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

function UI:CreateWindow(c)
	if c.Key then
		local key = c.Key

		local frame = Instance.new("Frame")
		local title = Instance.new("TextLabel")
		local textBox = Instance.new("TextBox")
		local enter = Instance.new("TextButton")
		local textLabel = Instance.new("TextLabel")
		local exit = Instance.new("TextButton")

		frame.Size = UDim2.new(0.333, 0, 0.333, 0)
		frame.Position = UDim2.new(0.333, 0, 0.333, 0)
		frame.BorderSizePixel = 0
		frame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		frame.Parent = screenGui

		title.Size = UDim2.new(1, 0, 0.1, 0)
		title.BackgroundColor3 = Color3.new(0, 0, 0)
		title.Text = "Key System"
		title.TextColor3 = Color3.new(1, 1, 1)
		title.TextScaled = true
		title.Font = Enum.Font.SourceSans
		title.BorderSizePixel = 0
		title.Parent = frame

		exit.Text = "X"
		exit.Font = Enum.Font.SourceSans
		exit.TextColor3 = Color3.new(1, 1, 1)
		exit.TextScaled = true
		exit.BorderSizePixel = 0
		exit.BackgroundColor3 = Color3.new(0, 0, 0)
		exit.AutoButtonColor = false
		exit.Size = UDim2.new(0.1, 0, 1, 0)
		exit.Position = UDim2.new(0.9, 0, 0, 0)
		exit.MouseButton1Down:Connect(function()
			if textLabel.Text ~= "Are you sure?" then
				textLabel.Text  = "Are you sure?"
				textLabel.BackgroundColor3 = BrickColor.new("Bright red").Color
				task.delay(2, function()
					textLabel.Text = "Enter a Key"
					textLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
				end)
			else
				for _, v in cnx do
					v:Disconnect()
					v = nil
				end
				cnx = nil
				notified = nil
				UI = nil
				screenGui:Destroy()
			end
		end)

		cnx[#cnx+1] = exit.MouseEnter:Connect(function()
			exit.BackgroundColor3 = BrickColor.new("Bright red").Color
		end)

		cnx[#cnx+1] = exit.MouseLeave:Connect(function()
			exit.BackgroundColor3 = Color3.new(0, 0, 0)
		end)
		exit.Parent = title

		textBox.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		textBox.Text = ""
		textBox.PlaceholderText = "Key"
		textBox.TextColor3 = Color3.new(1, 1, 1)
		textBox.TextScaled = true
		textBox.BorderSizePixel = 0
		textBox.Size = UDim2.new(0.8, 0, 0.2, 0)
		textBox.Font = Enum.Font.SourceSans
		textBox.Position = UDim2.new(0.1, 0, 0.4, 0)
		textBox.Parent = frame

		textLabel.Text = "Enter a Key"
		textLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
		textLabel.Position = UDim2.new(0.1, 0, 0.15, 0)
		textLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		textLabel.BorderSizePixel = 0
		textLabel.Font = Enum.Font.SourceSans
		textLabel.BorderSizePixel = 0
		textLabel.TextScaled = true
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.Parent = frame

		enter.Size = UDim2.new(0.4, 0, 0.2, 0)
		enter.Position = UDim2.new(0.3, 0, 0.7, 0)
		enter.AutoButtonColor = false
		enter.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		enter.BorderSizePixel = 0
		enter.Font = Enum.Font.SourceSans
		enter.Text = "Enter"
		enter.TextScaled = true
		enter.TextColor3 = Color3.new(1, 1, 1)
		enter.MouseButton1Down:Connect(function()
			if textBox.Text == key and textLabel.Text == "Enter a Key" then
				textBox.Text = ""
				textLabel.Text = "Access Granted"
				textLabel.BackgroundColor3 = BrickColor.new("Bright green").Color
				task.wait(1)
				screenGui:ClearAllChildren()
				validKey:Fire()
			elseif textLabel.Text == "Enter a Key" then
				textBox.Text = ""
				textLabel.Text = "Access Denied"
				textLabel.BackgroundColor3 = BrickColor.new("Bright red").Color
				task.wait(1)
				textLabel.Text = "Enter a Key"
				textLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
			end
		end)
		enter.Parent = frame

		local dragStartMousePosition = nil
		local startFramePosition = nil
		local isDragging = false

		cnx[#cnx+1] = title.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				isDragging = true
				dragStartMousePosition = input.Position
				startFramePosition = frame.Position
			end
		end)

		cnx[#cnx+1] = UIS.InputChanged:Connect(function(input)
			if isDragging then
				local delta = input.Position - dragStartMousePosition
				frame.Position = UDim2.new(
					startFramePosition.X.Scale, startFramePosition.X.Offset + delta.X,
					startFramePosition.Y.Scale, startFramePosition.Y.Offset + delta.Y
				)
			end
		end)

		cnx[#cnx+1] = UIS.InputEnded:Connect(function(input)
			if isDragging then
				isDragging = false
				dragStartMousePosition = nil
				startFramePosition = nil
			end
		end)
	end

	if c.Key then validKey.Event:Wait() end
	local frame = Instance.new("Frame")
	local title = Instance.new("TextLabel")
	local elemFrame = Instance.new("Frame")
	local uipl = Instance.new("UIPageLayout")
	local tabSF = Instance.new("ScrollingFrame")
	local uill = Instance.new("UIListLayout")
	local settingsButton = Instance.new("ImageButton")
	local settingsFrame = Instance.new("Frame")
	local settingsUILL = Instance.new("UIListLayout")
	local tglFrame = Instance.new("Frame")
	local tglTL = Instance.new("TextLabel")
	local tglTrigger = Instance.new("TextButton")
	local destroy = Instance.new("TextButton")
	local keybind = Enum.KeyCode.LeftControl

	frame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	frame.BorderSizePixel = 0
	frame.Position = UDim2.new(0.3, 0, 0.3, 0)
	frame.ClipsDescendants = true
	frame.Size = UDim2.new(0.4, 0, 0.4, 0)
	frame.Parent = screenGui

	title.Text = c.Title
	title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Name = "Title"
	title.Size = UDim2.new(1, 0, 0.1, 0)
	title.Font = Enum.Font.SourceSans
	title.TextColor3 = Color3.new(1, 1, 1)
	title.TextScaled = true
	title.Parent = frame

	settingsFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	settingsFrame.BorderSizePixel = 0
	settingsFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
	settingsFrame.Size = UDim2.new(0.8, 0, 0.9, 0)
	settingsFrame.Visible = false
	settingsFrame.Name = "Settings"
	settingsFrame.Parent = frame

	settingsUILL.SortOrder = Enum.SortOrder.LayoutOrder
	settingsUILL.Parent = settingsFrame

	tglFrame.BackgroundTransparency = 1
	tglFrame.BorderSizePixel = 0
	tglFrame.Size = UDim2.new(1, 0, 0.2, 0)
	tglFrame.Parent = settingsFrame

	tglTL.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	tglTL.BorderSizePixel = 0
	tglTL.Size = UDim2.new(0.75, 0, 1, 0)
	tglTL.Font = Enum.Font.SourceSans
	tglTL.Text = "Toggle Aero"
	tglTL.TextColor3 = Color3.new(1, 1, 1)
	tglTL.TextScaled = true
	tglTL.Parent = tglFrame

	local cnxName = tostring(#cnx+1)
	tglTrigger.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	tglTrigger.BorderSizePixel = 0
	tglTrigger.AutoButtonColor = false
	tglTrigger.Position = UDim2.new(0.75, 0, 0, 0)
	tglTrigger.Size = UDim2.new(0.25, 0, 1, 0)
	tglTrigger.Font = Enum.Font.SourceSans
	tglTrigger.Text = keybind.Name
	tglTrigger.TextColor3 = Color3.new(1, 1, 1)
	tglTrigger.TextScaled = true
	tglTrigger.MouseButton1Down:Connect(function()
		if cnx[cnxName] then
			return
		else
			tglTrigger.Text = "..."
			cnx[cnxName] = UIS.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					cnx[cnxName]:Disconnect()
					cnx[cnxName] = nil
					tglTrigger.Text = input.KeyCode.Name
					task.wait()
					keybind = input.KeyCode
				elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
					cnx[cnxName]:Disconnect()
					cnx[cnxName] = nil
					tglTrigger.Text = keybind.Name
				end
			end)
		end
	end)
	tglTrigger.Parent = tglFrame

	destroy.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	destroy.AutoButtonColor = false
	destroy.BorderSizePixel = 0
	destroy.Size = UDim2.new(1, 0, 0.2, 0)
	destroy.Font = Enum.Font.SourceSans
	destroy.Text = "Destroy Aero"
	destroy.TextColor3 = Color3.new(1, 1, 1)
	destroy.TextScaled = true
	destroy.MouseButton1Down:Connect(function()
		if destroy.Text ~= "Are you sure?" then
			destroy.Text = "Are you sure?"
			destroy.BackgroundColor3 = BrickColor.new("Bright red").Color
			task.delay(2, function()
				destroy.Text = "Destroy Aero"
				destroy.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
			end)
		else
			for _, v in cnx do
				v:Disconnect()
				v = nil
			end
			cnx = nil
			notified = nil
			UI = nil
			screenGui:Destroy()
		end
	end)
	destroy.Parent = settingsFrame

	settingsButton.Size = UDim2.new(0.05, 0, 1, 0)
	settingsButton.AutoButtonColor = false
	settingsButton.BorderSizePixel = 0
	settingsButton.Position = UDim2.new(0.95, 0, 0, 0)
	settingsButton.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/GameSettingsTab@2x.png"
	settingsButton.ScaleType = Enum.ScaleType.Fit
	settingsButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	settingsButton.MouseButton1Down:Connect(function()
		settingsFrame.Visible = not settingsFrame.Visible
		elemFrame.Visible = not elemFrame.Visible
		title.Text = settingsFrame.Visible and "Settings" or c.Title
	end)
	settingsButton.Parent = title

	elemFrame.BackgroundTransparency = 1
	elemFrame.BorderSizePixel = 0
	elemFrame.Name = "Elements"
	elemFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
	elemFrame.Size = UDim2.new(0.8, 0, 0.9, 0)
	elemFrame.Parent = frame

	uipl.Animated = false
	uipl.ScrollWheelInputEnabled = false
	uipl.Parent = elemFrame

	tabSF.Active = false
	tabSF.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	tabSF.BorderSizePixel = 0
	tabSF.Name = "TabSF"
	tabSF.AutomaticCanvasSize = Enum.AutomaticSize.Y
	tabSF.CanvasSize = UDim2.new(0, 0, 0.1, 0)
	tabSF.ElasticBehavior = Enum.ElasticBehavior.Never
	tabSF.ScrollBarThickness = 0
	tabSF.ScrollingDirection = Enum.ScrollingDirection.Y
	tabSF.Position = UDim2.new(0, 0, 0.1, 0)
	tabSF.Size = UDim2.new(0.2, 0, 0.9, 0)
	tabSF.Parent = frame

	uill.SortOrder = Enum.SortOrder.LayoutOrder
	uill.Parent = tabSF

	cnx[#cnx+1] = UIS.InputBegan:Connect(function(input)
		if input.KeyCode == keybind then
			frame.Visible = not frame.Visible
			if not notified then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Aero is Hidden",
					Text = "Use " .. keybind.Name .. " to toggle",
					Icon = "rbxasset://textures/StudioSharedUI/alert_info@2x.png",
					Duration = 4
				})
				notified = true
			end
		end
	end)

	local dragStartMousePosition = nil
	local startFramePosition = nil
	local isDragging = false

	cnx[#cnx+1] = title.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			isDragging = true
			dragStartMousePosition = input.Position
			startFramePosition = frame.Position
		end
	end)

	cnx[#cnx+1] = UIS.InputChanged:Connect(function(input)
		if isDragging then
			local delta = input.Position - dragStartMousePosition
			frame.Position = UDim2.new(
				startFramePosition.X.Scale, startFramePosition.X.Offset + delta.X,
				startFramePosition.Y.Scale, startFramePosition.Y.Offset + delta.Y
			)
		end
	end)

	cnx[#cnx+1] = UIS.InputEnded:Connect(function(input)
		if isDragging then
			isDragging = false
			dragStartMousePosition = nil
			startFramePosition = nil
		end
	end)
end

function UI:CreateTab(c)
	if c.Key then validKey.Event:Wait() end

	local tabButton = Instance.new("TextButton")
	local sf = Instance.new("ScrollingFrame")
	local uill = Instance.new("UIListLayout")

	if #screenGui.Frame.TabSF:GetChildren() == 1 then 
		tabButton.BackgroundColor3 = BrickColor.new("Bright blue").Color
	else
		tabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	end

	tabButton.Name = c.Name
	tabButton.Text = c.Name
	tabButton.BorderSizePixel = 0
	tabButton.AutoButtonColor = false
	tabButton.Size = UDim2.new(1, 0, 0.2, 0)
	tabButton.Font = Enum.Font.SourceSans
	tabButton.TextColor3 = Color3.new(1, 1, 1)
	tabButton.TextScaled = true
	tabButton.MouseButton1Down:Connect(function()
		local page = screenGui.Frame.Elements:FindFirstChild(tabButton.Name)
		screenGui.Frame.Elements.UIPageLayout:JumpTo(page)
		page.CanvasPosition = Vector2.new(0, 0)

		for _, v in pairs(screenGui.Frame.TabSF:GetChildren()) do
			if v:IsA("TextButton") and v.Name ~= tabButton.Name then
				v.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			else
				tabButton.BackgroundColor3 = BrickColor.new("Bright blue").Color
			end
		end
	end)
	tabButton.Parent = screenGui.Frame.TabSF

	sf.Name = c.Name
	sf.BackgroundTransparency = 1
	sf.BorderSizePixel = 0
	sf.Active = false
	sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
	sf.Size = UDim2.new(1, 0, 1, 0)
	sf.CanvasSize = UDim2.new(0, 0, 1, 0)
	sf.ScrollBarThickness = 0
	sf.ElasticBehavior = Enum.ElasticBehavior.Never
	sf.ScrollingDirection = Enum.ScrollingDirection.Y
	sf.Parent = screenGui.Frame.Elements

	uill.SortOrder = Enum.SortOrder.LayoutOrder
	uill.Parent = sf

	return sf
end

function UI:CreateButton(c)
	if c.Key then validKey.Event:Wait() end

	local button = Instance.new("TextButton")

	button.Text = c.Text
	button.Name = c.Text
	button.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	button.AutoButtonColor = false
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, 0, 0.2, 0)
	button.Font = Enum.Font.SourceSans
	button.TextColor3 = Color3.new(1, 1, 1)
	button.TextScaled = true
	button.MouseButton1Down:Connect(c.Callback)
	button.Parent = c.Tab
	return button
end

function UI:CreateToggle(c)
	if c.Key then validKey.Event:Wait() end

	local button = Instance.new("TextButton")
	local boolean = true

	button.Text = c.Text
	button.Name = c.Text
	button.AutoButtonColor = false
	button.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, 0, 0.2, 0)
	button.Font = Enum.Font.SourceSans
	button.TextColor3 = Color3.new(1, 1, 1)
	button.TextScaled = true
	button.MouseButton1Down:Connect(function()
		c.Callback(boolean)
		boolean = not boolean
	end)
	button.Parent = c.Tab
	return button
end

function UI:Notify(c)
	if c.Key then validKey.Event:Wait() end
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = c.Title or "",
		Text = c.Text or "",
		Duration = c.Duration or 5,
		Icon = c.Icon or nil
	})
end

function UI:CreateTextBox(c)
	if c.Key then validKey.Event:Wait() end

	local frame = Instance.new("Frame")
	local textLabel = Instance.new("TextLabel")
	local textBox = Instance.new("TextBox")

	frame.Name = c.Text
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Size = UDim2.new(1, 0, 0.2, 0)
	frame.Parent = c.Tab

	textBox.PlaceholderText = c.PlaceholderText
	textBox.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	textBox.BorderSizePixel = 0
	textBox.Position = UDim2.new(0.75, 0, 0, 0)
	textBox.Size = UDim2.new(0.25, 0, 1, 0)
	textBox.Font = Enum.Font.SourceSans
	textBox.Text = ""
	textBox.TextColor3 = Color3.new(1, 1, 1)
	textBox.TextScaled = true
	textBox.Parent = frame

	textLabel.Text = c.Text
	textLabel.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	textLabel.BorderSizePixel = 0
	textLabel.Size = UDim2.new(0.75, 0, 1, 0)
	textLabel.Font = Enum.Font.SourceSans
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
	return textLabel
end

function UI:CreateKeybind(c)
	if c.Key then validKey.Event:Wait() end

	local frame = Instance.new("Frame")
	local textLabel = Instance.new("TextLabel")
	local trigger = Instance.new("TextButton")
	local cnxName = tostring(#cnx+1)
	local keybind = c.DefaultKeybind
	local boolean = true

	frame.Name = c.Text
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Size = UDim2.new(1, 0, 0.2, 0)
	frame.Parent = c.Tab

	trigger.Text = c.DefaultKeybind.Name
	trigger.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	trigger.BorderSizePixel = 0
	trigger.Position = UDim2.new(0.75, 0, 0, 0)
	trigger.AutoButtonColor = false
	trigger.Size = UDim2.new(0.25, 0, 1, 0)
	trigger.Font = Enum.Font.SourceSans
	trigger.TextColor3 = Color3.new(1, 1, 1)
	trigger.TextScaled = true
	trigger.Parent = frame

	textLabel.Name = c.Text
	textLabel.Text = c.Text
	textLabel.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	textLabel.BorderSizePixel = 0
	textLabel.Size = UDim2.new(0.75, 0, 1, 0)
	textLabel.Font = Enum.Font.SourceSans
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	textLabel.Parent = frame

	cnx[#cnx+1] = UIS.InputBegan:Connect(function(input)
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
		if cnx[cnxName] then
			return
		else
			trigger.Text = "..."
			cnx[cnxName] = UIS.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					cnx[cnxName]:Disconnect()
					cnx[cnxName] = nil
					trigger.Text = input.KeyCode.Name
					task.wait()
					keybind = input.KeyCode
				elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
					cnx[cnxName]:Disconnect()
					cnx[cnxName] = nil
					trigger.Text = keybind.Name
				end
			end)
		end
	end)
	return textLabel
end

return UI
