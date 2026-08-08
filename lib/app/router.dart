import 'package:go_router/go_router.dart';

import '../core/constants/route_names.dart';
import '../features/authentication/screens/login_screen.dart';
import '../features/authentication/screens/splash_screen.dart';
import '../features/authentication/screens/welcome_screen.dart';
import '../features/student/dashboard/screens/student_dashboard_screen.dart';
import '../features/student/notification/screens/notification_screen.dart';
import '../features/student/build/screens/build_screen.dart';
import '../features/student/innovate/screens/innovate_screen.dart';
import '../features/student/learn/screens/learn_screen.dart';
import '../features/student/enterprise/screens/enterprise_screen.dart';
import '../features/student/research/screens/research_screen.dart';
import '../features/student/career/screens/career_screen.dart';
import '../features/student/projects/screens/projects_screen.dart';
import '../features/student/chat/screens/chat_screen.dart';

class AppRouter {
  AppRouter._();

  static const String learn = '/student-dashboard/learn';
  static const String innovate = '/student-dashboard/innovate';
  static const String develop = '/student-dashboard/build';
  static const String research = '/student-dashboard/research';
  static const String enterprise = '/student-dashboard/enterprise';
  static const String career = '/student-dashboard/career';

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: RouteNames.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),

      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: RouteNames.student,
        builder: (context, state) => const StudentDashboardScreen(),
      ),

      GoRoute(
        path: RouteNames.notification,
        builder: (context, state) => const NotificationScreen(),
      ),

      GoRoute(
        path: RouteNames.chat,
        builder: (context, state) => const ChatScreen(),
      ),

      GoRoute(
        path: RouteNames.learn,
        builder: (context, state) => const LearnScreen(),
      ),

      GoRoute(
        path: RouteNames.projects,
        builder: (context, state) => const ProjectsScreen(),
      ),

      GoRoute(
        path: RouteNames.innovate,
        builder: (context, state) => const InnovateScreen(),
      ),

      GoRoute(
        path: RouteNames.build,
        builder: (context, state) => const BuildScreen(),
      ),

      GoRoute(
        path: RouteNames.research,
        builder: (context, state) => const ResearchScreen(),
      ),

      GoRoute(
        path: RouteNames.enterprise,
        builder: (context, state) => const EnterpriseScreen(),
      ),

      GoRoute(
        path: RouteNames.career,
        builder: (context, state) => const CareerScreen(),
      ),
    ],
  );
}