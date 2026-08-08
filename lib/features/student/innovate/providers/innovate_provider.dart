import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/challenge_model.dart';
import '../models/event_model.dart';
import '../models/idea_model.dart';
import '../repositories/innovate_repository.dart';

/// =======================================================
/// Repository
/// =======================================================

final innovateRepositoryProvider =
Provider<InnovateRepository>(
      (ref) => const InnovateRepository(),
);

/// =======================================================
/// Featured Challenge
/// =======================================================

final featuredChallengeProvider =
FutureProvider<ChallengeModel?>((ref) async {
  return ref
      .read(innovateRepositoryProvider)
      .getFeaturedChallenge();
});

/// =======================================================
/// Challenges
/// =======================================================

final challengesProvider =
FutureProvider<List<ChallengeModel>>((ref) async {
  return ref
      .read(innovateRepositoryProvider)
      .getChallenges();
});

/// =======================================================
/// Ideas
/// =======================================================

final ideasProvider =
FutureProvider<List<IdeaModel>>((ref) async {
  return ref
      .read(innovateRepositoryProvider)
      .getIdeas();
});

/// =======================================================
/// Events
/// =======================================================

final eventsProvider =
FutureProvider<List<EventModel>>((ref) async {
  return ref
      .read(innovateRepositoryProvider)
      .getEvents();
});

/// =======================================================
/// Dashboard Statistics
/// =======================================================

final innovateStatisticsProvider =
FutureProvider<Map<String, dynamic>>((ref) async {
  return ref
      .read(innovateRepositoryProvider)
      .getStatistics();
});