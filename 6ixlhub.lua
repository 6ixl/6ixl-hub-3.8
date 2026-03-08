-- 6ixl Hub
-- Стильный хаб с прозрачным фоном

local sixlHub = {
    Executor = identifyexecutor and identifyexecutor() or "6ixl",
    Version = "3.8",
    Author = "6ixl Community"
}

-- Сервисы
local SoundService = game:GetService("SoundService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Звуки
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://140387697208266"
ClickSound.Volume = 0.7
ClickSound.Parent = SoundService

local ButtonSound = Instance.new("Sound")
ButtonSound.SoundId = "rbxassetid://103307955424380"
ButtonSound.Volume = 0.8
ButtonSound.Parent = SoundService

local StartupSound = Instance.new("Sound")
StartupSound.SoundId = "rbxassetid://-1"
StartupSound.Volume = 0.5
StartupSound.Parent = SoundService

local MinimizeSound = Instance.new("Sound")
MinimizeSound.SoundId = "rbxassetid://140387697208266"
MinimizeSound.Volume = 0.5
MinimizeSound.Parent = SoundService

local CloseSound = Instance.new("Sound")
CloseSound.SoundId = "rbxassetid://140387697208266"
CloseSound.Volume = 0.5
CloseSound.Parent = SoundService

local NotificationSound = Instance.new("Sound")
NotificationSound.SoundId = "rbxassetid://138118203571469"
NotificationSound.Volume = 0.4
NotificationSound.Parent = SoundService

-- Настройки по умолчанию
local Settings = {
    SoundEnabled = true,
    ButtonSoundsEnabled = true,
    Theme = "Amethyst",
    Notifications = true,
    ToggleKey = Enum.KeyCode.K,
    CustomSize = {Width = 550, Height = 650},
    Font = "GothamBlack",
    ButtonStyle = "Default"  -- Default, Round, Square
}

-- Доступные шрифты
local AvailableFonts = {
    "GothamBlack",
    "SourceSansBold", 
    "Arial",
    "Code",
    "Highway",
    "SciFi"
}

-- Стили кнопок
local ButtonStyles = {
    ["Default"] = {
        CornerRadius = UDim.new(0, 10),
        TextSize = 13
    },
    ["Round"] = {
        CornerRadius = UDim.new(1, 0),
        TextSize = 14
    },
    ["Square"] = {
        CornerRadius = UDim.new(0, 4),
        TextSize = 12
    }
}

-- Цветовые темы с прозрачным фоном
local Themes = {
    ["Amethyst"] = {
        MainBackground = Color3.fromRGB(40, 25, 60),
        MainBackgroundTransparency = 0.5,
        TopBar = Color3.fromRGB(75, 35, 110),
        TopBarTransparency = 0.5,
        TabBackground = Color3.fromRGB(55, 30, 85),
        TabBackgroundTransparency = 0.5,
        ContentBackground = Color3.fromRGB(45, 25, 70),
        ContentBackgroundTransparency = 0.5,
        ScrollBackground = Color3.fromRGB(50, 30, 80),
        ScrollBackgroundTransparency = 0.5,
        ButtonNormal = Color3.fromRGB(180, 150, 255),
        ButtonActive = Color3.fromRGB(160, 130, 230),
        Accent = Color3.fromRGB(160, 100, 255),
        Text = Color3.fromRGB(255, 255, 255),
        ButtonText = Color3.fromRGB(0, 0, 0),
        CloseButton = Color3.fromRGB(220, 80, 100),
        MinimizeButton = Color3.fromRGB(30, 60, 120),
        ResizeButton = Color3.fromRGB(160, 100, 255),
        Shadow = Color3.fromRGB(0, 0, 0)
    },
    ["Night"] = {
        MainBackground = Color3.fromRGB(15, 15, 20),
        MainBackgroundTransparency = 0.5,
        TopBar = Color3.fromRGB(25, 25, 35),
        TopBarTransparency = 0.5,
        TabBackground = Color3.fromRGB(20, 20, 30),
        TabBackgroundTransparency = 0.5,
        ContentBackground = Color3.fromRGB(18, 18, 25),
        ContentBackgroundTransparency = 0.5,
        ScrollBackground = Color3.fromRGB(22, 22, 32),
        ScrollBackgroundTransparency = 0.5,
        ButtonNormal = Color3.fromRGB(45, 95, 150),
        ButtonActive = Color3.fromRGB(55, 105, 160),
        Accent = Color3.fromRGB(75, 125, 180),
        Text = Color3.fromRGB(220, 220, 255),
        ButtonText = Color3.fromRGB(255, 255, 255),
        CloseButton = Color3.fromRGB(180, 60, 60),
        MinimizeButton = Color3.fromRGB(20, 50, 90),
        ResizeButton = Color3.fromRGB(75, 125, 180),
        Shadow = Color3.fromRGB(0, 0, 0)
    },
    ["Miami"] = {
        MainBackground = Color3.fromRGB(30, 15, 40),
        MainBackgroundTransparency = 0.5,
        TopBar = Color3.fromRGB(210, 60, 140),
        TopBarTransparency = 0.5,
        TabBackground = Color3.fromRGB(120, 40, 140),
        TabBackgroundTransparency = 0.5,
        ContentBackground = Color3.fromRGB(50, 25, 80),
        ContentBackgroundTransparency = 0.5,
        ScrollBackground = Color3.fromRGB(80, 35, 120),
        ScrollBackgroundTransparency = 0.5,
        ButtonNormal = Color3.fromRGB(255, 150, 200),
        ButtonActive = Color3.fromRGB(235, 130, 180),
        Accent = Color3.fromRGB(0, 200, 255),
        Text = Color3.fromRGB(255, 255, 255),
        ButtonText = Color3.fromRGB(0, 0, 0),
        CloseButton = Color3.fromRGB(255, 50, 100),
        MinimizeButton = Color3.fromRGB(50, 150, 255),
        ResizeButton = Color3.fromRGB(0, 200, 255),
        Shadow = Color3.fromRGB(0, 0, 0)
    }
}

-- Функция для воспроизведения звука кнопки
local function playButtonSound()
    if Settings.SoundEnabled and Settings.ButtonSoundsEnabled then
        ButtonSound:Play()
    end
end

local function playClickSound()
    if Settings.SoundEnabled then
        ClickSound:Play()
    end
end

local function playStartupSound()
    if Settings.SoundEnabled then
        StartupSound:Play()
    end
end

local function playMinimizeSound()
    if Settings.SoundEnabled then
        MinimizeSound:Play()
    end
end

local function playCloseSound()
    if Settings.SoundEnabled then
        CloseSound:Play()
    end
end

local function playNotificationSound()
    if Settings.SoundEnabled then
        NotificationSound:Play()
    end
end

-- Система визуальных уведомлений
local NotificationGui = Instance.new("ScreenGui")
NotificationGui.Name = "6ixlNotifications"
NotificationGui.Parent = game.CoreGui
NotificationGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NotificationGui.IgnoreGuiInset = true

local function showNotification(title, text, duration)
    if not Settings.Notifications then return end
    
    duration = duration or 1
    playNotificationSound()
    
    local NotificationFrame = Instance.new("Frame")
    local NotificationCorner = Instance.new("UICorner")
    local NotificationGradient = Instance.new("UIGradient")
    local NotificationShadow = Instance.new("ImageLabel")
    local TitleLabel = Instance.new("TextLabel")
    local TextLabel = Instance.new("TextLabel")
    
    NotificationFrame.Parent = NotificationGui
    NotificationFrame.Size = UDim2.new(0, 400, 0, 80)
    NotificationFrame.Position = UDim2.new(0.5, -200, 0, -100)
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 15, 45)
    NotificationFrame.BackgroundTransparency = 0.1
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.ZIndex = 1000
    
    NotificationCorner.Parent = NotificationFrame
    NotificationCorner.CornerRadius = UDim.new(0, 12)
    
    NotificationGradient.Parent = NotificationFrame
    NotificationGradient.Rotation = 90
    NotificationGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 25, 70)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 35, 110))
    })
    
    NotificationShadow.Parent = NotificationFrame
    NotificationShadow.Size = UDim2.new(1, 10, 1, 10)
    NotificationShadow.Position = UDim2.new(0, -5, 0, -5)
    NotificationShadow.BackgroundTransparency = 1
    NotificationShadow.Image = "rbxassetid://5554236805"
    NotificationShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    NotificationShadow.ImageTransparency = 0.8
    NotificationShadow.ScaleType = Enum.ScaleType.Slice
    NotificationShadow.SliceCenter = Rect.new(23, 23, 277, 277)
    NotificationShadow.ZIndex = 999
    
    TitleLabel.Parent = NotificationFrame
    TitleLabel.Size = UDim2.new(1, -20, 0, 30)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Text = title
    TitleLabel.Font = Enum.Font.GothamBlack
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 1001
    
    TextLabel.Parent = NotificationFrame
    TextLabel.Size = UDim2.new(1, -20, 0, 40)
    TextLabel.Position = UDim2.new(0, 10, 0, 35)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
    TextLabel.Text = text
    TextLabel.Font = Enum.Font.Gotham
    TextLabel.TextSize = 14
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextWrapped = true
    TextLabel.ZIndex = 1001
    
    local fadeIn = TweenService:Create(NotificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -200, 0, 20)
    })
    fadeIn:Play()
    
    task.wait(duration)
    
    local fadeOut = TweenService:Create(NotificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -200, 0, -100)
    })
    fadeOut:Play()
    
    fadeOut.Completed:Connect(function()
        NotificationFrame:Destroy()
    end)
end

-- Функция для безопасного выполнения
function sixlHub:ExecuteScript(scriptCode, scriptName, categoryName)
    if not scriptCode then return end
    
    showNotification("6ixl Hub - " .. categoryName, "🚀 Executing " .. scriptName .. "...", 1)
    
    local success, err = pcall(function()
        loadstring(scriptCode)()
    end)
    
    if success then
        showNotification("6ixl Hub - " .. categoryName, "✅ " .. scriptName .. " started!", 1)
    else
        warn("[6ixlHub] Error: " .. tostring(err))
        showNotification("6ixl Hub - " .. categoryName, "❌ Error: " .. tostring(err), 2)
    end
end

-- Обновленный список скриптов
local Scripts = {
    ["Various"] = {
        {
            Name = "Infinite Yield",
            Code = [[
                loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
            ]]
        },
        {
            Name = "ESP",
            Code = [[
                loadstring(game:HttpGet("https://raw.githubusercontent.com/nz728665/AIscripts/refs/heads/main/ColdWarMenu.lua"))("t.me/cherru_script")
            ]]
        },
        {
            Name = "Anti-AFK",
            Code = [[
                loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))()
            ]]
        },
        {
            Name = "Invisible",
            Code = [[
                loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
            ]]
        },
        {
            Name = "Aimbot",
            Code = [[
                loadstring(game:HttpGet("https://pastebin.com/raw/qGJnSYeM", true))()
            ]]
        },
        {
            Name = "Universal Settings",
            Code = [[
                loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-universal-settings-v2-70793"))()
            ]]
        }
    },
    
    ["Evade"] = {
        {
            Name = "Speed Hack",
            Code = [[
                loadstring(game:HttpGet("https://raw.githubusercontent.com/thesigmacorex/RobloxScripts/main/speedhax"))()
            ]]
        }
    },
    
    ["VD"] = {
        {
            Name = "Violence District",
            Code = [[
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TexRBLX/Roblox-stuff/refs/heads/main/violence-district/script.lua"))()
            ]]
        }
    },
    
    ["MM2"] = {
        {
            Name = "Vertex",
            Code = [[
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring"))()
            ]]
        }
    },
    
    ["BH"] = {
        {
            Name = "Soluna",
            Code = [[
                loadstring(game:HttpGet("https://soluna-script.vercel.app/brookhaven.lua",true))()
            ]]
        }
    }
}

-- Функция для получения названий настроек (без Show Metrics)
local function getSettingsNames()
    return {
        {
            Name = "Sounds: " .. (Settings.SoundEnabled and "ON" or "OFF"),
            Description = "Enable/disable all sounds",
            Code = "SETTINGS_TOGGLE_SOUND"
        },
        {
            Name = "Notifications: " .. (Settings.Notifications and "ON" or "OFF"),
            Description = "Show notifications",
            Code = "SETTINGS_TOGGLE_NOTIFICATIONS"
        },
        {
            Name = "Theme: " .. Settings.Theme,
            Description = "Change color theme",
            Code = "SETTINGS_CHANGE_THEME"
        },
        {
            Name = "Font: " .. Settings.Font,
            Description = "Change text font",
            Code = "SETTINGS_CHANGE_FONT"
        },
        {
            Name = "Button Style: " .. Settings.ButtonStyle,
            Description = "Change button style (Default/Round/Square)",
            Code = "SETTINGS_BUTTON_STYLE"
        }
    }
end

-- Функция для получения Enum.Font из названия
local function getFontFromName(fontName)
    local fontMap = {
        ["GothamBlack"] = Enum.Font.GothamBlack,
        ["SourceSansBold"] = Enum.Font.SourceSansBold,
        ["Arial"] = Enum.Font.Arial,
        ["Code"] = Enum.Font.Code,
        ["Highway"] = Enum.Font.Highway,
        ["SciFi"] = Enum.Font.SciFi
    }
    return fontMap[fontName] or Enum.Font.GothamBlack
end

-- Переменные для GUI
local ScreenGui = nil
local GuiEnabled = true
local ScriptRunning = true
local isMinimized = false
local currentTab = "Various"
local MainFrame = nil
local MainShadow = nil
local ResizeHandle = nil

-- Функция для создания загрузочного экрана
local function createSplashScreen()
    local SplashGui = Instance.new("ScreenGui")
    SplashGui.Name = "6ixlSplash"
    SplashGui.Parent = game.CoreGui
    SplashGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    SplashGui.IgnoreGuiInset = true
    
    if Settings.SoundEnabled then
        StartupSound:Play()
    end
    
    local Background = Instance.new("Frame")
    Background.Parent = SplashGui
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.Position = UDim2.new(0, 0, 0, 0)
    Background.BackgroundColor3 = Color3.fromRGB(30, 15, 45)
    Background.BackgroundTransparency = 0.3
    Background.BorderSizePixel = 0
    Background.ZIndex = 10
    
    local Gradient = Instance.new("UIGradient")
    Gradient.Parent = Background
    Gradient.Rotation = 90
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 20, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 30, 90))
    })
    
    local Logo = Instance.new("TextLabel")
    Logo.Parent = SplashGui
    Logo.Size = UDim2.new(0, 600, 0, 120)
    Logo.Position = UDim2.new(0.5, -300, 0.5, -100)
    Logo.BackgroundTransparency = 1
    Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    Logo.Text = "6IXL HUB"
    Logo.Font = Enum.Font.GothamBlack
    Logo.TextSize = 80
    Logo.TextStrokeTransparency = 0.5
    Logo.TextStrokeColor3 = Color3.fromRGB(160, 100, 255)
    Logo.ZIndex = 11
    
    local LoadingText = Instance.new("TextLabel")
    LoadingText.Parent = SplashGui
    LoadingText.Size = UDim2.new(0, 200, 0, 40)
    LoadingText.Position = UDim2.new(0.5, -100, 0.5, 30)
    LoadingText.BackgroundTransparency = 1
    LoadingText.TextColor3 = Color3.fromRGB(200, 180, 255)
    LoadingText.Text = "LOADING"
    LoadingText.Font = Enum.Font.GothamBlack
    LoadingText.TextSize = 30
    LoadingText.ZIndex = 11
    
    local BarContainer = Instance.new("Frame")
    BarContainer.Parent = SplashGui
    BarContainer.Size = UDim2.new(0, 400, 0, 20)
    BarContainer.Position = UDim2.new(0.5, -200, 0.5, 80)
    BarContainer.BackgroundColor3 = Color3.fromRGB(80, 50, 120)
    BarContainer.BackgroundTransparency = 0.5
    BarContainer.BorderSizePixel = 0
    BarContainer.ZIndex = 11
    BarContainer.ClipsDescendants = true
    
    local ContainerCorner = Instance.new("UICorner")
    ContainerCorner.Parent = BarContainer
    ContainerCorner.CornerRadius = UDim.new(0, 10)
    
    local ProgressBar = Instance.new("Frame")
    ProgressBar.Parent = BarContainer
    ProgressBar.Size = UDim2.new(0, 0, 1, 0)
    ProgressBar.Position = UDim2.new(0, 0, 0, 0)
    ProgressBar.BackgroundColor3 = Color3.fromRGB(180, 150, 255)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.ZIndex = 12
    
    local ProgressCorner = Instance.new("UICorner")
    ProgressCorner.Parent = ProgressBar
    ProgressCorner.CornerRadius = UDim.new(0, 10)
    
    local Icon = Instance.new("TextLabel")
    Icon.Parent = ProgressBar
    Icon.Size = UDim2.new(0, 20, 0, 20)
    Icon.Position = UDim2.new(1, -20, 0.5, -10)
    Icon.BackgroundTransparency = 1
    Icon.Text = "🚀"
    Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    Icon.Font = Enum.Font.Gotham
    Icon.TextSize = 16
    Icon.ZIndex = 13
    
    Logo.TextTransparency = 1
    LoadingText.TextTransparency = 1
    BarContainer.BackgroundTransparency = 1
    ProgressBar.BackgroundTransparency = 1
    
    TweenService:Create(Logo, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    }):Play()
    
    TweenService:Create(LoadingText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    }):Play()
    
    TweenService:Create(BarContainer, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.5
    }):Play()
    
    TweenService:Create(ProgressBar, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0
    }):Play()
    
    local loadTween = TweenService:Create(ProgressBar, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        Size = UDim2.new(1, 0, 1, 0)
    })
    
    loadTween:Play()
    
    return SplashGui, loadTween, Logo, LoadingText, BarContainer, ProgressBar
end

-- Функция для полного выключения GUI
local function disableGUI()
    if ScreenGui then
        ScreenGui:Destroy()
        ScreenGui = nil
    end
    GuiEnabled = false
    ScriptRunning = false
end

-- Создание красивого GUI с темами
function sixlHub:CreateGUI()
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = "6ixlHub"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true
    
    MainFrame = Instance.new("Frame")
    local MainCorner = Instance.new("UICorner")
    MainShadow = Instance.new("ImageLabel")
    
    local TopBar = Instance.new("Frame")
    local TopBarCorner = Instance.new("UICorner")
    local TopBarGradient = Instance.new("UIGradient")
    
    local Title = Instance.new("TextLabel")
    local TitleShadow = Instance.new("TextLabel")
    
    local CloseButton = Instance.new("TextButton")
    local CloseCorner = Instance.new("UICorner")
    local CloseGradient = Instance.new("UIGradient")
    
    local MinimizeButton = Instance.new("TextButton")
    local MinimizeCorner = Instance.new("UICorner")
    local MinimizeGradient = Instance.new("UIGradient")
    
    ResizeHandle = Instance.new("TextButton")
    local ResizeCorner = Instance.new("UICorner")
    
    local TabButtonsFrame = Instance.new("Frame")
    local TabButtonsCorner = Instance.new("UICorner")
    local TabButtonsGradient = Instance.new("UIGradient")
    local TabButtonsScroll = Instance.new("ScrollingFrame")
    local TabButtonsLayout = Instance.new("UIListLayout")
    
    local ContentFrame = Instance.new("Frame")
    local ContentCorner = Instance.new("UICorner")
    local ContentGradient = Instance.new("UIGradient")
    
    local ScrollFrame = Instance.new("ScrollingFrame")
    local ScrollCorner = Instance.new("UICorner")
    local ScrollGradient = Instance.new("UIGradient")
    
    local UIListLayout = Instance.new("UIListLayout")
    
    -- Получаем текущую цветовую палитру
    local function getCurrentTheme()
        return Themes[Settings.Theme] or Themes["Amethyst"]
    end
    
    local ColorPalette = getCurrentTheme()
    local currentFont = getFontFromName(Settings.Font)
    local buttonStyle = ButtonStyles[Settings.ButtonStyle] or ButtonStyles["Default"]
    
    -- Тень для основного фрейма
    MainShadow.Parent = ScreenGui
    MainShadow.Size = UDim2.new(0, Settings.CustomSize.Width + 20, 0, Settings.CustomSize.Height + 20)
    MainShadow.Position = UDim2.new(0.5, -(Settings.CustomSize.Width/2 + 10), 0.5, -(Settings.CustomSize.Height/2 + 10))
    MainShadow.BackgroundTransparency = 1
    MainShadow.Image = "rbxassetid://5554236805"
    MainShadow.ImageColor3 = ColorPalette.Shadow
    MainShadow.ImageTransparency = 0.8
    MainShadow.ScaleType = Enum.ScaleType.Slice
    MainShadow.SliceCenter = Rect.new(23, 23, 277, 277)
    MainShadow.ZIndex = 0
    
    -- Основной фрейм
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.BackgroundColor3 = ColorPalette.MainBackground
    MainFrame.BackgroundTransparency = ColorPalette.MainBackgroundTransparency
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.ZIndex = 1
    
    MainCorner.Parent = MainFrame
    MainCorner.CornerRadius = UDim.new(0, 15)
    
    -- Верхняя панель
    TopBar.Parent = MainFrame
    TopBar.Size = UDim2.new(1, 0, 0, 60)
    TopBar.Position = UDim2.new(0, 0, 0, 0)
    TopBar.BackgroundColor3 = ColorPalette.TopBar
    TopBar.BackgroundTransparency = ColorPalette.TopBarTransparency
    TopBar.BorderSizePixel = 0
    
    TopBarCorner.Parent = TopBar
    TopBarCorner.CornerRadius = UDim.new(0, 15)
    
    TopBarGradient.Parent = TopBar
    TopBarGradient.Rotation = 90
    TopBarGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ColorPalette.TopBar),
        ColorSequenceKeypoint.new(1, ColorPalette.Accent)
    })
    
    -- Заголовок с тенью
    TitleShadow.Parent = TopBar
    TitleShadow.Size = UDim2.new(1, 0, 1, 0)
    TitleShadow.Position = UDim2.new(0, 2, 0, 2)
    TitleShadow.BackgroundTransparency = 1
    TitleShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
    TitleShadow.TextTransparency = 0.8
    TitleShadow.Text = "6ixl Hub v" .. sixlHub.Version
    TitleShadow.Font = currentFont
    TitleShadow.TextSize = 20
    TitleShadow.TextXAlignment = Enum.TextXAlignment.Center
    TitleShadow.TextYAlignment = Enum.TextYAlignment.Center
    TitleShadow.ZIndex = 1
    
    Title.Parent = TopBar
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = ColorPalette.Text
    Title.Text = "6ixl Hub v" .. sixlHub.Version
    Title.Font = currentFont
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Center
    Title.TextYAlignment = Enum.TextYAlignment.Center
    Title.ZIndex = 2
    
    -- Кнопка свертывания
    MinimizeButton.Parent = TopBar
    MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
    MinimizeButton.Position = UDim2.new(1, -80, 0.5, -17)
    MinimizeButton.BackgroundColor3 = ColorPalette.MinimizeButton
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.Text = "−"
    MinimizeButton.Font = Enum.Font.GothamBlack
    MinimizeButton.TextSize = 22
    MinimizeButton.AutoButtonColor = false
    MinimizeButton.ZIndex = 2
    
    MinimizeCorner.Parent = MinimizeButton
    MinimizeCorner.CornerRadius = buttonStyle.CornerRadius
    
    MinimizeGradient.Parent = MinimizeButton
    MinimizeGradient.Rotation = 90
    MinimizeGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ColorPalette.MinimizeButton),
        ColorSequenceKeypoint.new(1, ColorPalette.Accent)
    })
    
    -- Кнопка закрытия
    CloseButton.Parent = TopBar
    CloseButton.Size = UDim2.new(0, 35, 0, 35)
    CloseButton.Position = UDim2.new(1, -40, 0.5, -17)
    CloseButton.BackgroundColor3 = ColorPalette.CloseButton
    CloseButton.TextColor3 = ColorPalette.Text
    CloseButton.Text = "×"
    CloseButton.Font = Enum.Font.GothamBlack
    CloseButton.TextSize = 22
    CloseButton.AutoButtonColor = false
    CloseButton.ZIndex = 2
    
    CloseCorner.Parent = CloseButton
    CloseCorner.CornerRadius = buttonStyle.CornerRadius
    
    CloseGradient.Parent = CloseButton
    CloseGradient.Rotation = 90
    CloseGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ColorPalette.CloseButton),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 100))
    })
    
    -- Ручка изменения размера в нижнем углу
    ResizeHandle.Parent = MainFrame
    ResizeHandle.Size = UDim2.new(0, 20, 0, 20)
    ResizeHandle.Position = UDim2.new(1, -20, 1, -20)
    ResizeHandle.BackgroundColor3 = ColorPalette.ResizeButton
    ResizeHandle.Text = "◢"
    ResizeHandle.TextColor3 = ColorPalette.Text
    ResizeHandle.Font = Enum.Font.GothamBlack
    ResizeHandle.TextSize = 16
    ResizeHandle.AutoButtonColor = false
    ResizeHandle.ZIndex = 10
    ResizeHandle.BorderSizePixel = 0
    
    ResizeCorner.Parent = ResizeHandle
    ResizeCorner.CornerRadius = UDim.new(0, 4)
    
    -- Панель табов с прокруткой
    TabButtonsFrame.Parent = MainFrame
    TabButtonsFrame.Size = UDim2.new(1, -20, 0, 60)
    TabButtonsFrame.Position = UDim2.new(0, 10, 0, 70)
    TabButtonsFrame.BackgroundColor3 = ColorPalette.TabBackground
    TabButtonsFrame.BackgroundTransparency = ColorPalette.TabBackgroundTransparency
    TabButtonsFrame.BorderSizePixel = 0
    TabButtonsFrame.ClipsDescendants = true
    
    TabButtonsCorner.Parent = TabButtonsFrame
    TabButtonsCorner.CornerRadius = UDim.new(0, 10)
    
    TabButtonsGradient.Parent = TabButtonsFrame
    TabButtonsGradient.Rotation = 90
    TabButtonsGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ColorPalette.TabBackground),
        ColorSequenceKeypoint.new(1, ColorPalette.Accent)
    })
    
    TabButtonsScroll.Parent = TabButtonsFrame
    TabButtonsScroll.Size = UDim2.new(1, -10, 1, -10)
    TabButtonsScroll.Position = UDim2.new(0, 5, 0, 5)
    TabButtonsScroll.BackgroundTransparency = 1
    TabButtonsScroll.BorderSizePixel = 0
    TabButtonsScroll.ScrollBarThickness = 6
    TabButtonsScroll.ScrollBarImageColor3 = ColorPalette.Accent
    TabButtonsScroll.CanvasSize = UDim2.new(2, 0, 0, 0)
    
    TabButtonsLayout.Parent = TabButtonsScroll
    TabButtonsLayout.FillDirection = Enum.FillDirection.Horizontal
    TabButtonsLayout.Padding = UDim.new(0, 10)
    TabButtonsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Контентная область
    ContentFrame.Parent = MainFrame
    ContentFrame.Size = UDim2.new(1, -20, 1, -150)
    ContentFrame.Position = UDim2.new(0, 10, 0, 140)
    ContentFrame.BackgroundColor3 = ColorPalette.ContentBackground
    ContentFrame.BackgroundTransparency = ColorPalette.ContentBackgroundTransparency
    ContentFrame.BorderSizePixel = 0
    
    ContentCorner.Parent = ContentFrame
    ContentCorner.CornerRadius = UDim.new(0, 10)
    
    ContentGradient.Parent = ContentFrame
    ContentGradient.Rotation = 90
    ContentGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ColorPalette.ContentBackground),
        ColorSequenceKeypoint.new(1, ColorPalette.Accent)
    })
    
    -- Скролл фрейм
    ScrollFrame.Parent = ContentFrame
    ScrollFrame.Size = UDim2.new(1, -15, 1, -15)
    ScrollFrame.Position = UDim2.new(0, 8, 0, 8)
    ScrollFrame.BackgroundColor3 = ColorPalette.ScrollBackground
    ScrollFrame.BackgroundTransparency = ColorPalette.ScrollBackgroundTransparency
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.ScrollBarThickness = 8
    ScrollFrame.ScrollBarImageColor3 = ColorPalette.Accent
    ScrollFrame.ScrollBarImageTransparency = 0.5
    
    ScrollCorner.Parent = ScrollFrame
    ScrollCorner.CornerRadius = UDim.new(0, 8)
    
    ScrollGradient.Parent = ScrollFrame
    ScrollGradient.Rotation = 90
    ScrollGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ColorPalette.ScrollBackground),
        ColorSequenceKeypoint.new(1, ColorPalette.Accent)
    })
    
    UIListLayout.Parent = ScrollFrame
    UIListLayout.Padding = UDim.new(0, 15)
    
    -- Анимация открытия
    local openTween = TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, Settings.CustomSize.Width, 0, Settings.CustomSize.Height),
        Position = UDim2.new(0.5, -Settings.CustomSize.Width/2, 0.5, -Settings.CustomSize.Height/2)
    })
    openTween:Play()
    
    TweenService:Create(MainShadow, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, Settings.CustomSize.Width + 20, 0, Settings.CustomSize.Height + 20),
        Position = UDim2.new(0.5, -(Settings.CustomSize.Width/2 + 10), 0.5, -(Settings.CustomSize.Height/2 + 10))
    }):Play()
    
    -- Функция сворачивания
    local function toggleMinimize()
        if not ScriptRunning then return end
        playMinimizeSound()
        
        isMinimized = not isMinimized
        
        if isMinimized then
            local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            TweenService:Create(MainFrame, tweenInfo, {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }):Play()
            
            TweenService:Create(MainShadow, tweenInfo, {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }):Play()
            
            MinimizeButton.Text = "+"
        else
            local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            TweenService:Create(MainFrame, tweenInfo, {
                Size = UDim2.new(0, Settings.CustomSize.Width, 0, Settings.CustomSize.Height),
                Position = UDim2.new(0.5, -Settings.CustomSize.Width/2, 0.5, -Settings.CustomSize.Height/2)
            }):Play()
            
            TweenService:Create(MainShadow, tweenInfo, {
                Size = UDim2.new(0, Settings.CustomSize.Width + 20, 0, Settings.CustomSize.Height + 20),
                Position = UDim2.new(0.5, -(Settings.CustomSize.Width/2 + 10), 0.5, -(Settings.CustomSize.Height/2 + 10))
            }):Play()
            
            MinimizeButton.Text = "−"
        end
    end
    
    MinimizeButton.MouseButton1Click:Connect(toggleMinimize)
    
    -- Горячая клавиша
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not ScriptRunning then return end
        if gameProcessed then return end
        
        if input.KeyCode == Settings.ToggleKey then
            playMinimizeSound()
            toggleMinimize()
        end
    end)
    
    -- Закрытие
    CloseButton.MouseButton1Click:Connect(function()
        if not ScriptRunning then return end
        
        playCloseSound()
        ScriptRunning = false
        
        local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        local closeTween = TweenService:Create(MainFrame, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        closeTween:Play()
        
        TweenService:Create(MainShadow, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        
        closeTween.Completed:Connect(function()
            disableGUI()
        end)
    end)
    
    -- Перетаскивание
    local dragging = false
    local dragStart = nil
    local startPosition = nil
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPosition = MainFrame.Position
        end
    end)
    
    TopBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
            MainShadow.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X - 10,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y - 10
            )
        end
    end)
    
    -- Изменение размера через нижний угол
    local resizing = false
    local resizeStart = nil
    local startSize = nil
    local startPosition = nil
    
    ResizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = true
            resizeStart = input.Position
            startSize = MainFrame.Size
            startPosition = MainFrame.Position
        end
    end)
    
    ResizeHandle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = false
            Settings.CustomSize.Width = MainFrame.Size.X.Offset
            Settings.CustomSize.Height = MainFrame.Size.Y.Offset
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - resizeStart
            local newWidth = math.max(400, startSize.X.Offset + delta.X)
            local newHeight = math.max(500, startSize.Y.Offset + delta.Y)
            
            MainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
            MainShadow.Size = UDim2.new(0, newWidth + 20, 0, newHeight + 20)
        end
    end)
    
    -- Функция для применения темы
    local function applyTheme()
        ColorPalette = getCurrentTheme()
        currentFont = getFontFromName(Settings.Font)
        buttonStyle = ButtonStyles[Settings.ButtonStyle] or ButtonStyles["Default"]
        
        MainFrame.BackgroundColor3 = ColorPalette.MainBackground
        MainFrame.BackgroundTransparency = ColorPalette.MainBackgroundTransparency
        MainShadow.ImageColor3 = ColorPalette.Shadow
        
        TopBar.BackgroundColor3 = ColorPalette.TopBar
        TopBar.BackgroundTransparency = ColorPalette.TopBarTransparency
        TopBarGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, ColorPalette.TopBar),
            ColorSequenceKeypoint.new(1, ColorPalette.Accent)
        })
        
        TabButtonsFrame.BackgroundColor3 = ColorPalette.TabBackground
        TabButtonsFrame.BackgroundTransparency = ColorPalette.TabBackgroundTransparency
        TabButtonsGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, ColorPalette.TabBackground),
            ColorSequenceKeypoint.new(1, ColorPalette.Accent)
        })
        
        ContentFrame.BackgroundColor3 = ColorPalette.ContentBackground
        ContentFrame.BackgroundTransparency = ColorPalette.ContentBackgroundTransparency
        ContentGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, ColorPalette.ContentBackground),
            ColorSequenceKeypoint.new(1, ColorPalette.Accent)
        })
        
        ScrollFrame.BackgroundColor3 = ColorPalette.ScrollBackground
        ScrollFrame.BackgroundTransparency = ColorPalette.ScrollBackgroundTransparency
        ScrollFrame.ScrollBarImageColor3 = ColorPalette.Accent
        ScrollGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, ColorPalette.ScrollBackground),
            ColorSequenceKeypoint.new(1, ColorPalette.Accent)
        })
        
        CloseButton.BackgroundColor3 = ColorPalette.CloseButton
        CloseGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, ColorPalette.CloseButton),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 100))
        })
        
        MinimizeButton.BackgroundColor3 = ColorPalette.MinimizeButton
        MinimizeGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, ColorPalette.MinimizeButton),
            ColorSequenceKeypoint.new(1, ColorPalette.Accent)
        })
        
        ResizeHandle.BackgroundColor3 = ColorPalette.ResizeButton
        
        Title.TextColor3 = ColorPalette.Text
        Title.Font = currentFont
        TitleShadow.Font = currentFont
        
        -- Обновляем шрифты и скругления всех элементов
        for _, child in pairs(ScreenGui:GetDescendants()) do
            if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                child.Font = currentFont
            end
            if child:IsA("TextButton") then
                local corner = child:FindFirstChildOfClass("UICorner")
                if corner then
                    corner.CornerRadius = buttonStyle.CornerRadius
                end
            end
        end
        
        if currentTab == "Settings" then
            sixlHub:UpdateScriptsList(ScrollFrame, UIListLayout, currentTab)
        end
    end
    
    -- Создание кнопок табов
    local tabs = {"Various", "Evade", "VD", "MM2", "BH", "Settings"}
    
    local function createTabButton(tabName)
        local TabButton = Instance.new("TextButton")
        local TabCorner = Instance.new("UICorner")
        local TabGradient = Instance.new("UIGradient")
        
        TabButton.Parent = TabButtonsScroll
        TabButton.Size = UDim2.new(0, 120, 0, 45)
        TabButton.BackgroundColor3 = tabName == currentTab and ColorPalette.ButtonActive or ColorPalette.ButtonNormal
        TabButton.TextColor3 = ColorPalette.ButtonText
        TabButton.Text = tabName
        TabButton.Font = currentFont
        TabButton.TextSize = buttonStyle.TextSize
        TabButton.AutoButtonColor = false
        TabButton.ZIndex = 2
        
        TabCorner.Parent = TabButton
        TabCorner.CornerRadius = buttonStyle.CornerRadius
        
        TabGradient.Parent = TabButton
        TabGradient.Rotation = 90
        TabGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, tabName == currentTab and ColorPalette.ButtonActive or ColorPalette.ButtonNormal),
            ColorSequenceKeypoint.new(1, ColorPalette.Accent)
        })
        
        TabButton.MouseButton1Click:Connect(function()
            if not ScriptRunning then return end
            playButtonSound()
            
            for _, child in pairs(TabButtonsScroll:GetChildren()) do
                if child:IsA("TextButton") then
                    if child.Text == currentTab then
                        child.Size = UDim2.new(0, 120, 0, 45)
                        break
                    end
                end
            end
            
            currentTab = tabName
            
            for _, child in pairs(TabButtonsScroll:GetChildren()) do
                if child:IsA("TextButton") then
                    if child.Text == currentTab then
                        child.BackgroundColor3 = ColorPalette.ButtonActive
                    else
                        child.BackgroundColor3 = ColorPalette.ButtonNormal
                    end
                end
            end
            
            TweenService:Create(ContentFrame, TweenInfo.new(0.2), {
                BackgroundTransparency = 1
            }):Play()
            
            wait(0.1)
            
            sixlHub:UpdateScriptsList(ScrollFrame, UIListLayout, currentTab)
            
            TweenService:Create(ContentFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = ColorPalette.ContentBackgroundTransparency
            }):Play()
        end)
    end
    
    for _, tabName in ipairs(tabs) do
        createTabButton(tabName)
    end
    
    -- Обновление размера табов
    local function updateTabScrollSize()
        local totalWidth = 0
        for _, child in pairs(TabButtonsScroll:GetChildren()) do
            if child:IsA("TextButton") then
                totalWidth = totalWidth + child.AbsoluteSize.X + 10
            end
        end
        TabButtonsScroll.CanvasSize = UDim2.new(0, totalWidth, 0, 0)
    end
    
    updateTabScrollSize()
    
    -- Функция для обработки настроек (без Show Metrics)
    local function handleSettings(settingCode)
        if not ScriptRunning then return end
        
        if settingCode == "SETTINGS_TOGGLE_SOUND" then
            Settings.SoundEnabled = not Settings.SoundEnabled
            showNotification("Settings", "🔊 Sounds: " .. (Settings.SoundEnabled and "ON" or "OFF"), 1)
            
        elseif settingCode == "SETTINGS_TOGGLE_NOTIFICATIONS" then
            Settings.Notifications = not Settings.Notifications
            showNotification("Settings", "🔔 Notifications: " .. (Settings.Notifications and "ON" or "OFF"), 1)
            
        elseif settingCode == "SETTINGS_CHANGE_THEME" then
            local themeNames = {}
            for name, _ in pairs(Themes) do
                table.insert(themeNames, name)
            end
            
            local currentIndex = 1
            for i, name in ipairs(themeNames) do
                if name == Settings.Theme then
                    currentIndex = i
                    break
                end
            end
            
            local nextIndex = (currentIndex % #themeNames) + 1
            Settings.Theme = themeNames[nextIndex]
            
            applyTheme()
            showNotification("Settings", "🎨 Theme: " .. Settings.Theme, 1)
            
        elseif settingCode == "SETTINGS_CHANGE_FONT" then
            local currentIndex = 1
            for i, font in ipairs(AvailableFonts) do
                if font == Settings.Font then
                    currentIndex = i
                    break
                end
            end
            
            local nextIndex = (currentIndex % #AvailableFonts) + 1
            Settings.Font = AvailableFonts[nextIndex]
            
            applyTheme()
            showNotification("Settings", "📝 Font: " .. Settings.Font, 1)
            
        elseif settingCode == "SETTINGS_BUTTON_STYLE" then
            local styles = {"Default", "Round", "Square"}
            local currentIndex = 1
            for i, style in ipairs(styles) do
                if style == Settings.ButtonStyle then
                    currentIndex = i
                    break
                end
            end
            
            local nextIndex = (currentIndex % #styles) + 1
            Settings.ButtonStyle = styles[nextIndex]
            
            applyTheme()
            showNotification("Settings", "🔘 Button Style: " .. Settings.ButtonStyle, 1)
        end
        
        if currentTab == "Settings" then
            sixlHub:UpdateScriptsList(ScrollFrame, UIListLayout, currentTab)
        end
    end
    
    -- Функция для обновления списка скриптов (без Show Metrics)
    function sixlHub:UpdateScriptsList(scrollFrame, layout, tabName)
        for _, child in pairs(scrollFrame:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        
        local scripts = tabName == "Settings" and getSettingsNames() or Scripts[tabName] or {}
        
        for i, scriptData in pairs(scripts) do
            local ScriptCard = Instance.new("Frame")
            local ScriptCardCorner = Instance.new("UICorner")
            local ScriptGradient = Instance.new("UIGradient")
            
            local ScriptName = Instance.new("TextLabel")
            local ExecuteButton = Instance.new("TextButton")
            local ExecuteCorner = Instance.new("UICorner")
            local ExecuteGradient = Instance.new("UIGradient")
            
            ScriptCard.Parent = scrollFrame
            ScriptCard.Size = UDim2.new(1, -10, 0, tabName == "Settings" and 90 or 70)
            ScriptCard.Position = UDim2.new(0, 5, 0, (i-1) * (tabName == "Settings" and 105 or 85))
            ScriptCard.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScriptCard.BorderSizePixel = 0
            ScriptCard.BackgroundTransparency = 0.1
            ScriptCard.ZIndex = 1
            
            ScriptCardCorner.Parent = ScriptCard
            ScriptCardCorner.CornerRadius = UDim.new(0, 12)
            
            ScriptGradient.Parent = ScriptCard
            ScriptGradient.Rotation = 90
            ScriptGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, ColorPalette.ButtonNormal),
                ColorSequenceKeypoint.new(1, ColorPalette.Accent)
            })
            
            ScriptName.Parent = ScriptCard
            ScriptName.Size = UDim2.new(0.7, 0, 0, 30)
            ScriptName.Position = UDim2.new(0, 15, 0, tabName == "Settings" and 10 or 20)
            ScriptName.BackgroundTransparency = 1
            ScriptName.TextColor3 = ColorPalette.Text
            ScriptName.Text = scriptData.Name
            ScriptName.Font = currentFont
            ScriptName.TextSize = 16
            ScriptName.TextXAlignment = Enum.TextXAlignment.Left
            ScriptName.TextStrokeTransparency = 0.8
            ScriptName.ZIndex = 2
            
            if tabName == "Settings" and scriptData.Description then
                local ScriptDesc = Instance.new("TextLabel")
                ScriptDesc.Parent = ScriptCard
                ScriptDesc.Size = UDim2.new(0.7, 0, 0, 45)
                ScriptDesc.Position = UDim2.new(0, 15, 0, 40)
                ScriptDesc.BackgroundTransparency = 1
                ScriptDesc.TextColor3 = Color3.fromRGB(
                    ColorPalette.Text.R * 0.8,
                    ColorPalette.Text.G * 0.8,
                    ColorPalette.Text.B * 0.8
                )
                ScriptDesc.Text = scriptData.Description
                ScriptDesc.Font = currentFont
                ScriptDesc.TextSize = 12
                ScriptDesc.TextXAlignment = Enum.TextXAlignment.Left
                ScriptDesc.TextWrapped = true
                ScriptDesc.ZIndex = 2
            end
            
            ExecuteButton.Parent = ScriptCard
            ExecuteButton.Size = UDim2.new(0, 100, 0, 35)
            ExecuteButton.Position = UDim2.new(1, -115, 0.5, -17)
            ExecuteButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ExecuteButton.BackgroundTransparency = 0
            ExecuteButton.TextColor3 = ColorPalette.ButtonText
            ExecuteButton.Text = tabName == "Settings" and "Apply" or "Execute"
            ExecuteButton.Font = currentFont
            ExecuteButton.TextSize = buttonStyle.TextSize
            ExecuteButton.AutoButtonColor = false
            ExecuteButton.ZIndex = 2
            
            ExecuteCorner.Parent = ExecuteButton
            ExecuteCorner.CornerRadius = buttonStyle.CornerRadius
            
            ExecuteGradient.Parent = ExecuteButton
            ExecuteGradient.Rotation = 90
            ExecuteGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, ColorPalette.ButtonNormal),
                ColorSequenceKeypoint.new(1, ColorPalette.Accent)
            })
            
            ExecuteButton.MouseButton1Click:Connect(function()
                if not ScriptRunning then return end
                playButtonSound()
                
                if tabName == "Settings" then
                    handleSettings(scriptData.Code)
                else
                    self:ExecuteScript(scriptData.Code, scriptData.Name, tabName)
                end
            end)
        end
        
        local function updateScrollSize()
            scrollFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 30)
        end
        
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateScrollSize)
        updateScrollSize()
    end
    
    -- Инициализация
    wait(0.5)
    sixlHub:UpdateScriptsList(ScrollFrame, UIListLayout, currentTab)
    showNotification("6ixl Hub v" .. sixlHub.Version, "✅ Hub loaded!", 1)
end

-- Функция для запуска с загрузочным экраном
local function startWithSplash()
    local SplashGui, loadTween, Logo, LoadingText, BarContainer, ProgressBar = createSplashScreen()
    
    wait(3)
    
    LoadingText.Text = "6IXL HUB LOADED"
    LoadingText.TextColor3 = Color3.fromRGB(180, 150, 255)
    LoadingText.TextSize = 35
    
    wait(0.5)
    
    SplashGui:Destroy()
    sixlHub:CreateGUI()
end

-- Запуск
startWithSplash()

return sixlHub
