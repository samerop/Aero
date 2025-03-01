local UI = {}
local cnx = {}
local notified = false

local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")

function UI:CreateWindow(c)
	local screenGui = Instance.new("ScreenGui")
	local frame = Instance.new("Frame")
	local title = Instance.new("TextLabel")
	elemFrame = Instance.new("Frame")
	uipl = Instance.new("UIPageLayout")
	tabFrame = Instance.new("ScrollingFrame")
	local uill = Instance.new("UIListLayout")

	local setting =  Instance.new("ImageButton")
	local settingsFrame = Instance.new("Frame")
	local uill_settings = Instance.new("UIListLayout")
	local togFrame = Instance.new("Frame")
	local togTextLabel = Instance.new("TextLabel")
	local togTrigger = Instance.new("TextButton")
	local destroyAero = Instance.new("TextButton")
	local keybind = Enum.KeyCode.LeftControl

	screenGui.Name = "Aero"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.Parent = CoreGui

	frame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	frame.BorderSizePixel = 0
	frame.ClipsDescendants = true
	frame.Position = UDim2.new(0.35, 0, 0.35, 0)
	frame.Size = UDim2.new(0.3, 0, 0.3, 0)
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

	settingsFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
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

	togTextLabel.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	togTextLabel.Name = "ToggleAero"
	togTextLabel.BorderSizePixel = 0
	togTextLabel.RichText = true
	togTextLabel.Size = UDim2.new(0.75, 0, 1, 0)
	togTextLabel.Font = Enum.Font.SourceSans
	togTextLabel.Text = "Toggle Aero"
	togTextLabel.TextColor3 = Color3.new(1, 1, 1)
	togTextLabel.TextScaled = true
	togTextLabel.Parent = togFrame

	local cnxName = tostring(#cnx+1)
	togTrigger.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	togTrigger.BorderSizePixel = 0
	togTrigger.AutoButtonColor = false
	togTrigger.Name = "Trigger"
	togTrigger.RichText = true
	togTrigger.Position = UDim2.new(0.75, 0, 0, 0)
	togTrigger.Size = UDim2.new(0.25, 0, 1, 0)
	togTrigger.Font = Enum.Font.SourceSans
	togTrigger.Text = keybind.Name
	togTrigger.TextColor3 = Color3.new(1, 1, 1)
	togTrigger.TextScaled = true
	togTrigger.MouseButton1Down:Connect(function()
		if cnx[cnxName] then
			return
		else
			togTrigger.Text = "..."
			cnx[cnxName] = UIS.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					cnx[cnxName]:Disconnect()
					cnx[cnxName] = nil
					togTrigger.Text = input.KeyCode.Name
					task.wait()
					keybind = input.KeyCode
				elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
					cnx[cnxName]:Disconnect()
					cnx[cnxName] = nil
					togTrigger.Text = keybind.Name
				end
			end)
		end
	end)
	togTrigger.Parent = togFrame

	destroyAero.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	destroyAero.Name = "DestroyAero"
	destroyAero.BorderSizePixel = 0
	destroyAero.RichText = true
	destroyAero.Size = UDim2.new(1, 0, 0.2, 0)
	destroyAero.Font = Enum.Font.SourceSans
	destroyAero.Text = "Destroy Aero"
	destroyAero.TextColor3 = Color3.new(1, 1, 1)
	destroyAero.TextScaled = true
	destroyAero.MouseButton1Down:Connect(function()
		if destroyAero.Text ~= "Are you sure?" then
			destroyAero.Text = "Are you sure?"
			destroyAero.BackgroundColor3 = BrickColor.new("Bright red").Color
			task.delay(2, function()
				destroyAero.Text = "Destroy Aero"
				destroyAero.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
			end)
		else
			for _, v in cnx do
				v:Disconnect()
				v = nil
			end
			cnx = nil
			screenGui:Destroy()
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
		title.Text = settingsFrame.Visible and "Settings" or c.Title
	end)
	setting.Parent = title

	elemFrame.BackgroundTransparency = 1
	elemFrame.BorderSizePixel = 0
	elemFrame.Name = "Elements"
	elemFrame.ClipsDescendants = true
	elemFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
	elemFrame.Size = UDim2.new(0.8, 0, 0.9, 0)
	elemFrame.Parent = frame

	uipl.Animated = false
	uipl.ScrollWheelInputEnabled = false
	uipl.Parent = elemFrame

	tabFrame.Active = false
	tabFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
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

	cnx[#cnx+1] = UIS.InputBegan:Connect(function(input)
		if input.KeyCode == keybind then
			frame.Visible = not frame.Visible
			if not notified then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Aero is Hidden",
					Text = "Use " .. keybind.Name .. " to toggle",
					Duration = 5
				})
				notified = true
			end
		end
	end)

	if c.Draggable then
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
			if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				local delta = input.Position - dragStartMousePosition
				frame.Position = UDim2.new(
					startFramePosition.X.Scale, startFramePosition.X.Offset + delta.X,
					startFramePosition.Y.Scale, startFramePosition.Y.Offset + delta.Y
				)
			end
		end)

		cnx[#cnx+1] = UIS.InputEnded:Connect(function(input)
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
		tabButton.BackgroundColor3 = BrickColor.new("Bright blue").Color
	else
		tabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	end

	tabButton.BorderSizePixel = 0
	tabButton.Name = c.Name
	tabButton.AutoButtonColor = false
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

		for _, v in pairs(tabFrame:GetChildren()) do
			if v:IsA("TextButton") and v.Name ~= tabButton.Name then
				v.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			else
				tabButton.BackgroundColor3 = BrickColor.new("Bright blue").Color
			end
		end
	end)
	tabButton.Parent = tabFrame

	sf.BackgroundTransparency = 1
	sf.BorderSizePixel = 0
	sf.Active = false
	sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
	sf.Size = UDim2.new(1, 0, 1, 0)
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
	
	button.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
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

	button.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
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

	textBox.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
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
	textLabel.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
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
	local cnxName = tostring(#cnx+1)
	local keybind = c.DefaultKeybind
	local boolean = true

	frame.Name = c.Text
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Size = UDim2.new(1, 0, 0.2, 0)
	frame.Parent = elemFrame:FindFirstChild(c.Tab)

	trigger.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	trigger.BorderSizePixel = 0
	trigger.Position = UDim2.new(0.75, 0, 0, 0)
	trigger.AutoButtonColor = false
	trigger.Size = UDim2.new(0.25, 0, 1, 0)
	trigger.RichText = true
	trigger.Font = Enum.Font.SourceSans
	trigger.Text = c.DefaultKeybind.Name
	trigger.TextColor3 = Color3.new(1, 1, 1)
	trigger.TextScaled = true
	trigger.Parent = frame

	textLabel.Name = c.Text
	textLabel.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	textLabel.BorderSizePixel = 0
	textLabel.RichText = true
	textLabel.Size = UDim2.new(0.75, 0, 1, 0)
	textLabel.Font = Enum.Font.SourceSans
	textLabel.Text = c.Text
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
end

function UI:UpdateButton(c)
	elemFrame:FindFirstChild(c.Tab):FindFirstChild(c.Button).Text = c.Text
end

return UI