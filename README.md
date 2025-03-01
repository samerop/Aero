![AeroBanner](https://github.com/samerop/Aero/blob/main/gallery/Banner.jpg?raw=true)
<div align="center"><img src="https://img.shields.io/badge/voltaikz-blue?style=flat&logo=discord&logoColor=%23ffffff&labelColor=%235865F2&color=%235865F2"/></div>

# Aero UI Library
> [!IMPORTANT]
> Avoid assigning methods to variables directly (e.g., `local button = UI:CreateButton`).
- [Getting Aero](#getting-aero)
- [Creating a Window](#creating-a-window)
- [Creating a Tab](#creating-a-tab)
- [Creating a Button](#creating-a-button)
- [Updating a Button](#updating-a-button)
- [Creating a Toggle](#creating-a-toggle)
- [Creating a Keybind](#creating-a-keybind)
  - [`Toggle` = `true`](#toggle--true)
  - [`Toggle` = `false`](#toggle--false) 
- [Creating a TextBox](#creating-a-textbox)
- [Notifying the Player](#notifying-the-player)
  - [Icon Paths](#icon-paths)
- [Miscellaneous](#miscellaneous)
## Getting Aero
```lua
UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/samerop/Aero/main/source.lua"))()
```
## Creating a Window
```lua
UI:CreateWindow({
  Title = "My Window", -- Title displayed at the top of the window
  Draggable = true -- Should the window be draggable?
})
```
## Creating a Tab
```lua
UI:CreateTab({
  Name = "Main"
})
```
## Creating a Button
```lua
UI:CreateButton({
  Text = "Print", -- Text for the button
  Tab = "Main", -- Tab where the button will be located

  Callback = function()
    print("Hello, World!")
  end
})
```
> [!NOTE]
> The `Text` of the button will also be the name of the button.
## Updating a Button
```lua
UI:UpdateButton({
  Button = "Print", -- Name of the button
  Tab = "Main", -- Name of the tab where the button is located
  Text = "Printed!" -- New text for the button
})
```
## Creating a Toggle
```lua
UI:CreateToggle({
  Text = "Sprint: OFF",
  Tab = "Main",

  Callback = function(boolean) -- Initial state of 'boolean' is true
    if boolean then
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    else
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end,
  TrueText = "Sprint: ON",
  FalseText = "Sprint: OFF"
})
```
## Creating a Keybind
![Keybind](https://github.com/samerop/Aero/blob/main/gallery/KeybindPreview.png?raw=true)
### `Toggle` = `true`
```lua
UI:CreateKeybind({
    Text = "Sprint",
    Tab = "Main",
    DefaultKeybind = Enum.KeyCode.E,
    Toggle = true,

    Callback = function(boolean)
        if boolean then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
})
```
### `Toggle` = `false`
```lua
UI:CreateKeybind({
    Text = "Print",
    Tab = "Main",
    DefaultKeybind = Enum.KeyCode.E,
    Toggle = false,

    Callback = function()
      print("Key pressed!")
    end
})
```
## Creating a TextBox
![TextBox](https://github.com/samerop/Aero/blob/main/gallery/TextBoxPreview.png?raw=true)
```lua
UI:CreateTextBox({
  Text = "Walk Speed",
  Tab = "Main",
  PlaceholderText = "Value",
  Default = 16, -- Value if player leaves TextBox blank (Optional)

  Callback = function(text)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(text)
  end
})
```
> [!NOTE]
> If there is no `Default` and the player leaves TextBox blank, `Callback` won't execute.
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
## Miscellaneous
### Settings
- Click the gear icon in the top-right corner to open settings
- Toggle Aero: Toggle the visibility of Aero (configurable, `LeftControl` is default)
- Destroy Aero: Destroy the Aero UI
