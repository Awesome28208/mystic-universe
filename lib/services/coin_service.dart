import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoinService extends ChangeNotifier {
  static const _coinsKey = 'mystic_coins';
  static const _streakKey = 'daily_streak';
  static const _lastLoginKey = 'last_login';
  static const int startCoins = 1000;

  int _coins = startCoins;
  int _streak = 0;

  int get coins => _coins;
  int get streak => _streak;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _coins = prefs.getInt(_coinsKey) ?? startCoins;
    _streak = prefs.getInt(_streakKey) ?? 0;
    await _checkDailyStreak(prefs);
    notifyListeners();
  }

  Future<void> _checkDailyStreak(SharedPreferences prefs) async {
    final lastLogin = prefs.getString(_lastLoginKey);
    final today = DateTime.now().toIso8601String().substring(0, 10);
    if (lastLogin == null) {
      await prefs.setString(_lastLoginKey, today);
    } else if (lastLogin != today) {
      final last = DateTime.parse(lastLogin);
      final diff = DateTime.now().difference(last).inDays;
      _streak = diff == 1 ? _streak + 1 : 1;
      await prefs.setInt(_streakKey, _streak);
      await prefs.setString(_lastLoginKey, today);
      await _addCoins(50 * _streak);
    }
  }

  Future<bool> spend(int amount) async {
    if (_coins < amount) return false;
    _coins -= amount;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_coinsKey, _coins);
    notifyListeners();
    return true;
  }

  Future<void> _addCoins(int amount) async {
    _coins += amount;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_coinsKey, _coins);
    notifyListeners();
  }

  Future<void> earnFromAd() => _addCoins(50);
  Future<void> earnFromGame(int amount) => _addCoins(amount);
  Future<void> addPurchased(int amount) => _addCoins(amount);
}
