import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../models/literature_model.dart';

class LiteratureCard extends StatelessWidget {
  final LiteratureModel literature;

  const LiteratureCard({
    super.key,
    required this.literature,
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
                  literature.title,
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Icon(
                literature.bookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                color: AppColors.primary,
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          Text(
            literature.authors,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          Row(
            children: [

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
                  literature.source,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const Spacer(),

              Text(
                literature.publicationYear.toString(),
                style: AppTypography.bodySmall,
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          Row(
            children: [

              Icon(
                literature.completed
                    ? Icons.check_circle
                    : Icons.schedule,
                color: literature.completed
                    ? Colors.green
                    : Colors.orange,
                size: 18,
              ),

              const SizedBox(width: 6),

              Text(
                literature.completed
                    ? "Completed"
                    : "Pending",
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}