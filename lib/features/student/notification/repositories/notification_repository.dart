import '../mock/notification_mock.dart';
import '../models/notification_model.dart';

class NotificationRepository {
  Future<List<NotificationModel>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return NotificationMock.notifications;
  }

  Future<int> getUnreadCount() async {
    await Future.delayed(const Duration(milliseconds: 200));

    return NotificationMock.notifications
        .where((notification) => !notification.isRead)
        .length;
  }

  Future<void> markAsRead(String id) async {
    await Future.delayed(const Duration(milliseconds: 150));

    final index = NotificationMock.notifications.indexWhere(
          (e) => e.id == id,
    );

    if (index == -1) return;

    final notification = NotificationMock.notifications[index];

    NotificationMock.notifications[index] = notification.copyWith(
      isRead: true,
    );
  }
}