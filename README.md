# PrexVen
PrexVen is a Roblox UI Library that makes u use it better than any

# Load the Library
```lua
local PrexVen = loadstring(game:Httpget("https://raw.githubusercontent.com/PrexVen1/PrexVen/refs/heads/main/source.lua"))()
```

# Load The Window
```lua
local window = PrexVen:CreateWindow({
    Name = "PrexVen",
    LoadingTitle = "Welcome to PrexVen",
    LoadingSubTitle = "by HacksCreator102 in GitHub",
    
    Discord = { 
        Enabled = false, 
        InviteCode = "your-discord-code" 
    },
    
    Key = { 
        Enabled = false, 
        List = { "12345", "67890", "PREXVEN" } -- Example valid keys
    }
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
Tab:CreateSlider({
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
