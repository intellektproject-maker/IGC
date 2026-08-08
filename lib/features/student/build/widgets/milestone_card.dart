import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/milestone_model.dart';

class MilestoneCard extends StatelessWidget {
  final MilestoneModel milestone;

  const MilestoneCard({
    super.key,
    required this.milestone,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor =
    milestone.completed
        ? Colors.green
        : Colors.orange;

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

              Icon(
                milestone.completed
                    ? Icons.check_circle
                    : Icons.schedule,
                color: statusColor,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  milestone.title,
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
                  color: statusColor.withValues(
                    alpha: 0.12,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppRadius.pill,
                  ),
                ),
                child: Text(
                  milestone.completed
                      ? "Completed"
                      : "Pending",
                  style: AppTypography.bodySmall.copyWith(
                    color: statusColor,
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
            milestone.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          Row(
            children: [

              const Icon(
                Icons.calendar_today,
                size: 18,
                color: Colors.grey,
              ),

              const SizedBox(width: 6),

              Text(
                "${milestone.dueDate.day}/${milestone.dueDate.month}/${milestone.dueDate.year}",
                style: AppTypography.bodySmall,
              ),

              const Spacer(),

              const Icon(
                Icons.emoji_events,
                size: 18,
                color: Colors.amber,
              ),

              const SizedBox(width: 4),

              Text(
                "${milestone.xp} XP",
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}