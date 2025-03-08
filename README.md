![AeroBanner](https://github.com/samerop/Aero/blob/main/gallery/Banner.jpg?raw=true)
<div align="center"><img src="https://img.shields.io/badge/voltaikz-blue?style=flat&logo=discord&logoColor=%23ffffff&labelColor=%235865F2&color=%235865F2"/></div>

# Aero UI Library
- [Getting Aero](#getting-aero)
- [Creating a Window](#creating-a-window)
- [Creating a Tab](#creating-a-tab)
- [Creating a Button](#creating-a-button)
- [Creating a Toggle](#creating-a-toggle)
- [Creating a Keybind](#creating-a-keybind)
- [Creating a TextBox](#creating-a-textbox)
- [Updating a Element](#updating-a-element)
- [Notifying the Player](#notifying-the-player)
  - [Icon Paths](#icon-paths)
> [!IMPORTANT]
> Use global variables for methods instead of local (e.g., `button = UI:CreateButton`).
## Getting Aero
```lua
UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/samerop/Aero/main/source.lua"))()
```
## Creating a Window
```lua
UI:CreateWindow({
  Title = "My Window",
  Key = "1234" -- Key system (Optional)
})
```
## Creating a Tab
```lua
mainTab = UI:CreateTab({
  Name = "Main"
})
```
## Creating a Button
```lua
printButton = UI:CreateButton({
    Text = "Print",
    Tab = mainTab,

    Callback = function()
        print("Hello, World!")
    end
})
```
## Creating a Toggle
```lua
sprint = UI:CreateToggle({
    Text = "Sprint: OFF",
    Tab = mainTab,

    Callback = function(boolean)
        if boolean then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 128
            sprint.Text = "Sprint: ON"
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            sprint.Text = "Sprint: OFF"
        end
    end
})
```
## Creating a Keybind
```lua
esp = UI:CreateKeybind({
    Text = "ESP",
    Tab = mainTab,
    DefaultKeybind = Enum.KeyCode.C,
    Toggle = true,
	
    Callback = function(boolean) -- If Toggle is false, you don't need 'boolean'
        if boolean then
            for _, player in pairs(game.Players:GetPlayers()) do
                local h = Instance.new("Highlight")
                h.OutlineTransparency = 1
                h.FillColor = Color3.fromRGB(13, 105, 172)
                h.FillTransparency = 0.2
                h.Parent = player.Character
            end
        else
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character:FindFirstChild("Highlight") then
                    player.Character:FindFirstChild("Highlight"):Destroy()
                end
            end
        end
    end
})
```
## Creating a TextBox
```lua
fov = UI:CreateTextBox({
    Text = "FOV",
    Tab = mainTab,
    PlaceholderText = "1 - 120",
    Default = 70, -- Optional

    Callback = function(text)
        game.Workspace.CurrentCamera.FieldOfView = tonumber(text)
    end
})
```
> [!NOTE]
> If the player leaves TextBox blank, callback will not execute unless a Default value is provided.
## Updating a Element
You can easily update an element using the variable you assigned to it. For example:
```lua
button = UI:CreateButton({
    Text = "Print",
    Tab = mainTab,

    Callback = function()
        print("Hello")
        button.Text = "Successfully printed"
        button.BackgroundColor3 = Color3.new(0, 1, 0)
    end
})
```
## Notifying the Player
![Notification](https://github.com/samerop/Aero/blob/main/gallery/Notification.png?raw=true)
```lua
UI:Notify({
    Title = "Powered by Aero",
    Text = "Welcome",
    Duration = 5,
    Icon = "rbxasset://textures/loading/robloxlogo.png" -- Optional
})
```
> [!NOTE]
> ### `Icon` Paths
> - `rbxassetid://` (user-uploaded assets, requires the asset's ID)
> - `rbxasset://` (built-in Roblox content: `%localappdata%\Roblox\Versions\<version>\content`)
