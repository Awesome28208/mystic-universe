import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StreakService extends ChangeNotifier {
  static const String _streakKey   = 'streak_count';
  static const String _lastDayKey  = 'streak_last_day';

  int _streak = 0;
  int get streak => _streak;

  StreakService() { _load(); }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    _streak = prefs.getInt(_streakKey) ?? 0;
    notifyListeners();
  }

  /// Her gün çağır — streak'i kontrol eder ve günceller
  Future<bool> checkIn() async {
    final prefs   = await SharedPreferences.getInstance();
    final today   = DateTime.now().toIso8601String().substring(0, 10); // "2026-03-10"
    final lastDay = prefs.getString(_lastDayKey) ?? '';

    if (lastDay == today) return false; // Zaten giriş yapıldı

    final yesterday = DateTime.now()
        .subtract(const Duration(days: 1))
        .toIso8601String()
        .substring(0, 10);

    if (lastDay == yesterday) {
      _streak++;
    } else {
      _streak = 1; // Streak sıfırlandı
    }

    await prefs.setInt(_streakKey, _streak);
    await prefs.setString(_lastDayKey, today);
    notifyListeners();
    return true; // Yeni giriş
  }
}
