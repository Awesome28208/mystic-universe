import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/tarot_data.dart';

class TarotScreen extends StatefulWidget {
  const TarotScreen({super.key});
  @override
  State<TarotScreen> createState() => _TarotScreenState();
}

class _TarotScreenState extends State<TarotScreen> with SingleTickerProviderStateMixin {
  final List<int> _selected = [];
  List<TarotCard>? _drawnCards;
  String _focus = 'love';
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  final _focuses = [
    ('love', 'Ask', '💕'),
    ('career', 'Kariyer', '💼'),
    ('money', 'Para', '💰'),
    ('health', 'Saglik', '🌿'),
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
  }

  @override
  void dispose() { _animController.dispose(); super.dispose(); }

  void _drawCards() {
    final rng = Random();
    final indices = List.generate(majorArcana.length, (i) => i)..shuffle(rng);
    setState(() {
      _drawnCards = [majorArcana[indices[0]], majorArcana[indices[1]], majorArcana[indices[2]]];
    });
    _animController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Tarot', style: TextStyle(color: AppColors.gold, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            ),
            _buildFocusTabs(),
            const SizedBox(height: 16),
            if (_drawnCards == null) ...[
              Expanded(child: _buildShuffleArea()),
              _buildDrawButton(),
              const SizedBox(height: 24),
            ] else ...[
              Expanded(child: _buildReading()),
              _buildResetButton(),
              const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFocusTabs() {
    return SizedBox(
      height: 42,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: _focuses.map((f) {
          final sel = _focus == f.$1;
          return GestureDetector(
            onTap: () => setState(() => _focus = f.$1),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: sel ? AppColors.purple : AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: sel ? AppColors.purpleLight : AppColors.surfaceLight),
              ),
              child: Text('\${f.\$3} \${f.\$2}', style: TextStyle(color: sel ? AppColors.white : AppColors.textSecondary, fontSize: 13)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildShuffleArea() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('🃏', style: TextStyle(fontSize: 80)),
          const SizedBox(height: 16),
          const Text('Kartlari karistir, 3 kart seç', style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
          const SizedBox(height: 8),
          Text('Odak: \${_focuses.firstWhere((f) => f.\$1 == _focus).\$2}',
              style: const TextStyle(color: AppColors.purpleLight, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildDrawButton() {
    return GestureDetector(
      onTap: _drawCards,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: AppColors.purpleGradient,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: AppColors.purple.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 8))],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('✨', style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Text('Kartlari Çek  — 10 Coin', style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildReading() {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: _drawnCards!.asMap().entries.map((e) {
                final labels = ['Geçmiş', 'Simdi', 'Gelecek'];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Text(labels[e.key], style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: AppColors.purpleGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(e.value.emoji, style: const TextStyle(fontSize: 36)),
                              const SizedBox(height: 6),
                              Text(e.value.nameTR, style: const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ..._drawnCards!.asMap().entries.map((e) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\${e.value.emoji} \${e.value.nameTR}', style: const TextStyle(color: AppColors.purpleLight, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(e.value.meaning, style: const TextStyle(color: AppColors.textPrimary, height: 1.5)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return GestureDetector(
      onTap: () { setState(() => _drawnCards = null); _animController.reset(); },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: AppColors.surfaceLight, borderRadius: BorderRadius.circular(30)),
        child: const Text('Yeniden Çek', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
      ),
    );
  }
}