import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_fill/controllers/settings_controller.dart';
import 'package:tap_to_fill/screens/splash.dart';

void main() {
  // Initialize global controllers
  Get.put(SettingsController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tap to Fill & Match',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      debugShowMaterialGrid: false,
    );
  }
}
