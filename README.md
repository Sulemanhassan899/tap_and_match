# 🍉 Tap to Fill & Match 

A colorful, engaging Flutter game where players tap and hold an emoji to fill a glass and match a target percentage. Built for modern state management.

## ✨ Features

### 🎮 Gameplay
- **Tap & Hold Mechanics** - Press and hold emoji to fill the glass
- **Target Matching** - Fill to match the target percentage (±5% tolerance)
- **Timed Challenges** - Beat your best time
- **Attempts Tracking** - See how many tries it takes
- **Beautiful Animations** - Smooth transitions and effects throughout

### 🎨 Customization
- **12 Emoji Presets** - Watermelon, Lemon, Grape, Strawberry, Orange, Apples, Coconut, Kiwi, Peach, Cherry, Pineapple
- **Dynamic Fill Colors** - Each emoji has matching gradient colors
- **6 Background Themes** - Rainbow, Ocean, Sunset, Forest, Purple Dream, Candy
- **User Personalization** - Add your name for a welcome message
- **Real-time Updates** - Changes reflect instantly across all screens

### Installation
**Clone or download the project**


## 📁 Project Structure

```
lib/
├── main.dart                      # App entry point
├── controllers/
│   ├── game_controller.dart       # Game logic & state
│   └── settings_controller.dart   # Settings & customization
├── models/
│   └── app_models.dart            # Data models
└── screens/
    ├── splash_screen.dart         # Animated splash screen
    ├── home_screen.dart           # Main menu
    ├── game_screen.dart           # Gameplay screen
    └── settings_screen.dart       # Settings & customization
```

## 🎮 How to Play

1. **Launch** - Watch the animated splash screen
2. **Home Screen** - Tap the **PLAY** button to start
3. **Game Screen** - See your target percentage at the top
4. **Tap & Hold** - Press and hold the emoji to fill the glass
5. **Release** - When you think you've matched the target
6. **Result** - Win if you're within ±5% of the target
7. **Play Again** - Try to beat your time!

## ⚙️ Settings

Access settings via the ⚙️ icon on Home or Game screens.

### 👤 Your Name
Enter your name to see a personalized welcome message on the home screen.

### 🎨 Choose Your Emoji
Select from 12 fruit emoji presets, each with matching fill colors:
- 🍉 Watermelon (Red)
- 🍋 Lemon (Yellow/Orange)
- 🍇 Grape (Purple)
- 🍓 Strawberry (Red/Pink)
- 🍊 Orange (Orange)
- 🍏 Green Apple (Light Green)
- 🍎 Red Apple (Red)
- 🥥 Coconut (Brown)
- 🥝 Kiwi (Green)
- 🍑 Peach (Orange/Pink)
- 🍒 Cherry (Red)
- 🍍 Pineapple (Yellow/Orange/Amber)
- You can Add yours too

### 🌈 Background Theme
Choose from 6 beautiful gradient themes:
1. **Rainbow** - Multi-color gradient (default)
2. **Ocean** - Blue tones
3. **Sunset** - Warm orange and red
4. **Forest** - Green gradient
5. **Purple Dream** - Purple and violet
6. **Candy** - Pink and yellow

### 🎨 Fill Color Preview
See a live preview of your selected emoji with its fill colors.

## 🎯 Game Rules

- **Target Range**: 20% - 100%
- **Win Tolerance**: ±5% of target
- **Fill Speed**: 1.2% per 16ms when holding
- **Timer**: Starts when you first tap, stops on result

## 🏛️ Architecture

### GetX State Management

**SettingsController** (Global)
- Manages emoji selection
- Controls background themes
- Stores username
- Provides gradients

**GameController** (Per Session)
- Handles game state
- Manages timer
- Controls fill percentage
- Checks win/lose conditions

## 📱 Platform Support

- ✅ Android (SDK 21+)
- ✅ iOS (11.0+)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the MIT License.

**Enjoy the game! 🎮🍉**
