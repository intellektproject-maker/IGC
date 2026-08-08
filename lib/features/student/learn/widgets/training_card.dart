import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../models/training_model.dart';

class TrainingCard extends StatelessWidget {
  final TrainingModel training;

  const TrainingCard({
    super.key,
    required this.training,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMandatory = training.mandatory;

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

          /// Header
          Row(
            children: [

              Expanded(
                child: Text(
                  training.title,
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
                  color: isMandatory
                      ? Colors.red.shade50
                      : Colors.green.shade50,
                  borderRadius: BorderRadius.circular(
                    AppRadius.pill,
                  ),
                ),
                child: Text(
                  isMandatory ? "Mandatory" : "Optional",
                  style: AppTypography.bodySmall.copyWith(
                    color: isMandatory
                        ? Colors.red
                        : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          /// Description
          Text(
            training.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          /// Progress
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: training.progress,
              minHeight: 8,
            ),
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          /// Details
          Row(
            children: [

              const Icon(
                Icons.schedule,
                size: 18,
                color: Colors.grey,
              ),

              const SizedBox(
                width: 4,
              ),

              Text(
                training.duration,
                style: AppTypography.bodySmall,
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(
                    AppRadius.pill,
                  ),
                ),
                child: Text(
                  "+${training.xp} XP",
                  style: AppTypography.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          /// Action Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),

              child: Text(
                training.status == "completed"
                    ? "Completed"
                    : training.status == "in_progress"
                    ? "Continue"
                    : isMandatory
                    ? "Start Training"
                    : "Enroll",
              ),
            ),
          ),
        ],
      ),
    );
  }
}