import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/pitch_model.dart';

class PitchCard extends StatelessWidget {
  final PitchModel pitch;

  const PitchCard({
    super.key,
    required this.pitch,
  });

  @override
  Widget build(BuildContext context) {
    final bool funded = pitch.fundingReceived > 0;

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
                  pitch.title,
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
                  color: AppColors.primary.withValues(
                    alpha: 0.10,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppRadius.pill,
                  ),
                ),
                child: Text(
                  pitch.status,
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

          Text(
            "Investor: ${pitch.investor}",
            style: AppTypography.bodyMedium,
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          Row(
            children: [

              Expanded(
                child: _InfoTile(
                  title: "Requested",
                  value:
                  "₹${pitch.fundingRequested.toInt()}",
                ),
              ),

              Expanded(
                child: _InfoTile(
                  title: "Received",
                  value:
                  "₹${pitch.fundingReceived.toInt()}",
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          Row(
            children: [

              const Icon(
                Icons.emoji_events,
                color: Colors.amber,
                size: 20,
              ),

              const SizedBox(width: 6),

              Text(
                "Pitch Score ${pitch.pitchScore}",
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              if (funded)
                const Icon(
                  Icons.verified,
                  color: Colors.green,
                ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          Text(
            "Mentor Feedback",
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            pitch.mentorFeedback,
            style: AppTypography.bodyMedium,
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),

              child: const Text(
                "View Pitch",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const _InfoTile({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          value,
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          title,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}