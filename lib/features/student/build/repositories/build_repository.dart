import '../mock/build_mock_data.dart';
import '../models/build_event_model.dart';
import '../models/build_project_model.dart';
import '../models/milestone_model.dart';
import '../models/sprint_model.dart';

class BuildRepository {
  const BuildRepository();

  //=========================================================
  // Featured Sprint
  //=========================================================

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

  //=========================================================
  // Product Sprints
  //=========================================================

  Future<List<SprintModel>> getSprints() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return BuildMockData.sprints;
  }

  //=========================================================
  // Build Projects
  //=========================================================

  Future<List<BuildProjectModel>> getProjects() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return BuildMockData.projects;
  }

  //=========================================================
  // Milestones
  //=========================================================

  Future<List<MilestoneModel>> getMilestones() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return BuildMockData.milestones;
  }

  //=========================================================
  // Build Events
  //=========================================================

  Future<List<BuildEventModel>> getEvents() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return BuildMockData.events;
  }

  //=========================================================
  // Dashboard Statistics
  //=========================================================

  Future<Map<String, dynamic>> getStatistics() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final sprints = BuildMockData.sprints;
    final milestones = BuildMockData.milestones;

    final activeSprints = sprints
        .where((sprint) => sprint.active)
        .length;

    final completedMilestones = milestones
        .where((milestone) => milestone.completed)
        .length;

    final totalXp = milestones.fold<int>(
      0,
          (sum, milestone) =>
      milestone.completed
          ? sum + milestone.xp
          : sum,
    );

    final teamMembers = sprints.fold<int>(
      0,
          (sum, sprint) => sum + sprint.teamMembers,
    );

    return {
      "activeSprints": activeSprints,
      "milestones": completedMilestones,
      "xp": totalXp,
      "teams": teamMembers,
    };
  }
}