import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_spacing.dart';
import '../providers/learn_provider.dart';
import 'stat_card.dart';

class OverviewGrid extends ConsumerWidget {
  const OverviewGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statistics = ref.watch(
      learnStatisticsProvider,
    );

    return statistics.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),

      error: (error, stack) => const Center(
        child: Text(
          "Unable to load statistics",
        ),
      ),

      data: (data) {
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: AppSpacing.md,
          mainAxisSpacing: AppSpacing.md,
          childAspectRatio: 1.18,

          children: [

            StatCard(
              title: "Completed",
              value: data["completed"].toString(),
              icon: Icons.check_circle,
              iconColor: Colors.green,
            ),

            StatCard(
              title: "Pending",
              value: data["pending"].toString(),
              icon: Icons.schedule,
              iconColor: Colors.orange,
            ),

            StatCard(
              title: "XP Earned",
              value: data["xp"].toString(),
              icon: Icons.stars,
              iconColor: Colors.amber,
            ),

            StatCard(
              title: "Certificates",
              value: data["certificates"].toString(),
              icon: Icons.workspace_premium,
              iconColor: Colors.blue,
            ),
          ],
        );
      },
    );
  }
}