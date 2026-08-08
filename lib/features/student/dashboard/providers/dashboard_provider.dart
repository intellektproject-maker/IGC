import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/student_dashboard_model.dart';
import '../repositories/dashboard_repository.dart';

/// Repository Provider
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return MockDashboardRepository();
});

/// Dashboard Provider
final dashboardProvider = FutureProvider<StudentDashboardModel>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);

  return repository.getDashboard();
});