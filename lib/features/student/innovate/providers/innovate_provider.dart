import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/challenge_model.dart';
import '../models/event_model.dart';
import '../models/idea_model.dart';
import '../repositories/innovate_repository.dart';

// =======================================================
// REPOSITORY
// =======================================================

final innovateRepositoryProvider =
Provider<InnovateRepository>(
      (ref) => const InnovateRepository(),
);

// =======================================================
// REGISTERED STUDENT NAME
// =======================================================

final registeredStudentNameProvider =
FutureProvider<String>((ref) async {
  return ref
      .read(innovateRepositoryProvider)
      .getRegisteredStudentName();
});

// =======================================================
// FEATURED CHALLENGE
// =======================================================

final featuredChallengeProvider =
FutureProvider<ChallengeModel?>(
      (ref) async {
    return ref
        .read(innovateRepositoryProvider)
        .getFeaturedChallenge();
  },
);

// =======================================================
// CHALLENGES
// =======================================================

final challengesProvider =
FutureProvider<List<ChallengeModel>>(
      (ref) async {
    return ref
        .read(innovateRepositoryProvider)
        .getChallenges();
  },
);

// =======================================================
// IDEAS
// =======================================================

final ideasProvider =
AsyncNotifierProvider<
    IdeasNotifier,
    List<IdeaModel>>(
  IdeasNotifier.new,
);

class IdeasNotifier
    extends AsyncNotifier<List<IdeaModel>> {

  @override
  Future<List<IdeaModel>> build() async {
    return ref
        .read(innovateRepositoryProvider)
        .getIdeas();
  }

  // =====================================================
  // SUBMIT IDEA
  // =====================================================

  Future<IdeaModel> submitIdea({
    required String title,
    required String description,
    required String domain,
  }) async {
    final repository =
    ref.read(
      innovateRepositoryProvider,
    );

    final newIdea =
    await repository.submitIdea(
      title: title,
      description: description,
      domain: domain,
    );

    state = AsyncData(
      await repository.getIdeas(),
    );

    ref.invalidate(
      innovateStatisticsProvider,
    );

    return newIdea;
  }
}

// =======================================================
// EVENTS
// =======================================================

final eventsProvider =
FutureProvider<List<EventModel>>(
      (ref) async {
    return ref
        .read(innovateRepositoryProvider)
        .getEvents();
  },
);

// =======================================================
// STATISTICS
// =======================================================

final innovateStatisticsProvider =
FutureProvider<Map<String, dynamic>>(
      (ref) async {
    return ref
        .read(innovateRepositoryProvider)
        .getStatistics();
  },
);