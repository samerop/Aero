local Aero = {}
local notified = false

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Aero"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

function Aero:Notify(t)
	StarterGui:SetCore("SendNotification", {
		Title = t.Title or "",
		Text = t.Text or "",
		Duration = t.Duration or 5,
		Icon = t.Icon or nil
	})
end

function Aero:CreateWindow(Window)
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
	local aeroKeybind = Enum.KeyCode.LeftControl

	if Window.KeySystem[1] then
		local key = Window.KeySystem.Key
		local keyValid = Instance.new("BoolValue")
		keyValid.Value = false

		local frame = Instance.new("Frame")
		local title = Instance.new("TextLabel")
		local textBox = Instance.new("TextBox")
		local textLabel = Instance.new("TextLabel")
		local exit = Instance.new("TextButton")
		local noteText = "<font size='8'><font color='#808080'>Note:</font></font>\n<font size='12'>" .. if Window.KeySystem.Note then Window.KeySystem.Note .. "</font>" else "No instructions" .. "</font>"

		frame.Size = UDim2.new(0.2, 0, 0.4, 0)
		frame.Position = UDim2.new(0.4, 0, 0.3, 0)
		frame.BorderSizePixel = 0
		frame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		frame.Parent = screenGui

		title.Size = UDim2.new(1, 0, 0.1, 0)
		title.BackgroundColor3 = Color3.new(0, 0, 0)
		title.Text = "Key System"
		title.TextColor3 = Color3.new(1, 1, 1)
		title.TextScaled = true
		title.Font = Enum.Font.SourceSansBold
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
				textLabel.BackgroundColor3 = Color3.fromRGB(192, 0, 0)
				task.delay(2, function()
					textLabel.Text = noteText
					textLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
				end)
			else
				notified = true
				screenGui:Destroy()
			end
		end)

		exit.MouseEnter:Connect(function()
			exit.BackgroundColor3 = Color3.fromRGB(192, 0, 0)
		end)

		exit.MouseLeave:Connect(function()
			exit.BackgroundColor3 = Color3.new(0, 0, 0)
		end)
		exit.Parent = title

		textBox.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		textBox.Text = ""
		textBox.PlaceholderText = "Key"
		textBox.TextColor3 = Color3.new(1, 1, 1)
		textBox.TextScaled = true
		textBox.BorderSizePixel = 0
		textBox.Size = UDim2.new(0.8, 0, 0.1, 0)
		textBox.PlaceholderColor3 = Color3.fromRGB(128, 128, 128)
		textBox.Font = Enum.Font.SourceSans
		textBox.Position = UDim2.new(0.1, 0, 0.2, 0)
		textBox.Parent = frame

		textLabel.RichText = true
		textLabel.Text = noteText
		textLabel.Size = UDim2.new(0.8, 0, 0.5, 0)
		textLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
		textLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		textLabel.BorderSizePixel = 0
		textLabel.Font = Enum.Font.SourceSans
		textLabel.BorderSizePixel = 0
		textLabel.TextScaled = true
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.Parent = frame

		textBox.FocusLost:Connect(function(e)
			if textBox.Text == key then
				textBox.Text = ""
				textLabel.Text = "Access Granted"
				textLabel.BackgroundColor3 = Color3.fromRGB(0, 192, 0)
				task.wait(1)
				screenGui:ClearAllChildren()
				keyValid.Value = true
			elseif textBox.Text:match(".") then
				textBox.Text = ""
				textLabel.Text = "Access Denied"
				textLabel.BackgroundColor3 = Color3.fromRGB(192, 0, 0)
				task.wait(1)
				textLabel.Text = noteText
				textLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
			end
		end)

		keyValid.Changed:Wait()
	end

	frame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	frame.BorderSizePixel = 0
	frame.Position = UDim2.new(1 / 3, 0, 1 / 3, 0)
	frame.ClipsDescendants = true
	frame.Size = UDim2.new(1 / 3, 0, 1 / 3, 0)
	frame.Parent = screenGui

	title.Text = Window.Name
	title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Name = "Title"
	title.Size = UDim2.new(1, 0, 0.1, 0)
	title.Font = Enum.Font.SourceSansBold
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
	
	local aeroCnx
	tglTrigger.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	tglTrigger.BorderSizePixel = 0
	tglTrigger.AutoButtonColor = false
	tglTrigger.Position = UDim2.new(0.75, 0, 0, 0)
	tglTrigger.Size = UDim2.new(0.25, 0, 1, 0)
	tglTrigger.Font = Enum.Font.SourceSans
	tglTrigger.Text = aeroKeybind.Name
	tglTrigger.TextColor3 = Color3.new(1, 1, 1)
	tglTrigger.TextScaled = true
	tglTrigger.MouseButton1Down:Connect(function()
		if aeroCnx then
			return
		else
			tglTrigger.Text = "..."
			aeroCnx = UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					tglTrigger.Text = input.KeyCode.Name
					task.wait()
					aeroKeybind = input.KeyCode
					aeroCnx:Disconnect()
					aeroCnx = nil
				elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
					tglTrigger.Text = aeroKeybind.Name
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
			destroy.BackgroundColor3 = Color3.fromRGB(192, 0, 0)
			task.delay(2, function()
				destroy.Text = "Destroy Aero"
				destroy.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
			end)
		else
			notified = true
			Aero = nil
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
		settingsButton.BackgroundColor3 = settingsFrame.Visible and Color3.fromRGB(0, 128, 255) or Color3.fromRGB(0, 0, 0)
		elemFrame.Visible = not elemFrame.Visible
		title.Text = settingsFrame.Visible and "Settings" or Window.Name
		for _, v in ipairs(tabSF:GetChildren()) do if v:IsA("TextButton") then v.BackgroundColor3 = Color3.fromRGB(0, 0, 0) end end
		tabSF:FindFirstChild(uipl.CurrentPage.Name).BackgroundColor3 = settingsFrame.Visible == true and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(0, 128, 255)
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

	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == aeroKeybind then
			frame.Visible = not frame.Visible
			if not notified then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Aero is Hidden",
					Text = "Use " .. aeroKeybind.Name .. " to toggle",
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

	title.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			isDragging = true
			dragStartMousePosition = input.Position
			startFramePosition = frame.Position
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStartMousePosition

			local targetOffsetX = startFramePosition.X.Offset + delta.X
			local targetOffsetY = startFramePosition.Y.Offset + delta.Y

			local parentAbsSize = screenGui.AbsoluteSize

			local potentialAnchorAbsoluteX = (startFramePosition.X.Scale * parentAbsSize.X) + targetOffsetX
			local potentialAnchorAbsoluteY = (startFramePosition.Y.Scale * parentAbsSize.Y) + targetOffsetY

			local screenSize = workspace.CurrentCamera.ViewportSize
			local frameAbsoluteSize = frame.AbsoluteSize
			local frameAnchorPoint = frame.AnchorPoint

			local minAnchorAbsoluteX = frameAnchorPoint.X * frameAbsoluteSize.X
			local maxAnchorAbsoluteX = screenSize.X - (1 - frameAnchorPoint.X) * frameAbsoluteSize.X

			local minAnchorAbsoluteY = frameAnchorPoint.Y * frameAbsoluteSize.Y
			local maxAnchorAbsoluteY = screenSize.Y - (1 - frameAnchorPoint.Y) * frameAbsoluteSize.Y

			local clampedAnchorAbsoluteX = math.clamp(potentialAnchorAbsoluteX, minAnchorAbsoluteX, maxAnchorAbsoluteX)
			local clampedAnchorAbsoluteY = math.clamp(potentialAnchorAbsoluteY, minAnchorAbsoluteY, maxAnchorAbsoluteY)

			local finalNewOffsetX = clampedAnchorAbsoluteX - (startFramePosition.X.Scale * parentAbsSize.X)
			local finalNewOffsetY = clampedAnchorAbsoluteY - (startFramePosition.Y.Scale * parentAbsSize.Y)

			frame.Position = UDim2.new(
				startFramePosition.X.Scale, finalNewOffsetX,
				startFramePosition.Y.Scale, finalNewOffsetY
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if isDragging then
				isDragging = false
			end
		end
	end)

	function Window:CreateTab(n)
		local Tab = {}
		local tabButton = Instance.new("TextButton")
		local sf = Instance.new("ScrollingFrame")
		local uill = Instance.new("UIListLayout")

		if #screenGui.Frame.TabSF:GetChildren() == 1 then 
			tabButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
		else
			tabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		end

		tabButton.Name = n
		tabButton.Text = n
		tabButton.BorderSizePixel = 0
		tabButton.AutoButtonColor = false
		tabButton.Size = UDim2.new(1, 0, 0.2, 0)
		tabButton.Font = Enum.Font.SourceSans
		tabButton.TextColor3 = Color3.new(1, 1, 1)
		tabButton.TextScaled = true
		tabButton.MouseButton1Down:Connect(function()
			if uipl.CurrentPage == sf then
				sf.CanvasPosition = Vector2.new(0, 0)
			end
			screenGui.Frame.Elements.UIPageLayout:JumpTo(sf)
			settingsFrame.Visible = false
			elemFrame.Visible = true
			title.Text = Window.Name
			settingsButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			for _, v in ipairs(screenGui.Frame.TabSF:GetChildren()) do
				if v:IsA("TextButton") and v ~= tabButton then
					v.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				else
					tabButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
				end
			end
		end)
		tabButton.Parent = screenGui.Frame.TabSF

		sf.Name = n
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

		function Tab:CreateButton(t)
			local button = Instance.new("TextButton")

			button.Text = t.Text
			button.Name = t.Text
			button.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
			button.AutoButtonColor = false
			button.BorderSizePixel = 0
			button.Size = UDim2.new(1, 0, 0.2, 0)
			button.Font = Enum.Font.SourceSans
			button.TextColor3 = Color3.new(1, 1, 1)
			button.TextScaled = true
			button.MouseButton1Down:Connect(t.Callback)
			button.Parent = sf

			function t:Set(s)
				button.Text = s
				button.Name = s
			end
			return t
		end

		function Tab:CreateToggle(t)
			local toggle = Instance.new("TextButton")

			toggle.Text = t.Text .. (t.CurrentValue and ": ON" or ": OFF")
			toggle.Name = t.Text
			toggle.AutoButtonColor = false
			toggle.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
			toggle.BorderSizePixel = 0
			toggle.Size = UDim2.new(1, 0, 0.2, 0)
			toggle.Font = Enum.Font.SourceSans
			toggle.TextColor3 = Color3.new(1, 1, 1)
			toggle.TextScaled = true
			toggle.MouseButton1Down:Connect(function()
				t.CurrentValue = not t.CurrentValue
				toggle.Text = toggle.Text:match("(.+): %u+$") .. (t.CurrentValue and ": ON" or ": OFF")
				t.Callback(t.CurrentValue)
			end)
			toggle.Parent = sf


			function t:Set(Value)
				t.CurrentValue = Value
				toggle.Text = toggle.Text:match("(.+): %u+$") .. (Value and ": ON" or ": OFF")
				t.Callback(Value)
			end
			return t
		end

		function Tab:CreateTextBox(t)
			local frame = Instance.new("Frame")
			local textLabel = Instance.new("TextLabel")
			local textBox = Instance.new("TextBox")

			frame.Name = t.Text
			frame.BackgroundTransparency = 1
			frame.BorderSizePixel = 0
			frame.Size = UDim2.new(1, 0, 0.2, 0)
			frame.Parent = sf

			textBox.PlaceholderText = t.PlaceholderText
			textBox.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
			textBox.BorderSizePixel = 0
			textBox.PlaceholderColor3 = Color3.fromRGB(128, 128, 128)
			textBox.Position = UDim2.new(0.75, 0, 0, 0)
			textBox.Size = UDim2.new(0.25, 0, 1, 0)
			textBox.Font = Enum.Font.SourceSans
			textBox.Text = ""
			textBox.TextColor3 = Color3.new(1, 1, 1)
			textBox.TextScaled = true
			textBox.TextXAlignment = Enum.TextXAlignment.Center
			textBox.Parent = frame

			textLabel.Text = t.Text
			textLabel.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
			textLabel.BorderSizePixel = 0
			textLabel.Size = UDim2.new(0.75, 0, 1, 0)
			textLabel.Font = Enum.Font.SourceSans
			textLabel.TextColor3 = Color3.new(1, 1, 1)
			textLabel.TextScaled = true
			textLabel.Parent = frame

			textBox.FocusLost:Connect(function()
				if textBox.Text == "" then
					return
				else
					t.CurrentValue = textBox.Text
					t.Callback(textBox.Text)
				end

				if t.ClearTextOnFocusLost then
					textBox.Text = ""
				end
			end)

			function t:Set(text)
				t.CurrentValue = text
				textBox.Text = text
				t.Callback(text)
			end
			return t
		end

		function Tab:CreateKeybind(t)
			local cnx
			local frame = Instance.new("Frame")
			local textLabel = Instance.new("TextLabel")
			local trigger = Instance.new("TextButton")

			frame.Name = t.Text
			frame.BackgroundTransparency = 1
			frame.BorderSizePixel = 0
			frame.Size = UDim2.new(1, 0, 0.2, 0)
			frame.Parent = sf

			trigger.Text = t.CurrentKeybind
			trigger.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
			trigger.BorderSizePixel = 0
			trigger.Position = UDim2.new(0.75, 0, 0, 0)
			trigger.AutoButtonColor = false
			trigger.Size = UDim2.new(0.25, 0, 1, 0)
			trigger.Font = Enum.Font.SourceSans
			trigger.TextColor3 = Color3.new(1, 1, 1)
			trigger.TextScaled = true
			trigger.Parent = frame

			textLabel.Name = t.Text
			textLabel.Text = t.Text
			textLabel.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
			textLabel.BorderSizePixel = 0
			textLabel.Size = UDim2.new(0.75, 0, 1, 0)
			textLabel.Font = Enum.Font.SourceSans
			textLabel.TextColor3 = Color3.new(1, 1, 1)
			textLabel.TextScaled = true
			textLabel.Parent = frame

			UserInputService.InputBegan:Connect(function(input)
				if input.KeyCode == Enum.KeyCode[t.CurrentKeybind] then
					t.Callback()
				end
			end)

			trigger.MouseButton1Down:Connect(function()
				if not cnx then
					trigger.Text = "..."
					cnx = UserInputService.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Keyboard then
							trigger.Text = input.KeyCode.Name
							task.wait()
							t.CurrentKeybind = input.KeyCode.Name
							cnx:Disconnect()
							cnx = nil
						elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
							trigger.Text = t.CurrentKeybind
						end
					end)
				end
			end)

			function t:Set(newKeybind)
				t.CurrentKeybind = Enum.KeyCode[newKeybind].Name
				trigger.Text = t.CurrentKeybind
			end
			return t
		end
		return Tab
	end
	return Window
end

return Aero
