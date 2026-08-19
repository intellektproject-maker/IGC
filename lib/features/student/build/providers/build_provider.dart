import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/build_event_model.dart';
import '../models/build_project_model.dart';
import '../models/milestone_model.dart';
import '../models/sprint_model.dart';
import '../repositories/build_repository.dart';

// =========================================================
// REPOSITORY
// =========================================================

final buildRepositoryProvider =
Provider<BuildRepository>(
      (ref) => const BuildRepository(),
);

// =========================================================
// FEATURED SPRINT
// =========================================================

final featuredSprintProvider =
FutureProvider<SprintModel?>(
      (ref) async {
    return ref
        .read(buildRepositoryProvider)
        .getFeaturedSprint();
  },
);

// =========================================================
// SPRINTS
// =========================================================

final sprintsProvider =
FutureProvider<List<SprintModel>>(
      (ref) async {
    return ref
        .read(buildRepositoryProvider)
        .getSprints();
  },
);

// =========================================================
// PROJECTS
// =========================================================

final buildProjectsProvider =
FutureProvider<List<BuildProjectModel>>(
      (ref) async {
    return ref
        .read(buildRepositoryProvider)
        .getProjects();
  },
);

// =========================================================
// PROJECT BY IDEA
// =========================================================

final projectByIdeaProvider =
FutureProvider.family<BuildProjectModel?, String>(
      (ref, ideaId) async {
    return ref
        .read(buildRepositoryProvider)
        .getProjectByIdeaId(ideaId);
  },
);

// =========================================================
// CREATE PROJECT
// =========================================================

final createBuildProjectProvider =
Provider<BuildProjectCreator>(
      (ref) {
    return BuildProjectCreator(ref);
  },
);

class BuildProjectCreator {
  final Ref ref;

  BuildProjectCreator(this.ref);

  Future<BuildProjectModel> createFromIdea({
    required String ideaId,
    required String challengeId,
    required String challengeTitle,
    required String title,
    required String description,
    required String technology,
  }) async {
    final repository =
    ref.read(buildRepositoryProvider);

    final project =
    await repository.createProjectFromIdea(
      ideaId: ideaId,
      challengeId: challengeId,
      challengeTitle: challengeTitle,
      title: title,
      description: description,
      technology: technology,
    );

    ref.invalidate(
      buildProjectsProvider,
    );

    ref.invalidate(
      projectByIdeaProvider(ideaId),
    );

    return project;
  }
}

// =========================================================
// MILESTONES
// =========================================================

final milestonesProvider =
FutureProvider<List<MilestoneModel>>(
      (ref) async {
    return ref
        .read(buildRepositoryProvider)
        .getMilestones();
  },
);

// =========================================================
// EVENTS
// =========================================================

final buildEventsProvider =
FutureProvider<List<BuildEventModel>>(
      (ref) async {
    return ref
        .read(buildRepositoryProvider)
        .getEvents();
  },
);

// =========================================================
// STATISTICS
// =========================================================

final buildStatisticsProvider =
FutureProvider<Map<String, dynamic>>(
      (ref) async {
    return ref
        .read(buildRepositoryProvider)
        .getStatistics();
  },
);