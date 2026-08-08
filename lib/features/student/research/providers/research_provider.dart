import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/literature_model.dart';
import '../models/paper_model.dart';
import '../models/research_event_model.dart';
import '../models/research_project_model.dart';
import '../repositories/research_repository.dart';

/// =======================================================
/// Repository
/// =======================================================

final researchRepositoryProvider =
Provider<ResearchRepository>(
      (ref) => const ResearchRepository(),
);

/// =======================================================
/// Featured Research Project
/// =======================================================

final featuredResearchProvider =
FutureProvider<ResearchProjectModel?>((ref) async {
  return ref
      .read(researchRepositoryProvider)
      .getFeaturedProject();
});

/// =======================================================
/// Research Projects
/// =======================================================

final researchProjectsProvider =
FutureProvider<List<ResearchProjectModel>>((ref) async {
  return ref
      .read(researchRepositoryProvider)
      .getProjects();
});

/// =======================================================
/// Research Papers
/// =======================================================

final researchPapersProvider =
FutureProvider<List<PaperModel>>((ref) async {
  return ref
      .read(researchRepositoryProvider)
      .getPapers();
});

/// =======================================================
/// Literature Review
/// =======================================================

final literatureProvider =
FutureProvider<List<LiteratureModel>>((ref) async {
  return ref
      .read(researchRepositoryProvider)
      .getLiterature();
});

/// =======================================================
/// Research Events
/// =======================================================

final researchEventsProvider =
FutureProvider<List<ResearchEventModel>>((ref) async {
  return ref
      .read(researchRepositoryProvider)
      .getEvents();
});

/// =======================================================
/// Dashboard Statistics
/// =======================================================

final researchStatisticsProvider =
FutureProvider<Map<String, dynamic>>((ref) async {
  return ref
      .read(researchRepositoryProvider)
      .getStatistics();
});