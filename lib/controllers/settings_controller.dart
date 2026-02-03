// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tap_to_fill/models/app_models.dart';

// /// Controller for managing app-wide settings and customization
// class SettingsController extends GetxController {
//   // ===== Main saved values =====
//   final selectedEmoji = '🍉'.obs;
//   final fillColors = <Color>[
//     Colors.red.shade400,
//     Colors.red.shade600,
//     Colors.red.shade800,
//   ].obs;
//   final backgroundColors = <Color>[
//     const Color(0xFF4A90E2),
//     const Color(0xFF6EC6FF),
//     const Color(0xFF7FE7D1),
//     const Color(0xFFB39DDB),
//     const Color(0xFFF2B5D4),
//     const Color(0xFFF7C59F),
//     const Color(0xFFFFF1D6),
//   ].obs;
//   final userName = ''.obs;
//   final selectedBackgroundThemeIndex = 0.obs;

//   // ===== Temp values (used before saving) =====
//   final tempEmoji = '🍉'.obs;
//   final tempFillColors = <Color>[
//     Colors.red.shade400,
//     Colors.red.shade600,
//     Colors.red.shade800,
//   ].obs;
//   final tempBackgroundIndex = 0.obs;
//   final tempUserName = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize temp values with current saved values
//     _resetTempValues();
//   }

//   /// Reset temp values to match current saved values
//   void _resetTempValues() {
//     tempEmoji.value = selectedEmoji.value;
//     tempFillColors.value = List.from(fillColors);
//     tempBackgroundIndex.value = selectedBackgroundThemeIndex.value;
//     tempUserName.value = userName.value;
//   }

//   /// Load temp values when entering settings (for cancel functionality)
//   void loadTempSettings() {
//     _resetTempValues();
//   }

//   /// Update temp emoji from text input
//   void updateTempEmoji(String emoji) {
//     if (emoji.isNotEmpty) {
//       tempEmoji.value = emoji;
//       // Use default colors for custom emoji
//       tempFillColors.value = [
//         Colors.red.shade400,
//         Colors.red.shade600,
//         Colors.red.shade800,
//       ];
//     }
//   }

//   /// Update temp emoji from a preset theme
//   void updateTempEmojiFromPreset(EmojiTheme theme) {
//     tempEmoji.value = theme.emoji;
//     tempFillColors.value = theme.fillColors;
//   }

//   /// Update temp background theme by index
//   void updateTempBackgroundTheme(int index) {
//     if (index >= 0 && index < BackgroundTheme.defaultThemes.length) {
//       tempBackgroundIndex.value = index;
//     }
//   }

//   /// Update temp username
//   void updateTempUserName(String name) {
//     tempUserName.value = name;
//   }

//   /// Save temp settings to main settings
//   void saveSettings() {
//     selectedEmoji.value = tempEmoji.value;
//     fillColors.value = List.from(tempFillColors);
//     selectedBackgroundThemeIndex.value = tempBackgroundIndex.value;
//     backgroundColors.value =
//         BackgroundTheme.defaultThemes[tempBackgroundIndex.value].colors;
//     userName.value = tempUserName.value;
//   }

//   /// Cancel changes and revert to saved settings
//   void cancelSettings() {
//     _resetTempValues();
//   }

//   /// Get current background gradient
//   LinearGradient getBackgroundGradient() {
//     return LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       colors: backgroundColors,
//     );
//   }

//   /// Get temp background gradient (for settings preview)
//   LinearGradient getTempBackgroundGradient() {
//     return LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       colors: BackgroundTheme.defaultThemes[tempBackgroundIndex.value].colors,
//     );
//   }

//   /// Get fill gradient for the glass
//   LinearGradient getFillGradient() {
//     final colors = fillColors.length >= 2
//         ? fillColors
//         : [
//             Colors.red.shade400,
//             Colors.red.shade600,
//             Colors.red.shade800,
//           ];
//     return LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: colors,
//     );
//   }

//   /// Helper to check if input is a valid emoji
//   bool isValidEmoji(String input) {
//     if (input.isEmpty) return false;
//     // Basic emoji detection - check if string contains emoji characters
//     final emojiRegex = RegExp(
//       r'[\u{1F300}-\u{1F9FF}]|[\u{2600}-\u{26FF}]|[\u{2700}-\u{27BF}]',
//       unicode: true,
//     );
//     return emojiRegex.hasMatch(input) && input.length <= 2;
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_fill/models/app_models.dart';

/// Controller for managing app-wide settings and customization
class SettingsController extends GetxController {
  // ===== Main saved values =====
  final selectedEmoji = '🍉'.obs;
  final fillColors = <Color>[
    Colors.red.shade400,
    Colors.red.shade600,
    Colors.red.shade800,
  ].obs;
  final backgroundColors = <Color>[
    const Color(0xFF4A90E2),
    const Color(0xFF6EC6FF),
    const Color(0xFF7FE7D1),
    const Color(0xFFB39DDB),
    const Color(0xFFF2B5D4),
    const Color(0xFFF7C59F),
    const Color(0xFFFFF1D6),
  ].obs;

  // ✅ FIX: Store INDEX only, compute colors on demand
  final selectedBackgroundThemeIndex = 0.obs;
  final userName = ''.obs;

  // ===== Temp values (used before saving) =====
  final tempEmoji = '🍉'.obs;
  final tempFillColors = <Color>[
    Colors.red.shade400,
    Colors.red.shade600,
    Colors.red.shade800,
  ].obs;
  final tempBackgroundIndex = 0.obs;
  final tempUserName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize temp values with current saved values
    _resetTempValues();
  }

  /// Reset temp values to match current saved values
  void _resetTempValues() {
    tempEmoji.value = selectedEmoji.value;
    tempFillColors.value = List.from(fillColors);
    tempBackgroundIndex.value = selectedBackgroundThemeIndex.value;
    tempUserName.value = userName.value;
  }

  /// Load temp values when entering settings (for cancel functionality)
  void loadTempSettings() {
    _resetTempValues();
  }

  /// Update temp emoji from text input
  void updateTempEmoji(String emoji) {
    if (emoji.isNotEmpty) {
      tempEmoji.value = emoji;
      // Use default colors for custom emoji
      tempFillColors.value = [
        Colors.red.shade400,
        Colors.red.shade600,
        Colors.red.shade800,
      ];
    }
  }

  /// Update temp emoji from a preset theme
  void updateTempEmojiFromPreset(EmojiTheme theme) {
    tempEmoji.value = theme.emoji;
    tempFillColors.value = theme.fillColors;
  }

  /// Update temp background theme by index
  void updateTempBackgroundTheme(int index) {
    if (index >= 0 && index < BackgroundTheme.defaultThemes.length) {
      tempBackgroundIndex.value = index;
    }
  }

  /// Update temp username
  void updateTempUserName(String name) {
    tempUserName.value = name;
  }

  /// Save temp settings to main settings
  void saveSettings() {
    selectedEmoji.value = tempEmoji.value;
    fillColors.value = List.from(tempFillColors);

    // ✅ KEY FIX: Just update the index - this triggers Obx rebuilds automatically
    selectedBackgroundThemeIndex.value = tempBackgroundIndex.value;

    userName.value = tempUserName.value;

    // Debug print
    print('✅ Settings saved - Background index: $selectedBackgroundThemeIndex');
  }

  /// Cancel changes and revert to saved settings
  void cancelSettings() {
    _resetTempValues();
  }

  /// ✅ FIXED: Get current background gradient - computed from index
  LinearGradient getBackgroundGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: BackgroundTheme
          .defaultThemes[selectedBackgroundThemeIndex.value]
          .colors,
    );
  }

  /// Get temp background gradient (for settings preview)
  LinearGradient getTempBackgroundGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: BackgroundTheme.defaultThemes[tempBackgroundIndex.value].colors,
    );
  }

  /// Get fill gradient for the glass
  LinearGradient getFillGradient() {
    final colors = fillColors.length >= 2
        ? fillColors
        : [Colors.red.shade400, Colors.red.shade600, Colors.red.shade800];
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
    );
  }

  /// Helper to check if input is a valid emoji
  bool isValidEmoji(String input) {
    if (input.isEmpty) return false;
    // Basic emoji detection - check if string contains emoji characters
    final emojiRegex = RegExp(
      r'[\u{1F300}-\u{1F9FF}]|[\u{2600}-\u{26FF}]|[\u{2700}-\u{27BF}]',
      unicode: true,
    );
    return emojiRegex.hasMatch(input) && input.length <= 2;
  }
}
