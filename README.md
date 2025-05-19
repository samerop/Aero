<div align="center"><img src="https://github.com/samerop/Aero/blob/main/gallery/Preview.png?raw=true"/></div>
<div align="center"><img src="https://img.shields.io/badge/voltaikz-blue?style=flat&logo=discord&logoColor=%23ffffff&labelColor=%235865F2&color=%235865F2"/></div>

# Aero UI Library
- [Getting Aero](#getting-aero)
- [Creating a Window](#creating-a-window)
- [Creating a Tab](#creating-a-tab)
- [Creating a Button](#creating-a-button)
  - [Updating a Button](#updating-a-button)
- [Creating a Toggle](#creating-a-toggle)
  - [Updating a Toggle](#updating-a-toggle)
- [Creating a Keybind](#creating-a-keybind)
  - [Updating a Keybind](#updating-a-keybind)
- [Creating a TextBox](#creating-a-textbox)
  - [Updating a TextBox](#updating-a-textbox)
- [Notifying the Player](#notifying-the-player)
  - [Icon Paths](#icon-paths)
## Getting Aero
```lua
local Aero = loadstring(game:HttpGet("https://raw.githubusercontent.com/samerop/Aero/main/source.lua"))()
```
## Creating a Window
```lua
local Window = Aero:CreateWindow({
    Name = "Window Name",
    Key = "MyKey1234" -- Optional
})
```
## Creating a Tab
```lua
local Tab = Window:CreateTab("Main")
```
## Creating a Button
```lua
local Button = Tab:CreateButton({
    Text = "Button Text",
    Callback = function()

    end
})
```
#### Updating a Button
```lua
Button:Set("NewButtonText")
```
## Creating a Toggle
```lua
local Toggle = Tab:CreateToggle({
    Text = "Toggle",
    CurrentValue = false,
    Callback = function(Value)

    end
})
```
#### Updating a Toggle
```lua
Toggle:Set(true)
```
## Creating a Keybind
```lua
local Keybind = Tab:CreateKeybind({
    Text = "Keybind",
    CurrentKeybind = "F",
    Callback = function()

    end
})
```
#### Updating a Keybind
```lua
Keybind:Set("Q")
```
## Creating a TextBox
```lua
local TextBox = Tab:CreateTextBox({
    Text = "TextBox",
    CurrentValue = "",
    ClearTextOnFocusLost = false,
    PlaceholderText = "Value",
    Callback = function(text)

    end
})
```
#### Updating a TextBox
```lua
TextBox:Set("NewText")
```
## Notifying the Player
```lua
Aero:Notify({
    Title = "Title",
    Text = "Text",
    Duration = 4,
    Icon = "ICON_PATH_HERE" -- Optional
})
```
> [!NOTE]
> ### Icon Paths
> - `rbxassetid://` (user-uploaded assets, requires the asset's ID)
> - `rbxasset://` (built-in Roblox content: `%localappdata%\Roblox\Versions\<version>\content`)