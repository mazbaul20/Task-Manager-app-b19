import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary colors
  // Brand color (buttons, logo, highlights)
  static const Color primary = Color(0xFF5B5FEF);
  static const Color primaryLight = Color(0xFFEEEFFE);
  static const Color primaryDark = Color(0xFF4F46E5);

  // Background colors
  static const Color background = Color(0xFFF7F8FB);
  static const Color white = Color(0xFFFFFFFF);
  static const Color softGrey = Color(0xFFEFF0F4);
  static const Color iconBox = Color(0xFFF3F4F7);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF1F1F1F);

  // Text colors
  static const Color primaryText = Color(0xFF15181E);
  static const Color bodyText = Color(0xFF4B5563);
  static const Color secondaryText = Color(0xFF6B7280);
  static const Color labelText = Color(0xFF8A909B);
  static const Color mutedText = Color(0xFF9AA1AC);

  // Border and shadow
  // Lines
  static const Color border = Color(0xFFE8EAEE);
  static const Color divider = Color(0xFFF0F1F4);
  static const Color shadow = Color(0xFFE5E7F0);

  // Red (high priority / delete)
  static const Color red = Color(0xFFDC2626);
  static const Color redLight = Color(0xFFFDEDED);
  static const Color redBorder = Color(0xFFFBD5D5);

  // Success colors
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFE7F8F1);

  // Warning colors
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFFF4E5);

  // Error colors
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEEBEC);

  // Pending colors
  static const Color pending = Color(0xFF5B5CF6);
  static const Color pendingLight = Color(0xFFEEF0FF);

  // Green (completed / low priority)
  static const Color green = Color(0xFF0E9F6E);
  static const Color greenLight = Color(0xFFE8F9F2);
  static const Color greenIcon = Color(0xFF10B981);

  // Amber (medium priority / pending icon)
  static const Color amber = Color(0xFFB45309);
  static const Color amberLight = Color(0xFFFEF6E7);
  static const Color amberIcon = Color(0xFFF59E0B);

  // The soft shadow used by every white card
  static final List<BoxShadow> cardShadow = [
    BoxShadow(
      color: const Color(0xFF0F172A).withValues(alpha: 0.05),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];

  /// Text color for a priority word: High -> red, Medium -> amber, Low -> green.
  static Color priorityText(String priority) {
    if (priority == 'High') {
      return red;
    } else if (priority == 'Medium') {
      return amber;
    } else {
      return green;
    }
  }

  /// Background color for a priority box.
  static Color priorityBackground(String priority) {
    if (priority == 'High') {
      return redLight;
    } else if (priority == 'Medium') {
      return amberLight;
    } else {
      return greenLight;
    }
  }
}
