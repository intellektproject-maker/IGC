import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

class AchievementCard extends StatelessWidget {
  final Map<String, dynamic> statistics;

  const AchievementCard({
    super.key,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppSpacing.cardPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppRadius.card,
        ),
        boxShadow: const [
          AppShadows.small,
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _item(
                  icon: Icons.workspace_premium,
                  color: Colors.amber,
                  title: "Certificates",
                  value: statistics["certificates"].toString(),
                ),
              ),
              Expanded(
                child: _item(
                  icon: Icons.stars,
                  color: Colors.deepOrange,
                  title: "XP",
                  value: statistics["xp"].toString(),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          Row(
            children: [
              Expanded(
                child: _item(
                  icon: Icons.school,
                  color: Colors.blue,
                  title: "Sessions",
                  value: statistics["completed"].toString(),
                ),
              ),
              Expanded(
                child: _item(
                  icon: Icons.menu_book,
                  color: Colors.green,
                  title: "Masterclasses",
                  value: statistics["pending"].toString(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _item({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withValues(alpha: 0.12),
          child: Icon(
            icon,
            color: color,
            size: 26,
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        Text(
          value,
          style: AppTypography.headlineMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: AppSpacing.xs),

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}