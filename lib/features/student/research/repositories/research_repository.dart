import '../mock/research_mock_data.dart';
import '../models/literature_model.dart';
import '../models/paper_model.dart';
import '../models/research_event_model.dart';
import '../models/research_project_model.dart';

class ResearchRepository {
  const ResearchRepository();

  //=========================================================
  // Featured Research Project
  //=========================================================

  Future<ResearchProjectModel?> getFeaturedProject() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    try {
      return ResearchMockData.projects.firstWhere(
            (project) => project.featured,
      );
    } catch (_) {
      return null;
    }
  }

  //=========================================================
  // Research Projects
  //=========================================================

  Future<List<ResearchProjectModel>> getProjects() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return ResearchMockData.projects;
  }

  //=========================================================
  // Research Papers
  //=========================================================

  Future<List<PaperModel>> getPapers() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return ResearchMockData.papers;
  }

  //=========================================================
  // Literature Reviews
  //=========================================================

  Future<List<LiteratureModel>> getLiterature() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return ResearchMockData.literature;
  }

  //=========================================================
  // Research Events
  //=========================================================

  Future<List<ResearchEventModel>> getEvents() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return ResearchMockData.events;
  }

  //=========================================================
  // Dashboard Statistics
  //=========================================================

  Future<Map<String, dynamic>> getStatistics() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final projects = ResearchMockData.projects;
    final papers = ResearchMockData.papers;

    final publishedPapers = papers
        .where((paper) => paper.status == "published")
        .length;

    final totalCitations = papers.fold<int>(
      0,
          (sum, paper) => sum + paper.citations,
    );

    final completedProjects = projects
        .where(
          (project) =>
      project.status == "completed" ||
          project.status == "published",
    )
        .length;

    return {
      "projects": projects.length,
      "papers": papers.length,
      "published": publishedPapers,
      "citations": totalCitations,
      "completed": completedProjects,
    };
  }
}