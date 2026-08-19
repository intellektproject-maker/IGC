import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/sprint_model.dart';

class SprintCard extends StatelessWidget {
  final SprintModel sprint;

  const SprintCard({
    super.key,
    required this.sprint,
  });

  // ==========================================================
  // CONTINUE / VIEW SPRINT
  // ==========================================================

  void _openSprint(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            24,
            24,
            24,
            32,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ------------------------------------------------
                // HANDLE
                // ------------------------------------------------

                Center(
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ------------------------------------------------
                // TITLE
                // ------------------------------------------------

                Text(
                  sprint.title,
                  style: AppTypography.titleLarge.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // ------------------------------------------------
                // CATEGORY
                // ------------------------------------------------

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
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
                    sprint.category,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ------------------------------------------------
                // DESCRIPTION
                // ------------------------------------------------

                Text(
                  sprint.description,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 20),

                // ------------------------------------------------
                // SPRINT PROGRESS
                // ------------------------------------------------

                Text(
                  'Sprint ${sprint.sprintNumber} of '
                      '${sprint.totalSprints}',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: sprint.progress.clamp(0.0, 1.0),
                    minHeight: 10,
                    backgroundColor: Colors.grey.shade200,
                    valueColor:
                    const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  '${(sprint.progress * 100).toInt()}% Completed',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 20),

                // ------------------------------------------------
                // TEAM MEMBERS
                // ------------------------------------------------

                Row(
                  children: [
                    const Icon(
                      Icons.groups_rounded,
                      size: 21,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${sprint.teamMembers} Members',
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ------------------------------------------------
                // ACTION
                // ------------------------------------------------

                _SprintActionButton(
                  label: sprint.active
                      ? 'Continue Sprint'
                      : 'View Sprint',
                  onTap: () {
                    Navigator.of(sheetContext).pop();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          sprint.active
                              ? 'Continuing ${sprint.title}'
                              : 'Viewing ${sprint.title}',
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    final double progress =
    sprint.progress.clamp(0.0, 1.0);

    final int percentage =
    (progress * 100).toInt();

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
          // ======================================================
          // TITLE + CATEGORY
          // ======================================================

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  sprint.title,
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 8),

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
                  sprint.category,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          // ======================================================
          // DESCRIPTION
          // ======================================================

          Text(
            sprint.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          // ======================================================
          // SPRINT NUMBER
          // ======================================================

          Text(
            'Sprint ${sprint.sprintNumber} of '
                '${sprint.totalSprints}',
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          // ======================================================
          // PROGRESS BAR
          // ======================================================

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor:
              const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          // ======================================================
          // PROGRESS + MEMBERS
          // ======================================================

          Row(
            children: [
              Text(
                '$percentage%',
                style: AppTypography.bodySmall,
              ),

              const Spacer(),

              const Icon(
                Icons.groups_rounded,
                size: 18,
                color: Colors.blue,
              ),

              const SizedBox(width: 4),

              Text(
                '${sprint.teamMembers} Members',
                style: AppTypography.bodySmall,
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          // ======================================================
          // ACTION BUTTON
          // ======================================================

          _SprintActionButton(
            label: sprint.active
                ? 'Continue Sprint'
                : 'View Sprint',
            onTap: () {
              _openSprint(context);
            },
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SPRINT ACTION BUTTON
// ============================================================

class _SprintActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SprintActionButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Material(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(
          AppRadius.button,
        ),
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            AppRadius.button,
          ),
          splashColor: Colors.white.withValues(
            alpha: 0.12,
          ),
          highlightColor: Colors.white.withValues(
            alpha: 0.06,
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}