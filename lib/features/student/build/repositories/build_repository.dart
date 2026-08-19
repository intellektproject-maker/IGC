import '../mock/build_mock_data.dart';
import '../models/build_event_model.dart';
import '../models/build_project_model.dart';
import '../models/milestone_model.dart';
import '../models/sprint_model.dart';

class BuildRepository {
  const BuildRepository();

  // ==========================================================
  // FEATURED SPRINT
  // ==========================================================

  Future<SprintModel?> getFeaturedSprint() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    try {
      return BuildMockData.sprints.firstWhere(
            (sprint) => sprint.featured,
      );
    } catch (_) {
      return null;
    }
  }

  // ==========================================================
  // SPRINTS
  // ==========================================================

  Future<List<SprintModel>> getSprints() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return List<SprintModel>.from(
      BuildMockData.sprints,
    );
  }

  // ==========================================================
  // PROJECTS
  // ==========================================================

  Future<List<BuildProjectModel>> getProjects() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return List<BuildProjectModel>.from(
      BuildMockData.projects,
    );
  }

  // ==========================================================
  // PROJECT BY IDEA
  // ==========================================================

  Future<BuildProjectModel?> getProjectByIdeaId(
      String ideaId,
      ) async {
    await Future.delayed(
      const Duration(milliseconds: 200),
    );

    try {
      return BuildMockData.projects.firstWhere(
            (project) => project.ideaId == ideaId,
      );
    } catch (_) {
      return null;
    }
  }

  // ==========================================================
  // CREATE PROJECT FROM IDEA
  // ==========================================================

  Future<BuildProjectModel> createProjectFromIdea({
    required String ideaId,
    required String challengeId,
    required String challengeTitle,
    required String title,
    required String description,
    required String technology,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    // --------------------------------------------------------
    // PREVENT DUPLICATE PROJECT
    // --------------------------------------------------------

    final existingIndex =
    BuildMockData.projects.indexWhere(
          (project) => project.ideaId == ideaId,
    );

    if (existingIndex != -1) {
      return BuildMockData.projects[existingIndex];
    }

    // --------------------------------------------------------
    // CREATE PROJECT
    // --------------------------------------------------------

    final project = BuildProjectModel(
      id:
      'PROJ-${DateTime.now().millisecondsSinceEpoch}',

      ideaId: ideaId,

      challengeId: challengeId,

      challengeTitle: challengeTitle,

      title: title.trim(),

      description: description.trim(),

      technology: technology.trim(),

      status: 'Not Started',

      completion: 0,

      githubUrl: '',

      featured: false,

      createdAt: DateTime.now(),
    );

    // --------------------------------------------------------
    // SAVE
    // --------------------------------------------------------

    BuildMockData.projects.insert(
      0,
      project,
    );

    return project;
  }

  // ==========================================================
  // MILESTONES
  // ==========================================================

  Future<List<MilestoneModel>> getMilestones() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return List<MilestoneModel>.from(
      BuildMockData.milestones,
    );
  }

  // ==========================================================
  // EVENTS
  // ==========================================================

  Future<List<BuildEventModel>> getEvents() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return List<BuildEventModel>.from(
      BuildMockData.events,
    );
  }

  // ==========================================================
  // STATISTICS
  // ==========================================================

  Future<Map<String, dynamic>> getStatistics() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final projects = BuildMockData.projects;

    final completedProjects = projects
        .where(
          (project) =>
      project.completion >= 100,
    )
        .length;

    final activeProjects = projects
        .where(
          (project) =>
      project.status.toLowerCase() !=
          'completed',
    )
        .length;

    final totalCompletion = projects.isEmpty
        ? 0
        : projects.fold<int>(
      0,
          (sum, project) =>
      sum + project.completion,
    ) ~/
        projects.length;

    return {
      'projects': projects.length,
      'activeProjects': activeProjects,
      'completedProjects': completedProjects,
      'completion': totalCompletion,
      'sprints': BuildMockData.sprints.length,
      'milestones': BuildMockData.milestones.length,
    };
  }
}