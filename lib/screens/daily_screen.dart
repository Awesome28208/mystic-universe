import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_colors.dart';
import '../services/coin_service.dart';

class DailyScreen extends StatelessWidget {
  const DailyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coinService = context.watch<CoinService>();
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Günlük',
                  style: TextStyle(color: AppColors.gold, fontSize: 24,
                      fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              const SizedBox(height: 20),
              _buildCoinCard(coinService),
              const SizedBox(height: 16),
              _buildStreakCard(coinService),
              const SizedBox(height: 20),
              const Text('Coin Kazan',
                  style: TextStyle(color: AppColors.textPrimary,
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              _buildWatchAdCard(context, coinService),
              const SizedBox(height: 20),
              const Text('Coin Satın Al',
                  style: TextStyle(color: AppColors.textPrimary,
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              _buildShopItem('500 Coin', '💰', '₺29', false),
              const SizedBox(height: 10),
              _buildShopItem('1200 Coin', '💎', '₺59', true),
              const SizedBox(height: 10),
              _buildShopItem('2500 Coin', '👑', '₺99', false),
              const SizedBox(height: 10),
              _buildShopItem('6000 Coin', '🌟', '₺199', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoinCard(CoinService cs) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Text('🪙', style: TextStyle(fontSize: 40)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${cs.coins}',
                  style: const TextStyle(color: AppColors.background,
                      fontSize: 32, fontWeight: FontWeight.bold)),
              const Text('Coin',
                  style: TextStyle(color: AppColors.background, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStreakCard(CoinService cs) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Text('🔥', style: TextStyle(fontSize: 28)),
            const SizedBox(width: 8),
            Text('${cs.streak} Günlük Seri!',
                style: const TextStyle(color: AppColors.textPrimary,
                    fontSize: 18, fontWeight: FontWeight.bold)),
          ]),
          const SizedBox(height: 8),
          const Text('Her gün giriş yaparak bonus coin kazan!',
              style: TextStyle(color: AppColors.textSecondary, height: 1.4)),
          const SizedBox(height: 12),
          Row(
            children: List.generate(7, (i) => Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: 8,
                decoration: BoxDecoration(
                  color: i < cs.streak ? AppColors.fire : AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildWatchAdCard(BuildContext context, CoinService cs) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.purple.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Text('📺', style: TextStyle(fontSize: 32)),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Reklam İzle',
                    style: TextStyle(color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold)),
                Text('+50 Coin kazan',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              cs.earnFromAd();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('🌟 +50 Coin kazandın!')));
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.purple),
            child: const Text('İzle', style: TextStyle(color: AppColors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildShopItem(String label, String emoji, String price, bool popular) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: popular ? AppColors.gold.withOpacity(0.4) : AppColors.surfaceLight),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 16),
          Expanded(child: Text(label,
              style: const TextStyle(color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold, fontSize: 16))),
          if (popular)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                gradient: AppColors.goldGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('En İyi',
                  style: TextStyle(color: AppColors.background,
                      fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          Text(price,
              style: const TextStyle(color: AppColors.gold,
                  fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
            child: const Text('Al',
                style: TextStyle(color: AppColors.white, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
