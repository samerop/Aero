UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/samerop/Aero/main/source.lua"))()

UI:CreateWindow({
	Title = "Title"
})

tab = UI:CreateTab({
	Name = "Tab1"
})

for i = 2, 20 do
	i = UI:CreateTab({
		Name = "Tab" .. i
	})
end

FOV = UI:CreateTextBox({
	Text = "FOV",
	PlaceholderText = "1 - 120",
	Default = 70,
	Tab = tab,

	Callback = function(text)
		game.Workspace.CurrentCamera.FieldOfView = tonumber(text)
	end
})

button = UI:CreateButton({
	Text = "Go to Random Player",
	Tab = tab,

	Callback = function()
		local r = math.random(1, #game.Players:GetPlayers())
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:GetPlayers()[r].Character.HumanoidRootPart.CFrame
	end
})


toggle = UI:CreateToggle({
	Text = "Sprint: OFF",
	Tab = tab,

	Callback = function(boolean)
		if boolean then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 128
			toggle.Text = "Sprint: ON"
		else
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
			toggle.Text = "Sprint: OFF"
		end
	end
})


esp = UI:CreateKeybind({
	Text = "ESP: OFF",
	Tab = tab,
	DefaultKeybind = Enum.KeyCode.F,
	Toggle = true,

	Callback = function(boolean)
		if boolean then
			for _, player in pairs(game.Players:GetPlayers()) do
				task.spawn(function()
					local h = Instance.new("Highlight")
					h.OutlineTransparency = 1
					h.FillColor = Color3.fromRGB(13, 105, 172)
					h.FillTransparency = 0.2
					h.Parent = player.Character
				end)
			end
			esp.Text = "ESP: ON"
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if player.Character:FindFirstChild("Highlight") then
					player.Character:FindFirstChild("Highlight"):Destroy()
				end
			end
			esp.Text = "ESP: OFF"
		end
	end
})
