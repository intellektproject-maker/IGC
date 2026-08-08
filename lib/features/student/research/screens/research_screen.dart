import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../providers/research_provider.dart';

import '../widgets/featured_research_card.dart';
import '../widgets/literature_card.dart';
import '../widgets/paper_card.dart';
import '../widgets/research_event_card.dart';
import '../widgets/research_project_card.dart';
import '../widgets/research_stat_card.dart';

class ResearchScreen extends ConsumerWidget {
  const ResearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredResearch = ref.watch(featuredResearchProvider);

    final statistics = ref.watch(researchStatisticsProvider);

    final projects = ref.watch(researchProjectsProvider);

    final papers = ref.watch(researchPapersProvider);

    final literature = ref.watch(literatureProvider);

    final events = ref.watch(researchEventsProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Research",
          style: AppTypography.titleLarge.copyWith(color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              featuredResearch.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (project) {
                  if (project == null) {
                    return const SizedBox();
                  }

                  return FeaturedResearchCard(project: project);
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
                      ResearchStatCard(
                        title: "Projects",
                        value: data["projects"].toString(),
                        icon: Icons.science,
                        iconColor: Colors.blue,
                      ),

                      ResearchStatCard(
                        title: "Papers",
                        value: data["papers"].toString(),
                        icon: Icons.article,
                        iconColor: Colors.orange,
                      ),

                      ResearchStatCard(
                        title: "Published",
                        value: data["published"].toString(),
                        icon: Icons.workspace_premium,
                        iconColor: Colors.green,
                      ),

                      ResearchStatCard(
                        title: "Citations",
                        value: data["citations"].toString(),
                        icon: Icons.menu_book,
                        iconColor: Colors.purple,
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Research Projects",
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
                        .map((project) => ResearchProjectCard(project: project))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Research Papers",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),
              papers.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (paperList) {
                  return Column(
                    children: paperList
                        .map((paper) => PaperCard(paper: paper))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Literature Review",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              literature.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (literatureList) {
                  return Column(
                    children: literatureList
                        .map((item) => LiteratureCard(literature: item))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Research Events",
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
                        .map((event) => ResearchEventCard(event: event))
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
