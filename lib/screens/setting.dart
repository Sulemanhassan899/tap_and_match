

import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_fill/controllers/settings_controller.dart';
import 'package:tap_to_fill/models/app_models.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emojiController;

  @override
  void initState() {
    super.initState();
    final controller = Get.find<SettingsController>();
    
    // Load temp settings when entering screen
    controller.loadTempSettings();
    
    _nameController = TextEditingController(text: controller.tempUserName.value);
    _emojiController = TextEditingController(text: controller.tempEmoji.value);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emojiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find();

    return Scaffold(
      body: Obx(
        () => Container(
          decoration: BoxDecoration(
        gradient: controller.getTempBackgroundGradient(), // Preview mode!
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.cancelSettings();
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 32,
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
                    ],
                  ),
                ),

                // Settings content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User Name Section
                        _SettingsSection(
                          title: '👤 Name',
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _nameController,
                              onChanged: (value) =>
                                  controller.updateTempUserName(value),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Emoji Selector Section
                        _SettingsSection(
                          title: '🎨 Choose Your Emoji',
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // Current emoji display
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: controller.tempFillColors.isNotEmpty
                                        ? controller.tempFillColors.first
                                            .withOpacity(0.2)
                                        : Colors.red.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Current:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        controller.tempEmoji.value,
                                        style: const TextStyle(fontSize: 60),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Custom emoji input
                                const Text(
                                  'Or enter any emoji:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _emojiController,
                                  onChanged: (value) {
                                    if (controller.isValidEmoji(value)) {
                                      controller.updateTempEmoji(value);
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 40),
                                  maxLength: 2,
                                  decoration: InputDecoration(
                                    hintText: '🍉',
                                    hintStyle: const TextStyle(fontSize: 40),
                                    counterText: '',
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                const Text(
                                  'Or choose from presets:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                // Emoji grid
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount: EmojiPresets.presets.length,
                                  itemBuilder: (context, index) {
                                    final preset = EmojiPresets.presets[index];
                                    final isSelected =
                                        controller.tempEmoji.value ==
                                            preset.emoji;

                                    return GestureDetector(
                                      onTap: () {
                                        controller.updateTempEmojiFromPreset(preset);
                                        _emojiController.text = preset.emoji;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? preset.fillColors.first
                                                  .withOpacity(0.3)
                                              : Colors.white.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: isSelected
                                                ? preset.fillColors.last
                                                : Colors.transparent,
                                            width: 3,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            preset.emoji,
                                            style: const TextStyle(
                                              fontSize: 40,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Background Theme Section
                        _SettingsSection(
                          title: '🎨 Background',
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: List.generate(
                                BackgroundTheme.defaultThemes.length,
                                (index) {
                                  final theme =
                                      BackgroundTheme.defaultThemes[index];
                                  final isSelected =
                                      controller.tempBackgroundIndex.value ==
                                          index;

                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15),
                                    child: GestureDetector(
                                      onTap: () => controller
                                          .updateTempBackgroundTheme(index),
                                      child: Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: theme.colors,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.transparent,
                                            width: 3,
                                          ),
                                          boxShadow: [
                                            if (isSelected)
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                blurRadius: 10,
                                                offset: const Offset(0, 5),
                                              ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            theme.name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black54,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Save and Cancel Buttons
                        Row(
                          children: [
                            // Cancel Button
                            Expanded(
                              child: Bounce(
                                onTap: () {
                                  controller.cancelSettings();
                                  Get.back();
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade700,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 10,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'CANCEL',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            // Save Button
                            Expanded(
                              flex: 2,
                              child: Bounce(
                                onTap: () {
                                  controller.saveSettings();
                                  Get.back();
                                  Get.snackbar(
                                    'Settings Saved',
                                    'Your preferences have been updated!',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    duration: const Duration(seconds: 2),
                                    margin: const EdgeInsets.all(20),
                                    borderRadius: 15,
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  decoration: BoxDecoration(
                                    color: BackgroundTheme
                                        .defaultThemes[controller
                                            .tempBackgroundIndex.value]
                                        .colors
                                        .first,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 10,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'SAVE SETTINGS',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _SettingsSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
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
        const SizedBox(height: 15),
        child,
      ],
    );
  }
}