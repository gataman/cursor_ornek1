import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'theme_components.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get themeData => _isDarkMode ? darkTheme : lightTheme;

  /// Light theme configuration
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      tertiary: AppColors.lightTertiary,
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ThemeComponents.elevatedButtonStyle(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ThemeComponents.textButtonStyle(
        foregroundColor: AppColors.lightPrimary,
      ),
    ),
    inputDecorationTheme: ThemeComponents.inputDecorationTheme(
      fillColor: Colors.grey.shade100,
      borderColor: Colors.grey.shade300,
      focusedBorderColor: AppColors.lightPrimary,
    ),
  );

  /// Dark theme configuration
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      tertiary: AppColors.darkTertiary,
      surface: AppColors.darkSurface,
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ThemeComponents.elevatedButtonStyle(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: Colors.black87,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ThemeComponents.textButtonStyle(
        foregroundColor: AppColors.darkPrimary,
      ),
    ),
    inputDecorationTheme: ThemeComponents.inputDecorationTheme(
      fillColor: AppColors.darkInputFill,
      borderColor: AppColors.darkBorder,
      focusedBorderColor: AppColors.darkPrimary,
    ),
  );
}
