local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/samerop/Aero/main/source.lua"))()

UI:CreateWindow({
	Title = "Aero",
	Draggable = true
})

UI:CreateTab({
	Name = "Main"
})

UI:CreateTab({
	Name = "Visuals"
})

UI:CreateButton({
	Text = "Print Hello World",
	Tab = "Main",
	
	Callback = function()
		print("Hello, World!")
	end,
})

UI:CreateKeybind({
	Text = "Sprint",
	Tab = "Main",
	DefaultKeybind = Enum.KeyCode.E,
	Toggle = true,
	
	Callback = function(boolean)
		if boolean then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 48
		else
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		end
	end,
})

UI:CreateToggle({
	Text = "Super Jump: OFF",
	Tab = "Main",
	
	Callback = function(boolean)
		if boolean then
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
		else
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
		end
	end,
	TrueText = "Super Jump: ON",
	FalseText = "Super Jump: OFF"
})

UI:CreateTextBox({
	Text = "Custom WalkSpeed",
	Tab = "Main",
	PlaceholderText = "Value",
	Default = 16,
	
	Callback = function(text)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(text)
	end,
})

UI:CreateTextBox({
	Text = "FOV",
	Tab = "Visuals",
	PlaceholderText = "1-120",
	Default = 70,
	
	Callback = function(text)
		game.Workspace.CurrentCamera.FieldOfView = tonumber(text)
	end
})

UI:CreateToggle({
	Text = "ESP: OFF",
	Tab = "Visuals",
	
	Callback = function(boolean)
		if boolean then
			for _, v in pairs(game.Players:GetPlayers()) do
				for _, p in pairs(v.Character:GetChildren()) do
					if p:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
						task.spawn(function()
							local a = Instance.new("BoxHandleAdornment")
							a.Size = p.Size
							a.Adornee = p
							a.AlwaysOnTop = true
							a.Transparency = 0.5
							a.Color3 = Color3.fromHex("#0080ff")
							a.ZIndex = 1
							a.Parent = p
						end)
					end
				end
			end
		else
			for _, v in pairs(game.Players:GetPlayers()) do
				for _, p in pairs(v.Character:GetDescendants()) do
					if p:IsA("BoxHandleAdornment") then
						p:Destroy()
					end
				end
			end
		end
	end,
	TrueText = "ESP: ON",
	FalseText = "ESP: OFF"
})
