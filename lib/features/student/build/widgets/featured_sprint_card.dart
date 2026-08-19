import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/sprint_model.dart';

class FeaturedSprintCard extends StatelessWidget {
  final SprintModel sprint;

  const FeaturedSprintCard({
    super.key,
    required this.sprint,
  });

  // ==========================================================
  // CONTINUE SPRINT
  // ==========================================================

  void _continueSprint(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (bottomSheetContext) {
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
                // SPRINT INFORMATION
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

                // ------------------------------------------------
                // PROGRESS
                // ------------------------------------------------

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

                const SizedBox(height: 24),

                // ------------------------------------------------
                // CONTINUE BUTTON
                // ------------------------------------------------

                _ContinueButton(
                  onTap: () {
                    Navigator.of(bottomSheetContext).pop();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Continuing ${sprint.title}',
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
          // ======================================================
          // FEATURED SPRINT HEADER
          // ======================================================

          Row(
            children: [
              const Icon(
                Icons.construction_rounded,
                color: AppColors.primary,
                size: 22,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  'Featured Sprint',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ======================================================
          // SPRINT TITLE
          // ======================================================

          Text(
            sprint.title,
            style: AppTypography.displayMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // ======================================================
          // DESCRIPTION
          // ======================================================

          Text(
            sprint.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 20),

          // ======================================================
          // SPRINT NUMBER
          // ======================================================

          Text(
            'Sprint ${sprint.sprintNumber} of '
                '${sprint.totalSprints}',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // ======================================================
          // PROGRESS BAR
          // ======================================================

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.grey.shade200,
              valueColor:
              const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            '$percentage% Completed',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 20),

          // ======================================================
          // XP + TEAM MEMBERS
          // ======================================================

          Row(
            children: [
              const Icon(
                Icons.emoji_events_rounded,
                color: Colors.amber,
                size: 21,
              ),

              const SizedBox(width: 6),

              Text(
                '${sprint.xp} XP',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.groups_rounded,
                color: Colors.blue,
                size: 21,
              ),

              const SizedBox(width: 6),

              Text(
                '${sprint.teamMembers} Members',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // ======================================================
          // CONTINUE SPRINT BUTTON
          // ======================================================

          _ContinueButton(
            onTap: () {
              _continueSprint(context);
            },
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CONTINUE BUTTON
// ============================================================

class _ContinueButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ContinueButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
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
          child: const Center(
            child: Text(
              'Continue Sprint',
              style: TextStyle(
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