import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../models/idea_model.dart';

class IdeaCard extends StatelessWidget {
  final IdeaModel idea;

  const IdeaCard({
    super.key,
    required this.idea,
  });

  Color _statusColor() {
    switch (idea.status) {
      case "approved":
        return Colors.green;

      case "under_review":
        return Colors.orange;

      case "rejected":
        return Colors.red;

      default:
        return AppColors.primary;
    }
  }

  String _statusText() {
    switch (idea.status) {
      case "under_review":
        return "Under Review";

      case "approved":
        return "Approved";

      case "rejected":
        return "Rejected";

      case "submitted":
        return "Submitted";

      default:
        return "Draft";
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor();

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
                  idea.title,
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
                  _statusText(),
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
            idea.description,
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
                Icons.lightbulb,
                size: 18,
                color: Colors.amber,
              ),

              const SizedBox(width: 4),

              Text(
                idea.domain,
                style: AppTypography.bodySmall,
              ),

              const Spacer(),

              const Icon(
                Icons.thumb_up,
                size: 18,
                color: Colors.blue,
              ),

              const SizedBox(width: 4),

              Text(
                "${idea.likes}",
                style: AppTypography.bodySmall,
              ),

              const SizedBox(width: 16),

              const Icon(
                Icons.comment,
                size: 18,
                color: Colors.green,
              ),

              const SizedBox(width: 4),

              Text(
                "${idea.comments}",
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}