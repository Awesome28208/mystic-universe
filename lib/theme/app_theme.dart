import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.purple,
      secondary: AppColors.gold,
      surface: AppColors.surface,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textPrimary, fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: AppColors.textPrimary, fontSize: 22, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.textSecondary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      elevation: 0,
      titleTextStyle: TextStyle(color: AppColors.gold, fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}
