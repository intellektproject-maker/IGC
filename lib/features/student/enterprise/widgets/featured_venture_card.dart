import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/venture_model.dart';

class FeaturedVentureCard extends StatelessWidget {
  final VentureModel venture;

  const FeaturedVentureCard({
    super.key,
    required this.venture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppRadius.card,
        ),
        boxShadow: const [
          AppShadows.medium,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              const Icon(
                Icons.business_center,
                color: AppColors.primary,
              ),

              const SizedBox(width: 8),

              Text(
                "Featured Venture",
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            venture.title,
            style: AppTypography.displayMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            venture.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            venture.stage,
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: venture.progress,
              minHeight: 10,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation(
                AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "${(venture.progress * 100).toInt()}% Venture Progress",
            style: AppTypography.bodySmall,
          ),

          const SizedBox(height: 20),

          Row(
            children: [

              const Icon(
                Icons.emoji_events,
                color: Colors.amber,
              ),

              const SizedBox(width: 6),

              Text(
                "Score ${venture.startupScore}",
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.groups,
                color: Colors.blue,
              ),

              const SizedBox(width: 6),

              Text(
                "${venture.teamMembers} Members",
                style: AppTypography.bodyMedium,
              ),
            ],
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppRadius.button,
                  ),
                ),
              ),

              child: const Text(
                "Continue Venture",
              ),
            ),
          ),
        ],
      ),
    );
  }
}