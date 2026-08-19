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
          'Build',
          style: AppTypography.titleLarge.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(
            AppSpacing.screenPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              // =====================================================
              // OVERVIEW
              // =====================================================

              Text(
                'Overview',
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              statistics.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),

                error: (error, stackTrace) {
                  return const SizedBox.shrink();
                },

                data: (data) {
                  final activeSprints =
                      data['activeSprints']?.toString() ?? '0';

                  final milestonesCount =
                      data['milestones']?.toString() ?? '0';

                  final xp =
                      data['xp']?.toString() ?? '0';

                  final teams =
                      data['teams']?.toString() ?? '0';

                  return LayoutBuilder(
                    builder: (context, constraints) {

                      final double spacing = AppSpacing.md;

                      // Keep two columns on phones/tablets.
                      // Each card gets exactly half of the available width.
                      final double cardWidth =
                          (constraints.maxWidth - spacing) / 2;

                      return GridView(
                        shrinkWrap: true,
                        physics:
                        const NeverScrollableScrollPhysics(),

                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: spacing,
                          mainAxisSpacing: spacing,

                          // Aspect ratio is calculated from the
                          // actual available width.
                          childAspectRatio:
                          cardWidth / 142,
                        ),

                        children: [
                          BuildStatCard(
                            title: 'Active Sprints',
                            value: activeSprints,
                            icon: Icons.rocket_launch,
                            iconColor: Colors.blue,
                          ),

                          BuildStatCard(
                            title: 'Milestones',
                            value: milestonesCount,
                            icon: Icons.flag,
                            iconColor: Colors.orange,
                          ),

                          BuildStatCard(
                            title: 'XP Earned',
                            value: xp,
                            icon: Icons.emoji_events,
                            iconColor: Colors.amber,
                          ),

                          BuildStatCard(
                            title: 'Team Members',
                            value: teams,
                            icon: Icons.groups,
                            iconColor: Colors.green,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =====================================================
              // PRODUCT SPRINTS
              // =====================================================

              Text(
                'Product Sprints',
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              sprints.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),

                error: (error, stackTrace) {
                  return const SizedBox.shrink();
                },

                data: (sprintList) {
                  if (sprintList.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    children: sprintList
                        .map(
                          (sprint) => SprintCard(
                        sprint: sprint,
                      ),
                    )
                        .toList(),
                  );
                },
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =====================================================
              // SPRINT MILESTONES
              // =====================================================

              Text(
                'Sprint Milestones',
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              milestones.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),

                error: (error, stackTrace) {
                  return const SizedBox.shrink();
                },

                data: (milestoneList) {
                  if (milestoneList.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    children: milestoneList
                        .map(
                          (milestone) => MilestoneCard(
                        milestone: milestone,
                      ),
                    )
                        .toList(),
                  );
                },
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =====================================================
              // MY PROJECTS
              // =====================================================

              Text(
                'My Projects',
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              projects.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),

                error: (error, stackTrace) {
                  return const SizedBox.shrink();
                },

                data: (projectList) {
                  if (projectList.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    children: projectList
                        .map(
                          (project) => BuildProjectCard(
                        project: project,
                      ),
                    )
                        .toList(),
                  );
                },
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =====================================================
              // UPCOMING BUILD EVENTS
              // =====================================================

              Text(
                'Upcoming Build Events',
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              events.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),

                error: (error, stackTrace) {
                  return const SizedBox.shrink();
                },

                data: (eventList) {
                  if (eventList.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    children: eventList
                        .map(
                          (event) => BuildEventCard(
                        event: event,
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