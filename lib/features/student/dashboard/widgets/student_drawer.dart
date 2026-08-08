import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_names.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.82,
      child: Container(
        color: const Color(0xFF000351),
        child: SafeArea(
          child: Column(
            children: [
              // ==================================================
              // Header
              // ==================================================

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  20,
                  20,
                  12,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'IGC Dashboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(
                color: Colors.white24,
                height: 1,
              ),

              // ==================================================
              // Navigation
              // ==================================================

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  children: [
                    // --------------------------
                    // Learn
                    // --------------------------

                    _drawerItem(
                      context,
                      Icons.workspace_premium_outlined,
                      'Learn',
                          () => context.push(
                        RouteNames.learn,
                      ),
                    ),

                    // --------------------------
                    // Projects
                    // --------------------------

                    _drawerItem(
                      context,
                      Icons.folder_copy_outlined,
                      'Projects',
                          () => context.push(
                        RouteNames.projects,
                      ),
                    ),

                    // --------------------------
                    // Research
                    // --------------------------

                    _drawerItem(
                      context,
                      Icons.school_outlined,
                      'Research',
                          () => context.push(
                        RouteNames.research,
                      ),
                    ),

                    // --------------------------
                    // Career
                    // --------------------------

                    _drawerItem(
                      context,
                      Icons.rocket_launch_outlined,
                      'Career',
                          () => context.push(
                        RouteNames.career,
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // Sign Out
              // ==================================================

              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),

                    onPressed: () {
                      // Close drawer first
                      Navigator.pop(context);

                      // Clear the current navigation stack
                      // and return to Login.
                      context.go(
                        RouteNames.login,
                      );
                    },

                    icon: const Icon(
                      Icons.logout,
                    ),

                    label: const Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // Drawer Item
  // ============================================================

  Widget _drawerItem(
      BuildContext context,
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),

      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),

      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.white70,
      ),

      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}