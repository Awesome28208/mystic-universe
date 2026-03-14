import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class FortuneScreen extends StatefulWidget {
  const FortuneScreen({super.key});
  @override
  State<FortuneScreen> createState() => _FortuneScreenState();
}

class _FortuneScreenState extends State<FortuneScreen> {
  String _mode = 'coffee'; // coffee / numerology

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Fal', style: TextStyle(color: AppColors.gold, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            ),
            _buildModeTabs(),
            const SizedBox(height: 16),
            Expanded(child: _mode == 'coffee' ? const CoffeeFortune() : const NumerologyFortune()),
          ],
        ),
      ),
    );
  }

  Widget _buildModeTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tab('coffee', '☕ Kahve Fali'),
        const SizedBox(width: 12),
        _tab('numerology', '🔢 Numeroloji'),
      ],
    );
  }

  Widget _tab(String mode, String label) {
    final sel = _mode == mode;
    return GestureDetector(
      onTap: () => setState(() => _mode = mode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: sel ? AppColors.purple : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: sel ? AppColors.purpleLight : AppColors.surfaceLight),
        ),
        child: Text(label, style: TextStyle(color: sel ? AppColors.white : AppColors.textSecondary, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class CoffeeFortune extends StatefulWidget {
  const CoffeeFortune({super.key});
  @override
  State<CoffeeFortune> createState() => _CoffeeFortuneState();
}

class _CoffeeFortuneState extends State<CoffeeFortune> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.purple.withOpacity(0.3)),
            ),
            child: Center(
              child: _revealed
                  ? const Text('☕', style: TextStyle(fontSize: 80))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('☕', style: TextStyle(fontSize: 60)),
                        const SizedBox(height: 12),
                        const Text('Fincanini çevir,', style: TextStyle(color: AppColors.textSecondary)),
                        const Text('sekillerin sirlarini kesfet', style: TextStyle(color: AppColors.textSecondary)),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 20),
          if (!_revealed)
            GestureDetector(
              onTap: () => setState(() => _revealed = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                decoration: BoxDecoration(
                  gradient: AppColors.purpleGradient,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text('Fali Açikla  — 15 Coin', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            )
          else ...[
            _readingTile('Genel', 'Fincaninda bir kelebek sekli görünüyor. Bu özgürlük ve dönüsümün habercisi. Yakininda güzel bir degisim geliyor.'),
            _readingTile('Ask', 'Kalp seklinin sol tarafinda bir yol var. Bu iliskinde yeni bir dönüm noktasina ulasacagini gösteriyor.'),
            _readingTile('Is', 'Büyük bir daire var. Bu bir döngünün tamamlanmasi ve yeni fırsatlarin habercisi.'),
          ]
        ],
      ),
    );
  }

  Widget _readingTile(String title, String text) => Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(text, style: const TextStyle(color: AppColors.textPrimary, height: 1.5)),
      ],
    ),
  );
}

class NumerologyFortune extends StatefulWidget {
  const NumerologyFortune({super.key});
  @override
  State<NumerologyFortune> createState() => _NumerologyFortuneState();
}

class _NumerologyFortuneState extends State<NumerologyFortune> {
  final _controller = TextEditingController();
  int? _lifePathNumber;

  int _calcLifePath(String birthdate) {
    final digits = birthdate.replaceAll(RegExp(r'[^0-9]'), '');
    int sum = digits.split('').map(int.parse).reduce((a, b) => a + b);
    while (sum > 9 && sum != 11 && sum != 22 && sum != 33) {
      sum = sum.toString().split('').map(int.parse).reduce((a, b) => a + b);
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                const Text('Dogum tarihini gir', style: TextStyle(color: AppColors.textSecondary)),
                const SizedBox(height: 12),
                TextField(
                  controller: _controller,
                  style: const TextStyle(color: AppColors.textPrimary),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'GG/AA/YYYY',
                    hintStyle: const TextStyle(color: AppColors.textSecondary),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.purple)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.purple)),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => setState(() => _lifePathNumber = _calcLifePath(_controller.text)),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.purple),
                  child: const Text('Hesapla  — 10 Coin', style: TextStyle(color: AppColors.white)),
                ),
              ],
            ),
          ),
          if (_lifePathNumber != null) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(gradient: AppColors.purpleGradient, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text('$_lifePathNumber', style: const TextStyle(color: AppColors.gold, fontSize: 72, fontWeight: FontWeight.bold)),
                  const Text('Yasam Yolu Sayiniz', style: TextStyle(color: AppColors.white, fontSize: 16)),
                  const SizedBox(height: 12),
                  const Text('Bu sayi sizin temel enerjinizi ve hayat amacınızı temsil eder. Dogadan gelen bir rehberlik bu sayida gizli.', style: TextStyle(color: AppColors.textPrimary, height: 1.5), textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}