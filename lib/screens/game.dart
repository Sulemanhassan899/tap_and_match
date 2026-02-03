import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_fill/controllers/game_controller.dart';
import 'package:tap_to_fill/controllers/settings_controller.dart';
import 'package:tap_to_fill/screens/setting.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.put(GameController());
    final SettingsController settingsController = Get.find();

    return Scaffold(
      body: Obx(
        () => Container(
          decoration: BoxDecoration(
            gradient: settingsController.getBackgroundGradient(),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Top bar with back and settings buttons
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
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
                ),

                // Target percentage display
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 242, 255, 3),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      'Target: ${gameController.targetPercentage.value}%',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                // Emoji button
                Bounce(
                  child: GestureDetector(
                    onTapDown: (_) =>
                        gameController.handleWatermelonPressStart(),
                    onTapUp: (_) {
                      gameController.handleWatermelonPressEnd();
                      gameController.stopTimer(); // stop timer immediately
                      Future.delayed(const Duration(milliseconds: 500), () {
                        _showResultDialog(
                          context,
                          gameController,
                          settingsController,
                        );
                      });
                    },
                    onTapCancel: () {
                      gameController.handleWatermelonPressEnd();
                      gameController.stopTimer(); // also stop on cancel
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: gameController.isHolding.value ? 110 : 120,
                      height: gameController.isHolding.value ? 110 : 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: gameController.isHolding.value
                            ? Colors.white.withOpacity(0.5)
                            : Colors.white.withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: gameController.isHolding.value
                                ? 20
                                : 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          settingsController.selectedEmoji.value,
                          style: TextStyle(
                            fontSize: gameController.isHolding.value ? 75 : 80,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const Spacer(flex: 1),

                // Glass container
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '100',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '50',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.6),
                          width: 3,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 120),
                          width: 150,
                          height:
                              (300) *
                              (gameController.fillPercentage.value / 100),
                          decoration: BoxDecoration(
                            gradient: settingsController.getFillGradient(),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Attempts and Timer
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          'Attempts: ${gameController.attempts.value}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: settingsController.fillColors.isNotEmpty
                                ? settingsController.fillColors.last
                                : Colors.red,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          gameController.formatTime(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
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
    );
  }

  void _showResultDialog(
    BuildContext context,
    GameController gameController,
    SettingsController settingsController,
  ) {
    final bool isSuccess = gameController.checkResult();

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (_, __, ___) => const SizedBox(),
      transitionBuilder: (context, anim, _, __) {
        return Transform.scale(
          scale: Curves.elasticOut.transform(anim.value),
          child: Opacity(
            opacity: anim.value,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.86,
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  gradient: settingsController.getBackgroundGradient(),

                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 22,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 🎉 Emoji
                    Text(
                      isSuccess ? '🎉' : '😅',
                      style: const TextStyle(
                        fontSize: 52,
                        decoration: TextDecoration.none,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Title
                    Text(
                      isSuccess ? 'PERFECT!' : 'ALMOST!',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,

                        letterSpacing: 1.4,
                        decoration: TextDecoration.none,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      isSuccess
                          ? 'Awesome move! You nailed it!'
                          : 'So close… try again!',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 17,

                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ⭐ Stars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Icon(
                          Icons.star_rounded,
                          size: 42,
                          color: isSuccess || index < 2
                              ? Colors.yellowAccent
                              : Colors.white24,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // SCORE label
                    const Text(
                      'SCORE',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        letterSpacing: 3,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Score pill
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Obx(
                        () => Text(
                          gameController.score.value.toString(),
                          style: TextStyle(
                            color: isSuccess
                                ? const Color(0xFF00C853)
                                : const Color(0xFFFF6D00),
                            decoration: TextDecoration.none,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ▶ Button
                    Bounce(
                      onTap: () {
                        Get.back();
                        gameController.resetGame();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 52,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isSuccess
                                ? [
                                    const Color(0xFF2979FF), // blue
                                    const Color(0xFF00B0FF), // light blue
                                  ]
                                : [
                                    const Color(0xFF7C4DFF), // purple
                                    const Color(0xFFE040FB), // pink purple
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 14,
                              offset: const Offset(0, 7),
                            ),
                          ],
                        ),
                        child: Text(
                          isSuccess ? 'NEXT LEVEL' : 'TRY AGAIN',
                          style: const TextStyle(
                            color: Colors.white,

                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
