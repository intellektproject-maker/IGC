import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_names.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Text(
          'Projects',
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
              Text(
                'Explore Projects',
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: AppSpacing.xs,
              ),

              Text(
                'Choose a project track and start building your journey.',
                style: AppTypography.bodyMedium.copyWith(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              _ProjectCard(
                icon: Icons.hub_outlined,
                title: 'Innovation',
                description:
                'Turn ideas into validated innovations through challenges, ideation and experimentation.',
                onTap: () {
                  context.push(RouteNames.innovate);
                },
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              _ProjectCard(
                icon: Icons.groups_outlined,
                title: 'Build',
                description:
                'Develop functional products through sprints, milestones and real-world projects.',
                onTap: () {
                  context.push(RouteNames.build);
                },
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              _ProjectCard(
                icon: Icons.folder_outlined,
                title: 'Enterprise',
                description:
                'Scale functional solutions into organized ventures through business and venture execution.',
                onTap: () {
                  context.push(RouteNames.enterprise);
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

class _ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        AppRadius.card,
      ),
      elevation: 0,
      shadowColor: Colors.black26,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          AppRadius.card,
        ),
        onTap: onTap,
        child: Container(
          width: double.infinity,
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
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: 0.10,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppRadius.card,
                  ),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),

              const SizedBox(
                width: AppSpacing.md,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(
                      height: AppSpacing.xs,
                    ),

                    Text(
                      description,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                width: AppSpacing.sm,
              ),

              const Icon(
                Icons.chevron_right,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}