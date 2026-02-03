import 'package:flutter/material.dart';

/// Represents an emoji theme with its associated fill colors
class EmojiTheme {
  final String emoji;
  final List<Color> fillColors;
  final String name;

  EmojiTheme({
    required this.emoji,
    required this.fillColors,
    required this.name,
  });
}

/// Represents a background theme with gradient colors
class BackgroundTheme {
  final String name;
  final List<Color> colors;

  BackgroundTheme({
    required this.name,
    required this.colors,
  });

  /// Predefined background themes
  static List<BackgroundTheme> defaultThemes = [
    BackgroundTheme(
      name: 'Rainbow',
      colors: [
        const Color(0xFF4A90E2),
        const Color(0xFF6EC6FF),
        const Color(0xFF7FE7D1),
        const Color(0xFFB39DDB),
        const Color(0xFFF2B5D4),
        const Color(0xFFF7C59F),
        const Color(0xFFFFF1D6),
      ],
    ),
    BackgroundTheme(
      name: 'Ocean',
      colors: [
        const Color(0xFF1E3A8A),
        const Color(0xFF3B82F6),
        const Color(0xFF60A5FA),
        const Color(0xFF93C5FD),
      ],
    ),
    BackgroundTheme(
      name: 'Sunset',
      colors: [
        const Color(0xFFFF6B6B),
        const Color(0xFFFFBB5C),
        const Color(0xFFFFA41B),
        const Color(0xFFFF6B35),
      ],
    ),
    BackgroundTheme(
      name: 'Forest',
      colors: [
        const Color(0xFF065F46),
        const Color(0xFF059669),
        const Color(0xFF10B981),
        const Color(0xFF6EE7B7),
      ],
    ),
    BackgroundTheme(
      name: 'Purple Dream',
      colors: [
        const Color(0xFF581C87),
        const Color(0xFF7C3AED),
        const Color(0xFFA78BFA),
        const Color(0xFFD8B4FE),
      ],
    ),
    BackgroundTheme(
      name: 'Candy',
      colors: [
        const Color(0xFFEC4899),
        const Color(0xFFF472B6),
        const Color(0xFFFBBF24),
        const Color(0xFFFDE68A),
      ],
    ),
  ];
}

/// Predefined emoji themes with matching fill colors
class EmojiPresets {
  static final List<EmojiTheme> presets = [
    EmojiTheme(
      emoji: '🍉',
      name: 'Watermelon',
      fillColors: [
        Colors.red.shade400,
        Colors.red.shade600,
        Colors.red.shade800,
      ],
    ),
    EmojiTheme(
      emoji: '🍋',
      name: 'Lemon',
      fillColors: [
        Colors.yellow.shade400,
        Colors.yellow.shade600,
        Colors.orange.shade400,
      ],
    ),
    EmojiTheme(
      emoji: '🍇',
      name: 'Grape',
      fillColors: [
        Colors.purple.shade400,
        Colors.purple.shade600,
        Colors.purple.shade800,
      ],
    ),
    EmojiTheme(
      emoji: '🍓',
      name: 'Strawberry',
      fillColors: [
        Colors.red.shade300,
        Colors.pink.shade500,
        Colors.red.shade700,
      ],
    ),
    EmojiTheme(
      emoji: '🍊',
      name: 'Orange',
      fillColors: [
        Colors.orange.shade400,
        Colors.orange.shade600,
        Colors.deepOrange.shade600,
      ],
    ),
    EmojiTheme(
      emoji: '🍏',
      name: 'Green Apple',
      fillColors: [
        Colors.lightGreen.shade400,
        Colors.green.shade600,
        Colors.green.shade800,
      ],
    ),
    EmojiTheme(
      emoji: '🍎',
      name: 'Red Apple',
      fillColors: [
        Colors.red.shade500,
        Colors.red.shade700,
        Colors.red.shade900,
      ],
    ),
    EmojiTheme(
      emoji: '🥥',
      name: 'Coconut',
      fillColors: [
        Colors.brown.shade300,
        Colors.brown.shade500,
        Colors.brown.shade700,
      ],
    ),
    EmojiTheme(
      emoji: '🥝',
      name: 'Kiwi',
      fillColors: [
        Colors.lightGreen.shade300,
        Colors.green.shade500,
        Colors.green.shade700,
      ],
    ),
    EmojiTheme(
      emoji: '🍑',
      name: 'Peach',
      fillColors: [
        Colors.orange.shade200,
        Colors.orange.shade400,
        Colors.pink.shade400,
      ],
    ),
    EmojiTheme(
      emoji: '🍒',
      name: 'Cherry',
      fillColors: [
        Colors.red.shade400,
        Colors.red.shade600,
        Colors.red.shade900,
      ],
    ),
    EmojiTheme(
      emoji: '🍍',
      name: 'Pineapple',
      fillColors: [
        Colors.yellow.shade500,
        Colors.orange.shade500,
        Colors.amber.shade700,
      ],
    ),
  ];
}