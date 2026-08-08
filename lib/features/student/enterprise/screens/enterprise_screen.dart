import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../providers/enterprise_provider.dart';

import '../widgets/canvas_card.dart';
import '../widgets/enterprise_event_card.dart';
import '../widgets/enterprise_stat_card.dart';
import '../widgets/featured_venture_card.dart';
import '../widgets/pitch_card.dart';
import '../widgets/venture_card.dart';

class EnterpriseScreen extends ConsumerWidget {
  const EnterpriseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredVenture = ref.watch(featuredVentureProvider);

    final statistics = ref.watch(enterpriseStatisticsProvider);

    final ventures = ref.watch(venturesProvider);

    final canvas = ref.watch(businessCanvasProvider);

    final pitches = ref.watch(pitchesProvider);

    final events = ref.watch(enterpriseEventsProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Enterprise",
          style: AppTypography.titleLarge.copyWith(color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              featuredVenture.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (venture) {
                  if (venture == null) {
                    return const SizedBox();
                  }

                  return FeaturedVentureCard(venture: venture);
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
                      EnterpriseStatCard(
                        title: "Ventures",
                        value: data["ventures"].toString(),
                        icon: Icons.business_center,
                        iconColor: Colors.blue,
                      ),

                      EnterpriseStatCard(
                        title: "Business Canvas",
                        value: data["canvas"].toString(),
                        icon: Icons.dashboard_customize,
                        iconColor: Colors.orange,
                      ),

                      EnterpriseStatCard(
                        title: "Pitch Score",
                        value: data["pitchScore"].toString(),
                        icon: Icons.campaign,
                        iconColor: Colors.purple,
                      ),

                      EnterpriseStatCard(
                        title: "Startup Score",
                        value: data["startupScore"].toString(),
                        icon: Icons.trending_up,
                        iconColor: Colors.green,
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "My Ventures",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              ventures.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (ventureList) {
                  return Column(
                    children: ventureList
                        .map((venture) => VentureCard(venture: venture))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Business Blueprint",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),
              canvas.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (canvasList) {
                  return Column(
                    children: canvasList
                        .map((item) => CanvasCard(canvas: item))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Investor Pitches",
                style: AppTypography.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              pitches.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (_, __) => const SizedBox(),

                data: (pitchList) {
                  return Column(
                    children: pitchList
                        .map((pitch) => PitchCard(pitch: pitch))
                        .toList(),
                  );
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              Text(
                "Enterprise Events",
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
                        .map((event) => EnterpriseEventCard(event: event))
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
