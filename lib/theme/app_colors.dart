import 'package:flutter/material.dart';

class AppColors {
  // === ELEMENT RENKLERİ ===
  static const fire = Color(0xFFff6b35);
  static const fireLight = Color(0xFFFF8C5A);
  static const earth = Color(0xFF4a7c59);
  static const earthLight = Color(0xFF6BA67A);
  static const air = Color(0xFF5bc0eb);
  static const airLight = Color(0xFF85D4F5);
  static const water = Color(0xFF4a6fa5);
  static const waterLight = Color(0xFF6E93C9);

  // === ANA TEMA ===
  static const background = Color(0xFF0D0B1E);
  static const surface = Color(0xFF1A1635);
  static const surfaceLight = Color(0xFF2A2450);
  static const purple = Color(0xFF7B2FBE);
  static const purpleLight = Color(0xFF9D5FD6);
  static const gold = Color(0xFFFFD700);
  static const white = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFFE8E0FF);
  static const textSecondary = Color(0xFF9B8FBE);

  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0D0B1E), Color(0xFF1A0A2E)],
  );
  static const purpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7B2FBE), Color(0xFF4A1A7A)],
  );
  static const goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFD700), Color(0xFFFF8C00)],
  );

  static Color zodiacColor(String element) {
    switch (element) {
      case 'fire': return fire;
      case 'earth': return earth;
      case 'air': return air;
      default: return water;
    }
  }
}
