import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../providers/build_provider.dart';

import '../widgets/build_event_card.dart';
import '../widgets/build_project_card.dart';
import '../widgets/build_stat_card.dart';
import '../widgets/featured_sprint_card.dart';
import '../widgets/milestone_card.dart';
import '../widgets/sprint_card.dart';

class BuildScreen extends ConsumerWidget {
  const BuildScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredSprint = ref.watch(featuredSprintProvider);

    final statistics = ref.watch(buildStatisticsProvider);

    final sprints = ref.watch(sprintsProvider);

    final milestones = ref.watch(milestonesProvider);

    final projects = ref.watch(buildProjectsProvider);

    final events = ref.watch(buildEventsProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Build",
          style: AppTypography.titleLarge.copyWith(color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              featuredSprint.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (sprint) {
                  if (sprint == null) {
                    return const SizedBox();
                  }

                  return FeaturedSprintCard(sprint: sprint);
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
                      BuildStatCard(
                        title: "Active Sprints",
                        value: data["activeSprints"].toString(),
                        icon: Icons.rocket_launch,
                        iconColor: Colors.blue,
                      ),

                      BuildStatCard(
                        title: "Milestones",
                        value: data["milestones"].toString(),
                        icon: Icons.flag,
                        iconColor: Colors.orange,
                      ),

                      BuildStatCard(
                        title: "XP Earned",
                        value: data["xp"].toString(),
                        icon: Icons.emoji_events,
                        iconColor: Colors.amber,
                      ),

                      BuildStatCard(
                        title: "Team Members",
                        value: data["teams"].toString(),
                        icon: Icons.groups,
                        iconColor: Colors.green,
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Product Sprints",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              sprints.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (sprintList) {
                  return Column(
                    children: sprintList
                        .map((sprint) => SprintCard(sprint: sprint))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Sprint Milestones",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),
              milestones.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (milestoneList) {
                  return Column(
                    children: milestoneList
                        .map((milestone) => MilestoneCard(milestone: milestone))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "My Projects",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              projects.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (projectList) {
                  return Column(
                    children: projectList
                        .map((project) => BuildProjectCard(project: project))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Upcoming Build Events",
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
                        .map((event) => BuildEventCard(event: event))
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
