import '../mock/innovate_mock_data.dart';
import '../models/challenge_model.dart';
import '../models/event_model.dart';
import '../models/idea_model.dart';

class InnovateRepository {
  const InnovateRepository();

  // ==========================================================
  // REGISTERED STUDENT
  // ==========================================================

  Future<String> getRegisteredStudentName() async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );

    return InnovateMockData.registeredStudentName;
  }

  // ==========================================================
  // FEATURED CHALLENGE
  // ==========================================================

  Future<ChallengeModel?> getFeaturedChallenge() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    try {
      final challenge =
      InnovateMockData.challenges.firstWhere(
            (challenge) => challenge.featured,
      );

      return _withJoinedState(
        challenge,
      );
    } catch (_) {
      return null;
    }
  }

  // ==========================================================
  // ALL CHALLENGES
  // ==========================================================

  Future<List<ChallengeModel>> getChallenges() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return InnovateMockData.challenges
        .map(
          (challenge) =>
          _withJoinedState(challenge),
    )
        .toList();
  }

  // ==========================================================
  // APPLY JOINED STATE
  // ==========================================================

  ChallengeModel _withJoinedState(
      ChallengeModel challenge,
      ) {
    return challenge.copyWith(
      joined: InnovateMockData
          .joinedChallengeIds
          .contains(challenge.id),
    );
  }

  // ==========================================================
  // MY IDEAS
  // ==========================================================

  Future<List<IdeaModel>> getIdeas() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return List<IdeaModel>.from(
      InnovateMockData.ideas,
    );
  }

  // ==========================================================
  // SUBMIT IDEA
  // ==========================================================

  Future<IdeaModel> submitIdea({
    required String title,
    required String description,
    required String domain,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    final cleanTitle =
    title.trim();

    final cleanDescription =
    description.trim();

    final cleanDomain =
    domain.trim();

    if (cleanTitle.isEmpty) {
      throw Exception(
        'Idea title is required.',
      );
    }

    if (cleanDescription.isEmpty) {
      throw Exception(
        'Idea description is required.',
      );
    }

    if (cleanDomain.isEmpty) {
      throw Exception(
        'Idea domain is required.',
      );
    }

    final idea = IdeaModel(
      id:
      'IDEA-${DateTime.now().millisecondsSinceEpoch}',
      title: cleanTitle,
      description: cleanDescription,
      domain: cleanDomain,
      status: 'under_review',
      submittedDate: DateTime.now(),
      points: 0,
      shortlisted: false,
    );

    InnovateMockData.ideas.insert(
      0,
      idea,
    );

    return idea;
  }

  // ==========================================================
  // PARTICIPATE IN CHALLENGE
  // ==========================================================

  Future<bool> participateInChallenge({
    required String challengeId,
    required String fullName,
    required String studentId,
    required String institution,
    required String course,
    required String year,
    required String email,
    required String phone,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    // ========================================================
    // CLEAN VALUES
    // ========================================================

    final cleanName =
    fullName.trim();

    final cleanStudentId =
    studentId.trim();

    final cleanInstitution =
    institution.trim();

    final cleanCourse =
    course.trim();

    final cleanYear =
    year.trim();

    final cleanEmail =
    email.trim();

    final cleanPhone =
    phone.trim();

    // ========================================================
    // NAME
    // ========================================================

    if (cleanName.isEmpty) {
      return false;
    }

    if (!RegExp(
      r'^[a-zA-Z ]+$',
    ).hasMatch(cleanName)) {
      return false;
    }

    // ========================================================
    // IGC REGISTERED NAME
    // ========================================================

    final registeredName =
    InnovateMockData
        .registeredStudentName
        .trim()
        .toLowerCase();

    if (cleanName.toLowerCase() !=
        registeredName) {
      return false;
    }

    // ========================================================
    // STUDENT ID
    // ========================================================

    if (cleanStudentId.isEmpty) {
      return false;
    }

    if (!RegExp(
      r'^[a-zA-Z0-9]+$',
    ).hasMatch(cleanStudentId)) {
      return false;
    }

    // ========================================================
    // INSTITUTION
    // ========================================================

    if (cleanInstitution.isEmpty) {
      return false;
    }

    if (!RegExp(
      r'^[a-zA-Z ]+$',
    ).hasMatch(cleanInstitution)) {
      return false;
    }

    // ========================================================
    // COURSE
    // ========================================================

    if (cleanCourse.isEmpty) {
      return false;
    }

    if (!RegExp(
      r'^[a-zA-Z ]+$',
    ).hasMatch(cleanCourse)) {
      return false;
    }

    // ========================================================
    // YEAR
    // ========================================================

    const validYears = [
      '1st Year',
      '2nd Year',
      '3rd Year',
      '4th Year',
      '5th Year',
    ];

    if (!validYears.contains(
      cleanYear,
    )) {
      return false;
    }

    // ========================================================
    // EMAIL
    // ========================================================

    if (cleanEmail.isEmpty) {
      return false;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@'
      r'[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(
      cleanEmail,
    )) {
      return false;
    }

    // ========================================================
    // PHONE
    // ========================================================

    if (!RegExp(
      r'^[6-9][0-9]{9}$',
    ).hasMatch(cleanPhone)) {
      return false;
    }

    // ========================================================
    // FIND CHALLENGE
    // ========================================================

    final challenge =
        InnovateMockData.challenges
            .where(
              (item) =>
          item.id ==
              challengeId,
        )
            .firstOrNull;

    if (challenge == null) {
      return false;
    }

    // ========================================================
    // ALREADY JOINED THIS CHALLENGE
    // ========================================================

    if (InnovateMockData
        .joinedChallengeIds
        .contains(challengeId)) {
      return false;
    }

    // ========================================================
    // JOIN THIS CHALLENGE
    // ========================================================

    InnovateMockData
        .joinedChallengeIds
        .add(challengeId);

    // ========================================================
    // UPDATE PARTICIPANT COUNT
    // ========================================================

    final index =
    InnovateMockData.challenges
        .indexWhere(
          (item) =>
      item.id ==
          challengeId,
    );

    if (index != -1) {
      InnovateMockData.challenges[index] =
          challenge.copyWith(
            participants:
            challenge.participants + 1,
          );
    }

    return true;
  }

  // ==========================================================
  // EVENTS
  // ==========================================================

  Future<List<EventModel>> getEvents() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return List<EventModel>.from(
      InnovateMockData.events,
    );
  }

  // ==========================================================
  // STATISTICS
  // ==========================================================

  Future<Map<String, dynamic>>
  getStatistics() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final ideas =
        InnovateMockData.ideas;

    final joinedCount =
        InnovateMockData
            .joinedChallengeIds
            .length;

    // Calculate XP only from challenges
    // actually joined by this student.
    final xp =
    InnovateMockData.challenges
        .where(
          (challenge) =>
          InnovateMockData
              .joinedChallengeIds
              .contains(
            challenge.id,
          ),
    )
        .fold<int>(
      0,
          (sum, challenge) =>
      sum + challenge.xp,
    );

    final shortlisted =
        ideas.where(
              (idea) =>
          idea.shortlisted,
        ).length;

    return {
      'joined': joinedCount,
      'ideas': ideas.length,
      'xp': xp,
      'shortlisted': shortlisted,
      'points':
      InnovateMockData
          .innovationPoints,
    };
  }
}