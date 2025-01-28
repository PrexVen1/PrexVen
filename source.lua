local PrexVen = {}

local Images = {
    Home = "https://raw.githubusercontent.com/HacksCreator102/PrexVen/refs/heads/main/home.png",
    Lua = "https://raw.githubusercontent.com/HacksCreator102/PrexVen/refs/heads/main/66c7e35a-7f9f-4e3f-8098-10d5abec05bc_removalai_preview.png",
    add = "https://raw.githubusercontent.com/HacksCreator102/PrexVen/refs/heads/main/4d58997e-24cd-49d6-8176-b673a1a00cbc_removalai_preview.png",
}

function PrexVen:CreateWindow(settings)
    local window = {}

    window.Name = settings.Name or "PrexVen"
    window.LoadingTitle = settings.LoadingTitle or "Loading"
    window.LoadingSubTitle = settings.LoadingSubTitle or "Loading UI"
    
    local ScreenGUI = Instance.new("ScreenGui")
    ScreenGUI.Parent = game.Players.LocalPlayer.Playergui
    ScreenGUI.ResetOnSpawn = false
    
    window.Frame = Instance.new("Frame")
    window.Frame.Size = UDim2.new(0, 500, 0, 400)
    window.Frame.Position = UDim2.new(0.5, -250, 0.5, -200)
    window.Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    window.Frame.Parent = ScreenGUI
    
    window.Tabs = {}

    window.Discord = {
        Enabled = settings.Discord and settings.Discord.Enabled or false,
        InviteCode = settings.Discord and settings.Discord.InviteCode or ""
    }

    window.Key = {
        Enabled = settings.Key and settings.Key.Enabled or false,
        KeyTitle = settings.Key and settings.Key.KeyTitle or "Key System",
        KeySubTitle = settings.Key and settings.Key.KeySubTitle or "Get your key here:",
        Keys = settings.Key and settings.Key.Keys or {}
    }

    -- Tab Creation Function
    function window:CreateTab(settings)
        if not settings then
            return error("Settings table is required for Tabs")
        end

        local TabName = settings.Name or "Default Tab"
        local IconName = settings.Icon
        local Icon = Images[IconName] or "https://raw.githubusercontent.com/HacksCreator102/PrexVen/refs/heads/main/28ea91a5-772d-486f-8dd2-ff53af15cdbc_removalai_preview.png"

        local tabFrame = Instance.new("Frame")
        tabFrame.Size = UDim2.new(1, 0, 0, 50)
        tabFrame.Position = UDim2.new(0, 0, 0, 50 * (#self.Tabs))
        tabFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        tabFrame.Parent = window.Frame
        
        local tabLabel = Instance.new("TextLabel")
        tabLabel.Text = TabName
        tabLabel.Size = UDim2.new(0, 200, 1, 0)
        tabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabLabel.BackgroundTransparency = 1
        tabLabel.Position = UDim2.new(0, 40, 0, 0)
        tabLabel.Parent = tabFrame

        if Icon then
            local iconImage = Instance.new("ImageLabel")
            iconImage.Size = UDim2.new(0, 30, 0, 30)
            iconImage.Position = UDim2.new(0, 10, 0, 10)
            iconImage.BackgroundTransparency = 1
            iconImage.Image = Icon
            iconImage.Parent = tabFrame
        end

        local tab = {
            Name = TabName,
            Icon = Icon,
            Frame = tabFrame,
            Elements = {}
        }
        
        table.insert(self.Tabs, tab)

        return tab
    end

    -- Button Creation Function
    function window:CreateButton(tab, settings)
        if not settings or not settings.Name or not settings.Callback then
            return error("Button Name and Callback are required")
        end

        local button = Instance.new("TextButton")
        button.Text = settings.Name
        button.Size = UDim2.new(0, 150, 0, 50)
        button.Position = UDim2.new(0, 10, 0, 10 + (#tab.Elements * 60))
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Parent = tab.Frame

        button.MouseButton1Click:Connect(function()
            if settings.Callback then
                settings.Callback()
            end
        end)

        table.insert(tab.Elements, button)
    end

    -- Text Label Creation Function
    function window:CreateTextLabel(tab, settings)
        if not settings or not settings.Message then
            return error("TextLabel Message is required")
        end

        local label = Instance.new("TextLabel")
        label.Text = settings.Message
        label.Size = UDim2.new(0, 200, 0, 50)
        label.Position = UDim2.new(0, 10, 0, 10 + (#tab.Elements * 60))
        label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Parent = tab.Frame

        table.insert(tab.Elements, label)
    end

    -- Image Label Creation Function
    function window:CreateImageLabel(tab, settings)
        if not settings or not settings.Image then
            return error("Image is required for ImageLabel")
        end

        local imageLabel = Instance.new("ImageLabel")
        imageLabel.Size = UDim2.new(0, 100, 0, 100)
        imageLabel.Position = UDim2.new(0, 10, 0, 10 + (#tab.Elements * 110))
        imageLabel.BackgroundTransparency = 1
        imageLabel.Image = settings.Image
        imageLabel.Parent = tab.Frame

        table.insert(tab.Elements, imageLabel)
    end

    -- Slider Creation Function
    function window:CreateSlider(tab, settings)
        if not settings or not settings.Name or not settings.Min or not settings.Max then
            return error("Slider Name, Min, and Max values are required")
        end

        local slider = Instance.new("Frame")
        slider.Size = UDim2.new(0, 200, 0, 50)
        slider.Position = UDim2.new(0, 10, 0, 10 + (#tab.Elements * 60))
        slider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        slider.Parent = tab.Frame

        local sliderLabel = Instance.new("TextLabel")
        sliderLabel.Text = settings.Name
        sliderLabel.Size = UDim2.new(0, 200, 0, 20)
        sliderLabel.Position = UDim2.new(0, 0, 0, 0)
        sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        sliderLabel.BackgroundTransparency = 1
        sliderLabel.Parent = slider

        local sliderBar = Instance.new("Frame")
        sliderBar.Size = UDim2.new(1, 0, 0, 5)
        sliderBar.Position = UDim2.new(0, 0, 0, 20)
        sliderBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sliderBar.Parent = slider

        local sliderThumb = Instance.new("Frame")
        sliderThumb.Size = UDim2.new(0, 10, 0, 10)
        sliderThumb.Position = UDim2.new(0, 0, 0, -2)
        sliderThumb.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        sliderThumb.Parent = sliderBar

        sliderThumb.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                local mousePos = input.Position.X
                local sliderPos = sliderBar.AbsolutePosition.X
                local sliderWidth = sliderBar.AbsoluteSize.X

                local value = math.clamp((mousePos - sliderPos) / sliderWidth, 0, 1)
                sliderThumb.Position = UDim2.new(value, 0, 0, -2)

                if settings.Callback then
                    local scaledValue = settings.Min + (value * (settings.Max - settings.Min))
                    settings.Callback(scaledValue)
                end
            end
        end)

        table.insert(tab.Elements, slider)
    end

    -- Textbox Creation Function
    function window:CreateTextbox(tab, settings)
        if not settings or not settings.Name then
            return error("Textbox Name is required")
        end

        local textbox = Instance.new("TextBox")
        textbox.Text = ""
        textbox.PlaceholderText = settings.Name
        textbox.Size = UDim2.new(0, 200, 0, 50)
        textbox.Position = UDim2.new(0, 10, 0, 10 + (#tab.Elements * 60))
        textbox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
        textbox.Parent = tab.Frame

        textbox.FocusLost:Connect(function()
            if settings.Callback then
                settings.Callback(textbox.Text)
            end
        end)

        table.insert(tab.Elements, textbox)
    end

    return window
end

function PrexVen:notify(title, message, duration)
    duration = duration or 5 -- Default duration is 5 seconds

    -- Create a ScreenGui container
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "Notify.PrexVen"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create a frame for the notification
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.3, 0, 0.1, 0)
    frame.Position = UDim2.new(0.35, 0, 0.9, 0) -- Bottom center of the screen
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(0, 255, 0)
    frame.Parent = screenGui

    -- Add a title label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.5, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextScaled = true
    titleLabel.Parent = frame

    -- Add a message label
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, 0, 0.5, 0)
    messageLabel.Position = UDim2.new(0, 0, 0.5, 0)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    messageLabel.Font = Enum.Font.SourceSans
    messageLabel.TextScaled = true
    messageLabel.Parent = frame

    -- Tween to slide the notification in
    frame.Position = UDim2.new(0.35, 0, 1, 0)
    local tweenService = game:GetService("TweenService")
    local tween = tweenService:Create(frame, TweenInfo.new(0.5), { Position = UDim2.new(0.35, 0, 0.9, 0) })
    tween:Play()

    -- Wait for the duration, then destroy the notification
    task.delay(duration, function()
        local hideTween = tweenService:Create(frame, TweenInfo.new(0.5), { Position = UDim2.new(0.35, 0, 1, 0) })
        hideTween:Play()
        hideTween.Completed:Wait()
        screenGui:Destroy()
    end)
end

return PrexVen
