import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_names.dart';

import '../providers/dashboard_provider.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/dashboard_body.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/student_drawer.dart';

class StudentDashboardScreen extends ConsumerStatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  ConsumerState<StudentDashboardScreen> createState() =>
      _StudentDashboardScreenState();
}

class _StudentDashboardScreenState
    extends ConsumerState<StudentDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final dashboard = ref.watch(dashboardProvider);

    return dashboard.when(
      // =========================================================
      // LOADING
      // =========================================================
      loading: () {
        return const Scaffold(
          backgroundColor: Color(0xFF000351),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },

      // =========================================================
      // ERROR
      // =========================================================
      error: (error, stackTrace) {
        return Scaffold(
          backgroundColor: const Color(0xFF000351),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Error: $error',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      },

      // =========================================================
      // DATA
      // =========================================================
      data: (student) {
        return Scaffold(
          key: _scaffoldKey,

          // -----------------------------------------------------
          // DRAWER
          // -----------------------------------------------------
          drawer: const StudentDrawer(),

          // -----------------------------------------------------
          // BACKGROUND
          // -----------------------------------------------------
          backgroundColor: const Color(0xFF000351),

          // -----------------------------------------------------
          // BODY
          // -----------------------------------------------------
          body: Stack(
            children: [
              // =================================================
              // FULL SCREEN GRADIENT BACKGROUND
              // =================================================
              Positioned.fill(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF000351),
                        Color(0xFF1A237E),
                      ],
                    ),
                  ),
                ),
              ),

              // =================================================
              // DASHBOARD CONTENT
              // =================================================
              Positioned.fill(
                child: SafeArea(
                  bottom: false,
                  child: DashboardBody(
                    student: student,
                  ),
                ),
              ),

              // =================================================
              // HEADER
              // =================================================
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  bottom: false,
                  child: DashboardHeader(
                    studentPoints: student.score,
                    onMenuTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ),
              ),
            ],
          ),

          // =====================================================
          // BOTTOM NAVIGATION
          // =====================================================
          bottomNavigationBar: StudentBottomNavigation(
            currentIndex: 0,
            onTap: (index) {
              switch (index) {
              // -----------------------------------------------
              // DASHBOARD
              // -----------------------------------------------
                case 0:
                  break;

              // -----------------------------------------------
              // LEARN
              // -----------------------------------------------
                case 1:
                  context.push(
                    RouteNames.learn,
                  );
                  break;

              // -----------------------------------------------
              // INNOVATION
              // -----------------------------------------------
                case 2:
                  context.push(
                    RouteNames.innovate,
                  );
                  break;

              // -----------------------------------------------
              // EVENTS
              // -----------------------------------------------
                case 3:
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Events module coming soon',
                      ),
                    ),
                  );
                  break;

              // -----------------------------------------------
              // MEETINGS
              // -----------------------------------------------
                case 4:
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Meetings module coming soon',
                      ),
                    ),
                  );
                  break;
              }
            },
          ),
        );
      },
    );
  }
}