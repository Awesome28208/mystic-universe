import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  static const _games = [
    ('gem_match',       'Gem Match',       '💎', 'Taşları eşleştir, coin kazan!'),
    ('crystal_garden',  'Crystal Garden',  '🌸', 'Bahçeni büyüt, kristalleri topla'),
    ('mystic_solitaire','Mystic Solitaire', '🃏', 'Mistik soliter oyna'),
    ('word_spell',      'Word Spell',       '✨', 'Büyülü kelimeleri bul'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Oyunlar',
                  style: TextStyle(color: AppColors.gold, fontSize: 24,
                      fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: _games.map((g) =>
                    _GameCard(name: g.$2, emoji: g.$3, desc: g.$4)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  final String name, emoji, desc;
  const _GameCard({required this.name, required this.emoji, required this.desc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.surface,
          title: Text(name,
              style: const TextStyle(color: AppColors.gold)),
          content: Text('$emoji\n\n$desc\n\nYakında geliyor!',
              style: const TextStyle(color: AppColors.textPrimary),
              textAlign: TextAlign.center),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tamam',
                  style: TextStyle(color: AppColors.purple)),
            )
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.surface, AppColors.surfaceLight],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.purple.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 10),
            Text(name,
                style: const TextStyle(color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(desc,
                  style: const TextStyle(color: AppColors.textSecondary,
                      fontSize: 11),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
