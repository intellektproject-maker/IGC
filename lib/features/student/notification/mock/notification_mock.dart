import '../models/notification_model.dart';

class NotificationMock {
  static List<NotificationModel> notifications = [
    NotificationModel(
      id: 'NOT-001',
      title: 'Innovation Project Approved',
      description:
      'Congratulations! Your Smart Agriculture project has been approved.',
      dateTime: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
      type: NotificationType.project,
    ),

    NotificationModel(
      id: 'NOT-002',
      title: 'New AI Learning Module',
      description:
      'A new Artificial Intelligence learning module has been added.',
      dateTime: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
      type: NotificationType.learning,
    ),

    NotificationModel(
      id: 'NOT-003',
      title: 'Upcoming Chapter Meeting',
      description:
      'Your chapter meeting is scheduled for tomorrow at 10:00 AM.',
      dateTime: DateTime.now().subtract(const Duration(hours: 6)),
      isRead: true,
      type: NotificationType.meeting,
    ),

    NotificationModel(
      id: 'NOT-004',
      title: 'Innovation Challenge',
      description:
      'Participate in the National Innovation Challenge 2026.',
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
      isRead: false,
      type: NotificationType.innovation,
    ),

    NotificationModel(
      id: 'NOT-005',
      title: 'Certificate Issued',
      description:
      'Your Flutter Development certificate is now available.',
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
      type: NotificationType.certificate,
    ),

    NotificationModel(
      id: 'NOT-006',
      title: 'Achievement Unlocked',
      description:
      'You earned 100 XP for completing your weekly mission.',
      dateTime: DateTime.now().subtract(const Duration(days: 3)),
      isRead: false,
      type: NotificationType.achievement,
    ),
  ];
}