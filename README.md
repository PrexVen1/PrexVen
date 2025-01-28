# PrexVen
PrexVen is a Roblox UI Library that makes u use it better than any

# Load the Library
```lua
local PrexVen = loadstring(game:Httpget("https://raw.githubusercontent.com/PrexVen1/PrexVen/refs/heads/main/source.lua"))()
```

# Load The Window
```lua
local mainUI = PrexVen:CreateWindow({
    Name = "My UI",
    LoadingTitle = "Welcome",
    LoadingSubTitle = "Initializing...",
})
```

# Create a Tab
```lua
local Tab = mainUI:CreateTab({
    Name = "Home",
    Icon = "Home",
})
``` 
## There are more Icons
```plain
- Home Icon = Home
- Lua Icon = Lua
- add = add
```
# Create a Button
```lua
Tab:CreateButton({
    Name = "Click Me",
    Callback = function()
        print("Button Clicked!")
    end,
})
```

# Create a Slider
```lua
homeTab:CreateSlider({
    Name = "Volume",
    Min = 0,
    Max = 100,
    Callback = function(value)
        print("Slider Value:", value)
    end,
})
```
# Create a Notification
```lua
PrexVen:notify("Hello", "This is a notification", 3)
```
