import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/training_model.dart';

class FeaturedExpertCard extends StatelessWidget {
  final TrainingModel training;

  const FeaturedExpertCard({
    super.key,
    required this.training,
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
                Icons.workspace_premium,
                color: Colors.amber,
              ),

              const SizedBox(width: 8),

              Text(
                "Featured Expert Deep-Dive",
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            training.title,
            style: AppTypography.displayMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            training.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              const Icon(
                Icons.person,
                color: Colors.blue,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  "Expert Session",
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: training.progress,
              minHeight: 10,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation(
                AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "${(training.progress * 100).toInt()}% Learning Progress",
            style: AppTypography.bodySmall,
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              const Icon(
                Icons.schedule,
                color: Colors.orange,
              ),

              const SizedBox(width: 6),

              Text(
                training.duration,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.emoji_events,
                color: Colors.amber,
              ),

              const SizedBox(width: 6),

              Text(
                "${training.xp} XP",
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
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
                "Join Expert Session",
              ),
            ),
          ),
        ],
      ),
    );
  }
}