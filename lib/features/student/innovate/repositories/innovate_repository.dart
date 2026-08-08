import '../mock/innovate_mock_data.dart';
import '../models/challenge_model.dart';
import '../models/event_model.dart';
import '../models/idea_model.dart';

class InnovateRepository {
  const InnovateRepository();

  //=========================================
  // Featured Challenge
  //=========================================

  Future<ChallengeModel?> getFeaturedChallenge() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    try {
      return InnovateMockData.challenges.firstWhere(
            (challenge) => challenge.featured,
      );
    } catch (_) {
      return null;
    }
  }

  //=========================================
  // All Challenges
  //=========================================

  Future<List<ChallengeModel>> getChallenges() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return InnovateMockData.challenges;
  }

  //=========================================
  // My Ideas
  //=========================================

  Future<List<IdeaModel>> getIdeas() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return InnovateMockData.ideas;
  }

  //=========================================
  // Upcoming Events
  //=========================================

  Future<List<EventModel>> getEvents() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return InnovateMockData.events;
  }

  //=========================================
  // Dashboard Statistics
  //=========================================

  Future<Map<String, dynamic>> getStatistics() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final challenges =
        InnovateMockData.challenges;

    final ideas =
        InnovateMockData.ideas;

    final joined = challenges
        .where((c) => c.joined)
        .length;

    final submittedIdeas = ideas.length;

    final xp = challenges
        .where((c) => c.joined)
        .fold<int>(
      0,
          (sum, item) => sum + item.xp,
    );

    final shortlisted = ideas
        .where((i) => i.shortlisted)
        .length;

    return {
      "joined": joined,
      "ideas": submittedIdeas,
      "xp": xp,
      "shortlisted": shortlisted,
    };
  }
}