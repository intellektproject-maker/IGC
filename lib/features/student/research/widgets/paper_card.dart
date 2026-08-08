import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../models/paper_model.dart';

class PaperCard extends StatelessWidget {
  final PaperModel paper;

  const PaperCard({
    super.key,
    required this.paper,
  });

  Color _statusColor() {
    switch (paper.status) {
      case "published":
        return Colors.green;

      case "accepted":
        return Colors.blue;

      case "under_review":
        return Colors.orange;

      case "rejected":
        return Colors.red;

      default:
        return AppColors.primary;
    }
  }

  String _statusText() {
    switch (paper.status) {
      case "under_review":
        return "Under Review";

      case "accepted":
        return "Accepted";

      case "published":
        return "Published";

      case "submitted":
        return "Submitted";

      case "rejected":
        return "Rejected";

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Expanded(
                child: Text(
                  paper.title,
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
            paper.abstract,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          Row(
            children: [

              const Icon(
                Icons.school,
                size: 18,
                color: AppColors.primary,
              ),

              const SizedBox(width: 4),

              Expanded(
                child: Text(
                  paper.journal,
                  style: AppTypography.bodySmall,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          Row(
            children: [

              const Icon(
                Icons.public,
                size: 18,
                color: Colors.blue,
              ),

              const SizedBox(width: 4),

              Text(
                paper.indexing,
                style: AppTypography.bodySmall,
              ),

              const Spacer(),

              const Icon(
                Icons.menu_book,
                size: 18,
                color: Colors.green,
              ),

              const SizedBox(width: 4),

              Text(
                "${paper.citations}",
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}