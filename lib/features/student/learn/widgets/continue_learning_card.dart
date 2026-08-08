import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../models/training_model.dart';

class ContinueLearningCard extends StatelessWidget {
  final TrainingModel training;

  const ContinueLearningCard({
    super.key,
    required this.training,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(
        AppSpacing.cardPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
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
                Icons.play_circle_fill,
                color: Colors.white,
                size: 20,
              ),

              const SizedBox(
                width: AppSpacing.sm,
              ),

              Text(
                "Continue Learning",
                style: AppTypography.labelLarge,
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          Text(
            training.title,
            style: AppTypography.titleLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: AppSpacing.xs,
          ),

          Text(
            training.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.bodyMedium.copyWith(
              color: Colors.white70,
            ),
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: training.progress,
              minHeight: 8,
              backgroundColor: Colors.white24,
              valueColor:
              const AlwaysStoppedAnimation(
                Colors.white,
              ),
            ),
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "${(training.progress * 100).toInt()}% Completed",
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.white,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "+${training.xp} XP",
                  style: AppTypography.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppRadius.button,
                  ),
                ),
              ),

              child: const Text(
                "Continue",
              ),
            ),
          ),
        ],
      ),
    );
  }
}