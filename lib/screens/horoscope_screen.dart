import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/zodiac_data.dart';

class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({super.key});
  @override
  State<HoroscopeScreen> createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  String _selectedTab = 'daily';
  ZodiacSign? _selectedSign;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(child: _selectedSign == null ? _buildSignGrid() : _buildReading()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          if (_selectedSign != null)
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
              onPressed: () => setState(() => _selectedSign = null),
            ),
          Expanded(
            child: Text(
              _selectedSign != null ? _selectedSign!.nameTR : 'Burç Falı',
              style: const TextStyle(color: AppColors.gold, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    final tabs = [('daily', 'Günlük'), ('weekly', 'Haftalık'), ('compat', 'Uyum')];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: tabs.map((t) {
          final selected = _selectedTab == t.$1;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTab = t.$1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? AppColors.purple : AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(t.$2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selected ? AppColors.white : AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSignGrid() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 0.85, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemCount: zodiacSigns.length,
        itemBuilder: (ctx, i) {
          final sign = zodiacSigns[i];
          final color = AppColors.zodiacColor(sign.element);
          return GestureDetector(
            onTap: () => setState(() => _selectedSign = sign),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withOpacity(0.4), width: 1.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(sign.emoji, style: const TextStyle(fontSize: 28)),
                  const SizedBox(height: 4),
                  Text(sign.nameTR, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildReading() {
    final sign = _selectedSign!;
    final color = AppColors.zodiacColor(sign.element);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color.withOpacity(0.2), AppColors.surface]),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withOpacity(0.5)),
            ),
            child: Column(
              children: [
                Text(sign.emoji, style: const TextStyle(fontSize: 64)),
                const SizedBox(height: 8),
                Text(sign.nameTR, style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold)),
                Text(sign.dateRange, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                Text('Gezegen: ${sign.planet}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildReadingCard('Genel', 'Bugün evrensel enerjiler sizin lehinize çalışıyor. Yeni fırsatlar kapınızı çalabilir, açık ve hazır olun.', color),
          const SizedBox(height: 12),
          _buildReadingCard('Aşk', 'İlişkilerinizde derinlik ve anlayış ön plana çıkıyor. Partnerinizle kaliteli zaman geçirin.', color),
          const SizedBox(height: 12),
          _buildReadingCard('Kariyer', 'Profesyonel alanda güçlü adımlar atabilirsiniz. Projelerinize odaklanın.', color),
          const SizedBox(height: 12),
          _buildReadingCard('Sağlık', 'Enerji seviyeniz yüksek. Fiziksel aktiviteye zaman ayırın.', color),
        ],
      ),
    );
  }

  Widget _buildReadingCard(String title, String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(color: AppColors.textPrimary, height: 1.5)),
        ],
      ),
    );
  }
}
