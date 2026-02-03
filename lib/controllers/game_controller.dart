import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class GameController extends GetxController {
  final targetPercentage = 54.obs;
  final fillPercentage = 0.0.obs;
  final attempts = 1.obs;
  final timerMilliseconds = 0.obs;
  final isRunning = false.obs;
  final isHolding = false.obs;
  final score = 0.obs;
  final coins = 0.obs;
  final gems = 0.obs;
  Timer? _timer;
  Timer? _fillTimer;

  @override
  void onInit() {
    super.onInit();
    generateRandomTarget();
  }

  void generateRandomTarget() {
    targetPercentage.value = Random().nextInt(81) + 20;
  }

  void startTimer() {
    if (!isRunning.value) {
      isRunning.value = true;
      _timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
        timerMilliseconds.value += 10;
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
    isRunning.value = false;
  }

  String formatTime() {
    int ms = (timerMilliseconds.value % 1000) ~/ 10;
    int sec = (timerMilliseconds.value ~/ 1000) % 60;
    int min = timerMilliseconds.value ~/ 60000;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}.${ms.toString().padLeft(2, '0')}';
  }

  void handleWatermelonPressStart1() {
    startTimer();
    isHolding.value = true;

    _fillTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (fillPercentage.value < 100) {
        fillPercentage.value = min(fillPercentage.value + 1.2, 100);
      }
    });
  }

  void handleWatermelonPressStart() {
    if (!isRunning.value) startTimer();
    isHolding.value = true;

    _fillTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (fillPercentage.value < 100) {
        fillPercentage.value = min(fillPercentage.value + 1.2, 100);
      }
    });
  }

  void handleWatermelonPressEnd() {
    isHolding.value = false;
    _fillTimer?.cancel();
    stopTimer(); // stop immediately
  }

  void handleWatermelonPressEnd1() {
    isHolding.value = false;
    _fillTimer?.cancel();
  }

  bool checkResult() {
    stopTimer();

    if (fillPercentage.value == 100) {
      score.value = 100; // ✅ success score
      return true;
    } else {
      score.value = 0; // ❌ fail score
      return false;
    }
  }

  void resetGame() {
    fillPercentage.value = 0;
    timerMilliseconds.value = 0;
    isHolding.value = false;
    isRunning.value = false;
    attempts.value++;
    generateRandomTarget();
  }
}
