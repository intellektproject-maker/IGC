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
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Text(
            'Error: $error',
          ),
        ),
      ),
      data: (student) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: const StudentDrawer(),
          backgroundColor: const Color(0xFFF5F7FB),

          body: Stack(
            children: [
              /// ===========================
              /// Premium Gradient Background
              /// ===========================
              Positioned.fill(
                child: Column(
                  children: [
                    Container(
                      height: 804,
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

                    Expanded(
                      child: Container(
                        color: const Color(0xFFF5F7FB),
                      ),
                    ),
                  ],
                ),
              ),

              /// ===========================
              /// Dashboard Content
              /// ===========================
              Positioned.fill(
                child: DashboardBody(
                  student: student,
                ),
              ),

              /// ===========================
              /// Header
              /// ===========================
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

          bottomNavigationBar: StudentBottomNavigation(
            currentIndex: 0,
            onTap: (index) {
              switch (index) {
                case 0:
                  break;

                case 1:
                  context.push(RouteNames.learn);
                  break;

                case 2:
                  context.push(RouteNames.innovate);
                  break;

                case 3:
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Events module coming soon"),
                    ),
                  );
                  break;

                case 4:
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Meetings module coming soon"),
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