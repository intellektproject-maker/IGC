import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/venture_model.dart';

class VentureCard extends StatelessWidget {
  final VentureModel venture;

  const VentureCard({
    super.key,
    required this.venture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppSpacing.md,
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  venture.title,
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: 0.10,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppRadius.pill,
                  ),
                ),
                child: Text(
                  venture.industry,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          Text(
            venture.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          Text(
            venture.stage,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: venture.progress,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation(
                AppColors.primary,
              ),
            ),
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          Row(
            children: [
              Text(
                "${(venture.progress * 100).toInt()}%",
                style: AppTypography.bodySmall,
              ),

              const Spacer(),

              const Icon(
                Icons.groups,
                size: 18,
                color: Colors.blue,
              ),

              const SizedBox(width: 4),

              Text(
                "${venture.teamMembers} Members",
                style: AppTypography.bodySmall,
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          Row(
            children: [
              const Icon(
                Icons.emoji_events,
                color: Colors.amber,
                size: 18,
              ),

              const SizedBox(width: 6),

              Text(
                "Score ${venture.startupScore}",
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              if (venture.incubated)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(
                      alpha: 0.12,
                    ),
                    borderRadius: BorderRadius.circular(
                      AppRadius.pill,
                    ),
                  ),
                  child: Text(
                    "Incubated",
                    style: AppTypography.bodySmall.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
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