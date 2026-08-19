import '../mock/innovate_mock_data.dart';
import '../models/challenge_model.dart';
import '../models/event_model.dart';
import '../models/idea_model.dart';

import '../../build/repositories/build_repository.dart';
import '../../build/models/build_project_model.dart';

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
      return InnovateMockData.challenges.firstWhere(
            (challenge) => challenge.featured,
      );
    } catch (_) {
      return null;
    }
  }

  // ==========================================================
  // CHALLENGES
  // ==========================================================

  Future<List<ChallengeModel>> getChallenges() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return List<ChallengeModel>.from(
      InnovateMockData.challenges,
    );
  }

  // ==========================================================
  // SUBMISSION STATUS
  // ==========================================================

  bool isSubmissionOpen(
      String challengeId,
      ) {
    final index =
    InnovateMockData.challenges.indexWhere(
          (challenge) => challenge.id == challengeId,
    );

    if (index == -1) {
      return false;
    }

    final challenge =
    InnovateMockData.challenges[index];

    return canSubmitToChallenge(
      challengeId,
    );
  }

  // ==========================================================
  // CAN SUBMIT TO CHALLENGE
  // ==========================================================

  bool canSubmitToChallenge(
      String challengeId,
      ) {
    final index =
    InnovateMockData.challenges.indexWhere(
          (challenge) => challenge.id == challengeId,
    );

    if (index == -1) {
      return false;
    }

    final challenge =
    InnovateMockData.challenges[index];

    // --------------------------------------------------------
    // MUST JOIN FIRST
    // --------------------------------------------------------

    if (!challenge.joined) {
      return false;
    }

    // --------------------------------------------------------
    // DEADLINE
    // --------------------------------------------------------

    final now = DateTime.now();

    /*
      Submission is allowed UNTIL the end date.

      Example:
      End date = 17 Aug 2026

      Allowed:
      17 Aug 2026 before 11:59:59 PM

      Closed:
      18 Aug 2026 onwards
    */

    final endDate = DateTime(
      challenge.endDate.year,
      challenge.endDate.month,
      challenge.endDate.day,
      23,
      59,
      59,
      999,
    );

    return !now.isAfter(endDate);
  }

  // ==========================================================
  // IDEAS
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

  Future<IdeaModel?> submitIdea({
    required String challengeId,
    required String title,
    required String description,
    required String domain,
    String? email,
    String? phone,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    // --------------------------------------------------------
    // FIND CHALLENGE
    // --------------------------------------------------------

    final challengeIndex =
    InnovateMockData.challenges.indexWhere(
          (challenge) => challenge.id == challengeId,
    );

    if (challengeIndex == -1) {
      return null;
    }

    final challenge =
    InnovateMockData.challenges[challengeIndex];

    // --------------------------------------------------------
    // MUST JOIN
    // --------------------------------------------------------

    if (!challenge.joined) {
      return null;
    }

    // --------------------------------------------------------
    // DEADLINE CHECK
    // --------------------------------------------------------

    if (!canSubmitToChallenge(
      challengeId,
    )) {
      return null;
    }

    // --------------------------------------------------------
    // VALIDATE TITLE
    // --------------------------------------------------------

    if (title.trim().isEmpty) {
      return null;
    }

    // --------------------------------------------------------
    // VALIDATE DESCRIPTION
    // --------------------------------------------------------

    if (description.trim().isEmpty) {
      return null;
    }

    // --------------------------------------------------------
    // VALIDATE DOMAIN
    // --------------------------------------------------------

    if (domain.trim().isEmpty) {
      return null;
    }

    // --------------------------------------------------------
    // EMAIL VALIDATION
    // --------------------------------------------------------

    if (email != null &&
        email.trim().isNotEmpty) {
      final emailRegex = RegExp(
        r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
      );

      if (!emailRegex.hasMatch(
        email.trim(),
      )) {
        return null;
      }
    }

    // --------------------------------------------------------
    // PHONE VALIDATION
    // --------------------------------------------------------

    if (phone != null &&
        phone.trim().isNotEmpty) {
      final phoneRegex = RegExp(
        r'^[0-9]{10}$',
      );

      if (!phoneRegex.hasMatch(
        phone.trim(),
      )) {
        return null;
      }
    }

    // --------------------------------------------------------
    // CREATE IDEA
    // --------------------------------------------------------

    final idea = IdeaModel(
      id:
      'IDEA-${DateTime.now().millisecondsSinceEpoch}',

      title: title.trim(),

      description: description.trim(),

      domain: domain.trim(),

      status: 'under_review',

      submittedDate: DateTime.now(),

      points:
      InnovateMockData.ideaSubmissionPoints,

      shortlisted: false,

      movedToBuild: false,

      challengeId: challengeId,

      challengeTitle: challenge.title,
    );

    // --------------------------------------------------------
    // SAVE IDEA
    // --------------------------------------------------------

    InnovateMockData.ideas.insert(
      0,
      idea,
    );

    // --------------------------------------------------------
    // ADD POINTS
    // --------------------------------------------------------

    InnovateMockData.innovationPoints +=
        InnovateMockData.ideaSubmissionPoints;

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

    // --------------------------------------------------------
    // NAME VALIDATION
    // --------------------------------------------------------

    final registeredName =
    InnovateMockData
        .registeredStudentName
        .trim()
        .toLowerCase();

    final enteredName =
    fullName.trim().toLowerCase();

    if (enteredName != registeredName) {
      return false;
    }

    // --------------------------------------------------------
    // STUDENT ID
    // --------------------------------------------------------

    if (studentId.trim().isEmpty) {
      return false;
    }

    // --------------------------------------------------------
    // EMAIL
    // --------------------------------------------------------

    final emailRegex = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    );

    if (!emailRegex.hasMatch(
      email.trim(),
    )) {
      return false;
    }

    // --------------------------------------------------------
    // PHONE
    // --------------------------------------------------------

    final phoneRegex = RegExp(
      r'^[0-9]{10}$',
    );

    if (!phoneRegex.hasMatch(
      phone.trim(),
    )) {
      return false;
    }

    // --------------------------------------------------------
    // FIND CHALLENGE
    // --------------------------------------------------------

    final index =
    InnovateMockData.challenges.indexWhere(
          (challenge) =>
      challenge.id == challengeId,
    );

    if (index == -1) {
      return false;
    }

    final challenge =
    InnovateMockData.challenges[index];

    // --------------------------------------------------------
    // ALREADY JOINED
    // --------------------------------------------------------

    if (InnovateMockData
        .joinedChallengeIds
        .contains(challengeId)) {
      return false;
    }

    // --------------------------------------------------------
    // REGISTER
    // --------------------------------------------------------

    InnovateMockData.joinedChallengeIds
        .add(challengeId);

    InnovateMockData.challenges[index] =
        challenge.copyWith(
          joined: true,
          participants:
          challenge.participants + 1,
        );

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
  // MOVE SHORTLISTED IDEA TO BUILD
  // ==========================================================

  Future<BuildProjectModel?> moveIdeaToBuild({
    required String ideaId,
  }) async {
    final ideaIndex =
    InnovateMockData.ideas.indexWhere(
          (idea) => idea.id == ideaId,
    );

    if (ideaIndex == -1) {
      return null;
    }

    final idea =
    InnovateMockData.ideas[ideaIndex];

    // --------------------------------------------------------
    // ONLY SHORTLISTED IDEAS
    // --------------------------------------------------------

    if (!idea.shortlisted) {
      return null;
    }

    // --------------------------------------------------------
    // ALREADY MOVED
    // --------------------------------------------------------

    if (idea.movedToBuild) {
      final buildRepository =
      const BuildRepository();

      return buildRepository.getProjectByIdeaId(
        ideaId,
      );
    }

    // --------------------------------------------------------
    // GET CHALLENGE INFORMATION
    // --------------------------------------------------------

    String challengeId =
        idea.challengeId;

    String challengeTitle =
        idea.challengeTitle;

    // --------------------------------------------------------
    // CREATE BUILD PROJECT
    // --------------------------------------------------------

    final buildRepository =
    const BuildRepository();

    final project =
    await buildRepository
        .createProjectFromIdea(
      ideaId: idea.id,
      challengeId: challengeId,
      challengeTitle: challengeTitle,
      title: idea.title,
      description: idea.description,
      technology: idea.domain,
    );

    // --------------------------------------------------------
    // UPDATE IDEA
    // --------------------------------------------------------

    InnovateMockData.ideas[ideaIndex] =
        idea.copyWith(
          movedToBuild: true,
        );

    return project;
  }

  // ==========================================================
  // STATISTICS
  // ==========================================================

  Future<Map<String, dynamic>>
  getStatistics() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final challenges =
        InnovateMockData.challenges;

    final ideas =
        InnovateMockData.ideas;

    final joined =
        challenges
            .where(
              (challenge) =>
          challenge.joined,
        )
            .length;

    final xp =
    challenges
        .where(
          (challenge) =>
      challenge.joined,
    )
        .fold<int>(
      0,
          (sum, item) =>
      sum + item.xp,
    );

    final shortlisted =
        ideas
            .where(
              (idea) =>
          idea.shortlisted,
        )
            .length;

    final movedToBuild =
        ideas
            .where(
              (idea) =>
          idea.movedToBuild,
        )
            .length;

    return {
      'joined': joined,
      'ideas': ideas.length,
      'xp': xp,
      'shortlisted': shortlisted,
      'movedToBuild': movedToBuild,
      'points':
      InnovateMockData.innovationPoints,
    };
  }
}