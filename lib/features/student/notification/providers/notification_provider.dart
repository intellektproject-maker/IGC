import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/notification_model.dart';
import '../repositories/notification_repository.dart';

final notificationRepositoryProvider =
Provider<NotificationRepository>((ref) {
  return NotificationRepository();
});

class NotificationNotifier
    extends StateNotifier<AsyncValue<List<NotificationModel>>> {
  NotificationNotifier(this._repository)
      : super(const AsyncLoading()) {
    loadNotifications();
  }

  final NotificationRepository _repository;

  Future<void> loadNotifications() async {
    final notifications = await _repository.getNotifications();
    state = AsyncData(notifications);
  }

  Future<void> markAsRead(String id) async {
    await _repository.markAsRead(id);

    final notifications = await _repository.getNotifications();

    state = AsyncData(notifications);
  }
}

final notificationProvider = StateNotifierProvider<
    NotificationNotifier,
    AsyncValue<List<NotificationModel>>>((ref) {
  return NotificationNotifier(
    ref.watch(notificationRepositoryProvider),
  );
});

final unreadNotificationCountProvider = Provider<int>((ref) {
  final notifications = ref.watch(notificationProvider);

  return notifications.when(
    data: (items) => items.where((e) => !e.isRead).length,
    loading: () => 0,
    error: (_, __) => 0,
  );
});