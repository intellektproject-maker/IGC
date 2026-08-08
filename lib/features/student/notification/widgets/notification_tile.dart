import 'package:flutter/material.dart';

import '../models/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: notification.isRead
                  ? Colors.grey.shade300
                  : const Color(0xFF000351),
              width: notification.isRead ? 1 : 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTypeIcon(notification.type),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          if (!notification.isRead)
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Text(
                        notification.description,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        _formatTime(notification.dateTime),
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeIcon(NotificationType type) {
    IconData icon;

    switch (type) {
      case NotificationType.innovation:
        icon = Icons.lightbulb_outline;
        break;

      case NotificationType.learning:
        icon = Icons.menu_book_outlined;
        break;

      case NotificationType.meeting:
        icon = Icons.groups_outlined;
        break;

      case NotificationType.event:
        icon = Icons.event_outlined;
        break;

      case NotificationType.certificate:
        icon = Icons.workspace_premium_outlined;
        break;

      case NotificationType.project:
        icon = Icons.rocket_launch_outlined;
        break;

      case NotificationType.achievement:
        icon = Icons.emoji_events_outlined;
        break;

      case NotificationType.system:
        icon = Icons.notifications_active_outlined;
        break;
    }

    return CircleAvatar(
      radius: 22,
      backgroundColor: const Color(0xFF000351).withOpacity(0.1),
      child: Icon(
        icon,
        color: const Color(0xFF000351),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);

    if (difference.inMinutes < 1) {
      return "Just now";
    }

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} min ago";
    }

    if (difference.inHours < 24) {
      return "${difference.inHours} hr ago";
    }

    if (difference.inDays == 1) {
      return "Yesterday";
    }

    return "${difference.inDays} days ago";
  }
}