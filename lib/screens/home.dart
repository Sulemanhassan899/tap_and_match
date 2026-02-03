import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_fill/controllers/settings_controller.dart';
import 'package:tap_to_fill/screens/game.dart';
import 'package:tap_to_fill/screens/setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _topTextController;
  late AnimationController _bottomController;
  late AnimationController _rotateController;

  late Animation<Offset> _topTextAnimation;
  late Animation<Offset> _bottomAnimation;
  final SettingsController settingsController = Get.find<SettingsController>();

  @override
  void initState() {
    super.initState();

    // Top text animation (Top -> Center)
    _topTextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _topTextAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _topTextController,
            curve: Curves.easeOutBack,
          ),
        );

    // Bottom widgets animation (Bottom -> Center)
    _bottomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _bottomAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
          CurvedAnimation(parent: _bottomController, curve: Curves.easeOutBack),
        );

    // Emoji rotation
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    // Start animations
    _topTextController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _bottomController.forward();
    });
  }

  @override
  void dispose() {
    _topTextController.dispose();
    _bottomController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          decoration: BoxDecoration(
            gradient: settingsController.getBackgroundGradient(),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Settings button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(
                            () => const SettingsScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Welcome message with username
                        if (settingsController.userName.value.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              'Welcome, ${settingsController.userName.value}!',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black45,
                                    offset: Offset(2, 2),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        const Text(
                          'Fill & Match',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                offset: Offset(3, 3),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// Rotating Emoji
                        RotationTransition(
                          turns: _rotateController,
                          child: Text(
                            settingsController.selectedEmoji.value,
                            style: const TextStyle(fontSize: 80),
                          ),
                        ),

                        const SizedBox(height: 20),
                        const SizedBox(height: 60),

                        /// Bottom content from BOTTOM
                        SlideTransition(
                          position: _bottomAnimation,
                          child: Column(
                            children: [
                              // Play Button
                              Bounce(
                                onTap: () {
                                  Get.to(
                                    () => const GameScreen(),
                                    transition: Transition.fade,
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF00C853),
                                        Color(0xFF00E676),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'PLAY',
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 60),

                              // How to Play Card
                              Container(
                                padding: const EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 15,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        '📖 How to Play',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    _Instruction(
                                      settingsController.selectedEmoji.value,
                                      'Tap and HOLD the ${_getEmojiName(settingsController.selectedEmoji.value)} to fill the glass',
                                    ),
                                    const SizedBox(height: 15),
                                    const _Instruction(
                                      '🎯',
                                      'Match the target percentage as closely as possible',
                                    ),
                                    const SizedBox(height: 15),
                                    const _Instruction(
                                      '⏱️',
                                      'Fill accuracy within ±5% to win!',
                                    ),
                                    const SizedBox(height: 15),
                                    const _Instruction(
                                      '🏆',
                                      'Complete as fast as possible for best score',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getEmojiName(String emoji) {
    switch (emoji) {
      case '🍉':
        return 'watermelon';
      case '🍋':
        return 'lemon';
      case '🍇':
        return 'grape';
      case '🍓':
        return 'strawberry';
      case '🍊':
        return 'orange';
      case '🍏':
        return 'apple';
      case '🍎':
        return 'apple';
      case '🥥':
        return 'coconut';
      case '🥝':
        return 'kiwi';
      case '🍑':
        return 'peach';
      case '🍒':
        return 'cherry';
      case '🍍':
        return 'pineapple';
      default:
        return 'emoji';
    }
  }
}

/// Clean instruction widget
class _Instruction extends StatelessWidget {
  final String emoji;
  final String text;

  const _Instruction(this.emoji, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
