import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/build_event_model.dart';
import '../models/build_project_model.dart';
import '../models/milestone_model.dart';
import '../models/sprint_model.dart';
import '../repositories/build_repository.dart';

/// =======================================================
/// Repository
/// =======================================================

final buildRepositoryProvider =
Provider<BuildRepository>(
      (ref) => const BuildRepository(),
);

/// =======================================================
/// Featured Sprint
/// =======================================================

final featuredSprintProvider =
FutureProvider<SprintModel?>((ref) async {
  return ref
      .read(buildRepositoryProvider)
      .getFeaturedSprint();
});

/// =======================================================
/// Product Sprints
/// =======================================================

final sprintsProvider =
FutureProvider<List<SprintModel>>((ref) async {
  return ref
      .read(buildRepositoryProvider)
      .getSprints();
});

/// =======================================================
/// Build Projects
/// =======================================================

final buildProjectsProvider =
FutureProvider<List<BuildProjectModel>>((ref) async {
  return ref
      .read(buildRepositoryProvider)
      .getProjects();
});

/// =======================================================
/// Milestones
/// =======================================================

final milestonesProvider =
FutureProvider<List<MilestoneModel>>((ref) async {
  return ref
      .read(buildRepositoryProvider)
      .getMilestones();
});

/// =======================================================
/// Build Events
/// =======================================================

final buildEventsProvider =
FutureProvider<List<BuildEventModel>>((ref) async {
  return ref
      .read(buildRepositoryProvider)
      .getEvents();
});

/// =======================================================
/// Dashboard Statistics
/// =======================================================

final buildStatisticsProvider =
FutureProvider<Map<String, dynamic>>((ref) async {
  return ref
      .read(buildRepositoryProvider)
      .getStatistics();
});