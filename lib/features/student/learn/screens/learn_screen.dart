import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../providers/learn_provider.dart';

import '../widgets/achievement_card.dart';
import '../widgets/expert_session_card.dart';
import '../widgets/featured_expert_card.dart';
import '../widgets/masterclass_card.dart';

class LearnScreen extends ConsumerWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featured = ref.watch(continueLearningProvider);

    final expertSessions = ref.watch(mandatoryTrainingsProvider);

    final masterclasses = ref.watch(optionalTrainingsProvider);

    final achievements = ref.watch(learnStatisticsProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Text(
          "Learn",
          style: AppTypography.titleLarge.copyWith(
            color: Colors.white,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSpacing.screenPadding,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// ==================================================
              /// Featured Expert Deep-Dive
              /// ==================================================

              featured.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),

                error: (_, _) => const SizedBox(),

                data: (training) {
                  if (training == null) {
                    return const SizedBox();
                  }

                  return FeaturedExpertCard(
                    training: training,
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              /// ==================================================
              /// Learning Achievements
              /// ==================================================

              Text(
                "Learning Achievements",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              achievements.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),

                error: (_, _) => const SizedBox(),

                data: (stats) {
                  return AchievementCard(
                    statistics: stats,
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              /// ==================================================
              /// Monthly Expert Deep-Dives
              /// ==================================================

              Text(
                "Monthly Expert Deep-Dives",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              expertSessions.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),

                error: (_, _) => const SizedBox(),

                data: (sessions) {
                  return Column(
                    children: sessions
                        .map(
                          (item) => ExpertSessionCard(
                        training: item,
                      ),
                    )
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              /// ==================================================
              /// Hands-on Masterclasses
              /// ==================================================

              Text(
                "Hands-on Masterclasses",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              masterclasses.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),

                error: (_, _) => const SizedBox(),

                data: (courses) {
                  return Column(
                    children: courses
                        .map(
                          (item) => MasterclassCard(
                        training: item,
                      ),
                    )
                        .toList(),
                  );
                },
              ),

              const SizedBox(
                height: AppSpacing.xxl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}