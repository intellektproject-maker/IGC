import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/sprint_model.dart';

class FeaturedSprintCard extends StatelessWidget {
  final SprintModel sprint;

  const FeaturedSprintCard({
    super.key,
    required this.sprint,
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
                Icons.construction,
                color: AppColors.primary,
              ),

              const SizedBox(width: 8),

              Text(
                "Featured Sprint",
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            sprint.title,
            style: AppTypography.displayMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            sprint.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Sprint ${sprint.sprintNumber} of ${sprint.totalSprints}",
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: sprint.progress,
              minHeight: 10,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation(
                AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "${(sprint.progress * 100).toInt()}% Completed",
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
                "${sprint.xp} XP",
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
                "${sprint.teamMembers} Members",
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
                "Continue Building",
              ),
            ),
          ),
        ],
      ),
    );
  }
}