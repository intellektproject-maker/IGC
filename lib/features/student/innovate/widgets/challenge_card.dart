import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../models/challenge_model.dart';

class ChallengeCard extends StatelessWidget {
  final ChallengeModel challenge;

  const ChallengeCard({
    super.key,
    required this.challenge,
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
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Expanded(
                child: Text(
                  challenge.title,
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
                    alpha: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppRadius.pill,
                  ),
                ),
                child: Text(
                  challenge.category,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.sm),

          Text(
            challenge.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          Row(
            children: [

              const Icon(
                Icons.emoji_events,
                color: Colors.amber,
                size: 20,
              ),

              const SizedBox(width: 6),

              Text(
                "${challenge.xp} XP",
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.people,
                size: 18,
                color: Colors.grey,
              ),

              const SizedBox(width: 4),

              Text(
                "${challenge.participants}",
                style: AppTypography.bodySmall,
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),

              child: Text(
                challenge.joined
                    ? "Continue"
                    : "Participate",
              ),
            ),
          ),
        ],
      ),
    );
  }
}