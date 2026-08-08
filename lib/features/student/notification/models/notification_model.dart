class NotificationModel {
  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final bool isRead;
  final NotificationType type;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.isRead,
    required this.type,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dateTime,
    bool? isRead,
    NotificationType? type,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
    );
  }
}

enum NotificationType {
  innovation,
  learning,
  meeting,
  event,
  certificate,
  project,
  achievement,
  system,
}