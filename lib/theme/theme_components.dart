import 'package:flutter/material.dart';

/// Common theme components
class ThemeComponents {
  /// Common button style for both themes
  static ButtonStyle elevatedButtonStyle(
      {required Color backgroundColor, required Color foregroundColor}) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      minimumSize: const Size(double.infinity, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
    );
  }

  /// Common text button style for both themes
  static ButtonStyle textButtonStyle({required Color foregroundColor}) {
    return TextButton.styleFrom(
      foregroundColor: foregroundColor,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// Common input decoration theme for both themes
  static InputDecorationTheme inputDecorationTheme({
    required Color fillColor,
    required Color borderColor,
    required Color focusedBorderColor,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      border: _buildInputBorder(borderColor),
      enabledBorder: _buildInputBorder(borderColor),
      focusedBorder: _buildInputBorder(focusedBorderColor, width: 2),
      labelStyle: TextStyle(color: focusedBorderColor),
    );
  }

  /// Helper method for input border
  static OutlineInputBorder _buildInputBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
