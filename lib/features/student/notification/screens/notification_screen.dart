import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/notification_provider.dart';
import '../widgets/notification_tile.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF000351),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: notifications.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (error, _) => Center(
          child: Text(error.toString()),
        ),

        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text(
                "No notifications available",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) =>
            const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final notification = items[index];

              return NotificationTile(
                notification: notification,
                onTap: () async {
                  await ref
                      .read(notificationProvider.notifier)
                      .markAsRead(notification.id);

                  // Future:
                  // Navigate to notification details here
                  // context.push(...);
                },
              );
            },
          );
        },
      ),
    );
  }
}