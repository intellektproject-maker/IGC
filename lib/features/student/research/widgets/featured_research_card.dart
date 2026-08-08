import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/research_project_model.dart';

class FeaturedResearchCard extends StatelessWidget {
  final ResearchProjectModel project;

  const FeaturedResearchCard({
    super.key,
    required this.project,
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
                Icons.science,
                color: AppColors.primary,
              ),

              const SizedBox(width: 8),

              Text(
                "Featured Research",
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            project.title,
            style: AppTypography.displayMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            project.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Publication Target",
            style: AppTypography.labelMedium.copyWith(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            project.publicationTarget,
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: project.progress,
              minHeight: 10,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation(
                AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "${(project.progress * 100).toInt()}% Completed",
            style: AppTypography.bodySmall,
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
                "Continue Research",
              ),
            ),
          ),
        ],
      ),
    );
  }
}