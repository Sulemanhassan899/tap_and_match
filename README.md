# 🍉 Tap to Fill & Match - GetX Edition

A colorful, engaging Flutter game where players tap and hold an emoji to fill a glass and match a target percentage. Built with **GetX** for modern state management.

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

### 🏗️ Technical
- **GetX State Management** - Reactive and efficient
- **Clean Architecture** - Controllers, Models, and Screens separated
- **Optimized Performance** - Only affected widgets rebuild
- **Professional Code** - Well-documented and organized

## 🚀 Quick Start

### Prerequisites
- Flutter SDK 3.0.0 or higher
- Dart SDK

### Installation

1. **Clone or download the project**

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

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

### Key Patterns

**Reactive State**
```dart
final selectedEmoji = '🍉'.obs;
```

**Reactive UI**
```dart
Obx(() => Text(controller.selectedEmoji.value))
```

**Navigation**
```dart
Get.to(() => GameScreen());
Get.back();
```

## 📦 Dependencies

```yaml
dependencies:
  get: ^4.6.6       # State management
  bounce: ^1.0.0    # Animation effects
```

## 🎨 Customization Guide

### Add New Emoji Preset

Edit `lib/models/app_models.dart`:

```dart
EmojiTheme(
  emoji: '🥑',
  name: 'Avocado',
  fillColors: [
    Colors.green.shade300,
    Colors.green.shade600,
    Colors.green.shade900,
  ],
)
```

### Add New Background Theme

Edit `lib/models/app_models.dart`:

```dart
BackgroundTheme(
  name: 'Midnight',
  colors: [
    Color(0xFF1a1a2e),
    Color(0xFF16213e),
    Color(0xFF0f3460),
  ],
)
```

### Adjust Game Difficulty

Edit `lib/controllers/game_controller.dart`:

**Change Fill Speed**
```dart
fillPercentage.value = min(fillPercentage.value + 1.2, 100);
// Increase 1.2 for faster fill
```

**Change Win Tolerance**
```dart
const tolerance = 5.0;
// Decrease for harder difficulty
```

### Change Splash Duration

Edit `lib/screens/splash_screen.dart`:

```dart
Future.delayed(const Duration(seconds: 4), () {
  // Change 4 to your preferred seconds
```

## 🧪 Testing

Run tests:
```bash
flutter test
```

## 🚢 Building for Production

**Android**
```bash
flutter build apk --release
```

**iOS**
```bash
flutter build ios --release
```

**Web**
```bash
flutter build web --release
```

## 📱 Platform Support

- ✅ Android (SDK 21+)
- ✅ iOS (11.0+)
- ✅ Web
- ✅ Desktop (Windows, macOS, Linux)

## 🎓 Learning Resources

- [GetX Documentation](https://pub.dev/packages/get)
- [Flutter Documentation](https://flutter.dev/docs)
- [GetX Pattern Guide](https://github.com/jonataslaw/getx)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the MIT License.

## 🎉 Credits

Built with ❤️ using Flutter and GetX

---

**Enjoy the game! 🎮🍉**