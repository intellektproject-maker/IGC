import '../mock/dashboard_mock.dart';
import '../models/student_dashboard_model.dart';

abstract class DashboardRepository {
  Future<StudentDashboardModel> getDashboard();
}

class MockDashboardRepository implements DashboardRepository {
  @override
  Future<StudentDashboardModel> getDashboard() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    return DashboardMock.student;
  }
}