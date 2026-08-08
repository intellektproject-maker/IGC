import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/business_canvas_model.dart';

class CanvasCard extends StatelessWidget {
  final BusinessCanvasModel canvas;

  const CanvasCard({
    super.key,
    required this.canvas,
  });

  Widget _buildSection(
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            value,
            style: AppTypography.bodyMedium,
          ),
        ],
      ),
    );
  }

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

              const Icon(
                Icons.dashboard_customize,
                color: AppColors.primary,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  "Business Blueprint",
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
                  color: canvas.completed
                      ? Colors.green.withValues(alpha: 0.12)
                      : Colors.orange.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(
                    AppRadius.pill,
                  ),
                ),
                child: Text(
                  canvas.completed
                      ? "Completed"
                      : "In Progress",
                  style: AppTypography.bodySmall.copyWith(
                    color: canvas.completed
                        ? Colors.green
                        : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          _buildSection(
            "Value Proposition",
            canvas.valueProposition,
          ),

          _buildSection(
            "Customer Segment",
            canvas.customerSegment,
          ),

          _buildSection(
            "Revenue Model",
            canvas.revenueModel,
          ),

          _buildSection(
            "Key Partners",
            canvas.keyPartners,
          ),

          _buildSection(
            "Channels",
            canvas.channels,
          ),

          _buildSection(
            "Cost Structure",
            canvas.costStructure,
          ),
        ],
      ),
    );
  }
}