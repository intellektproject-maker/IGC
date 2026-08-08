import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../providers/innovate_provider.dart';

import '../widgets/challenge_card.dart';
import '../widgets/event_card.dart';
import '../widgets/featured_challenge_card.dart';
import '../widgets/idea_card.dart';
import '../widgets/innovation_stat_card.dart';

class InnovateScreen extends ConsumerWidget {
  const InnovateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredChallenge = ref.watch(featuredChallengeProvider);

    final statistics = ref.watch(innovateStatisticsProvider);

    final challenges = ref.watch(challengesProvider);

    final ideas = ref.watch(ideasProvider);

    final events = ref.watch(eventsProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Innovate",
          style: AppTypography.titleLarge.copyWith(color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// ==========================
              /// Featured Challenge
              /// ==========================
              featuredChallenge.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (challenge) {
                  if (challenge == null) {
                    return const SizedBox();
                  }

                  return FeaturedChallengeCard(challenge: challenge);
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Overview",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),
              statistics.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (data) {
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: AppSpacing.md,
                    mainAxisSpacing: AppSpacing.md,
                    childAspectRatio: 1.15,

                    children: [
                      InnovationStatCard(
                        title: "Ideas",
                        value: data["ideas"].toString(),
                        icon: Icons.lightbulb,
                        iconColor: Colors.amber,
                      ),

                      InnovationStatCard(
                        title: "Challenges",
                        value: data["joined"].toString(),
                        icon: Icons.rocket_launch,
                        iconColor: Colors.blue,
                      ),

                      InnovationStatCard(
                        title: "XP Earned",
                        value: data["xp"].toString(),
                        icon: Icons.stars,
                        iconColor: Colors.orange,
                      ),

                      InnovationStatCard(
                        title: "Shortlisted",
                        value: data["shortlisted"].toString(),
                        icon: Icons.workspace_premium,
                        iconColor: Colors.green,
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Innovation Challenges",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),
              challenges.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (challengeList) {
                  return Column(
                    children: challengeList
                        .map((challenge) => ChallengeCard(challenge: challenge))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "My Ideas",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              ideas.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (ideaList) {
                  return Column(
                    children: ideaList
                        .map((idea) => IdeaCard(idea: idea))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Upcoming Events",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),
              events.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (eventList) {
                  return Column(
                    children: eventList
                        .map((event) => EventCard(event: event))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
