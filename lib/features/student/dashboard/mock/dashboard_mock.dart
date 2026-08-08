import '../models/student_dashboard_model.dart';

class DashboardMock {
  DashboardMock._();

  static StudentDashboardModel get student => const StudentDashboardModel(
    id: "STD-2026-000001",
    name: "Arjun Prasad",
    level: "Level IV Innovator",
    xp: 845,
    rank: 42,
    score: 91,
    projects: 8,
    skillPoints: 1250,
  );
}