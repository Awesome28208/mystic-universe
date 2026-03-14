import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MysticCard extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final VoidCallback? onTap;

  const MysticCard({
    super.key,
    required this.child,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor ?? AppColors.purple.withOpacity(0.3),
            width: 1.5,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              (borderColor ?? AppColors.purple).withOpacity(0.15),
              AppColors.surface,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
