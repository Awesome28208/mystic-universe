import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'theme/app_colors.dart';
import 'services/coin_service.dart';
import 'screens/horoscope_screen.dart';
import 'screens/tarot_screen.dart';
import 'screens/fortune_screen.dart';
import 'screens/games_screen.dart';
import 'screens/daily_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final coinService = CoinService();
  await coinService.init();
  runApp(
    ChangeNotifierProvider.value(
      value: coinService,
      child: const MysticUniverseApp(),
    ),
  );
}

class MysticUniverseApp extends StatelessWidget {
  const MysticUniverseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mystic Universe',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  final _screens = const [
    HoroscopeScreen(),
    TarotScreen(),
    FortuneScreen(),
    GamesScreen(),
    DailyScreen(),
  ];

  final _navItems = const [
    BottomNavigationBarItem(icon: Text('♈', style: TextStyle(fontSize: 20)), label: 'Burç'),
    BottomNavigationBarItem(icon: Text('🃏', style: TextStyle(fontSize: 20)), label: 'Tarot'),
    BottomNavigationBarItem(icon: Text('☕', style: TextStyle(fontSize: 20)), label: 'Fal'),
    BottomNavigationBarItem(icon: Text('🎮', style: TextStyle(fontSize: 20)), label: 'Oyunlar'),
    BottomNavigationBarItem(icon: Text('⭐', style: TextStyle(fontSize: 20)), label: 'Günlük'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coinService = context.watch<CoinService>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text(
          '✨ Mystic Universe',
          style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              gradient: AppColors.goldGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '🪙 ${coinService.coins}',
              style: const TextStyle(color: AppColors.background, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        // Swipe ile geçiş — Flutter'da 2 satır!
        onPageChanged: (i) => setState(() => _currentIndex = i),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
          _pageController.animateToPage(i,
              duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
        },
        type: BottomNavigationBarType.fixed,
        items: _navItems,
      ),
    );
  }
}
