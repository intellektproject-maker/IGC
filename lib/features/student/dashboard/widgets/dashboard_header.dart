import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../notification/providers/notification_provider.dart';
import '../../../../core/constants/route_names.dart';

class DashboardHeader extends ConsumerWidget {
  final VoidCallback onMenuTap;
  final int studentPoints;

  const DashboardHeader({
    super.key,
    required this.onMenuTap,
    required this.studentPoints,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final unreadCount = ref.watch(unreadNotificationCountProvider);

    final bool chatEnabled = studentPoints >= 50;

    return Material(
      color: Colors.transparent,
      child: Container(
        height: statusBarHeight + 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF000351),
              Color(0xFF1A237E),
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              // Menu
              _iconButton(
                icon: Icons.menu,
                onTap: onMenuTap,
              ),

              const SizedBox(width: 16),

              // Logo
              const FlutterLogo(
                size: 30,
              ),

              const SizedBox(width: 10),

              const Text(
                "IGC",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),

              const Spacer(),

              // ==================================================
              // Notification
              // ==================================================

              SizedBox(
                width: 42,
                height: 42,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Material(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          context.push(
                            RouteNames.notification,
                          );
                        },
                        child: const Center(
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ),

                    if (unreadCount > 0)
                      Positioned(
                        top: -2,
                        right: -2,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            unreadCount > 99
                                ? "99+"
                                : unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // ==================================================
              // Chat
              // ==================================================

              _chatButton(
                context,
                enabled: chatEnabled,
              ),

              const SizedBox(width: 16),

              // ==================================================
              // Profile
              // ==================================================

              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Color(0xFF000351),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // Chat Button
  // ==========================================================

  Widget _chatButton(
      BuildContext context, {
        required bool enabled,
      }) {
    return SizedBox(
      width: 42,
      height: 42,
      child: Material(
        color: enabled
            ? Colors.white12
            : Colors.white10,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: enabled
              ? () {
            context.push(RouteNames.chat);
          }
              : null,
          child: Center(
            child: Icon(
              enabled
                  ? Icons.chat_bubble_outline
                  : Icons.chat_bubble_outline,
              color: enabled
                  ? Colors.white
                  : Colors.white38,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // Common Icon Button
  // ==========================================================

  Widget _iconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 42,
      height: 42,
      child: Material(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}