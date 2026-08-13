import '../models/challenge_model.dart';
import '../models/event_model.dart';
import '../models/idea_model.dart';

class InnovateMockData {
  InnovateMockData._();

  // ==========================================================
  // REGISTERED STUDENT
  // ==========================================================

  static const String registeredStudentName =
      'Arjun Prasad';

  // ==========================================================
  // INNOVATION POINTS
  // ==========================================================

  static int innovationPoints = 0;

  static const int ideaSubmissionPoints = 10;

  // ==========================================================
  // JOINED CHALLENGES
  // ==========================================================
  //
  // IMPORTANT:
  // Each challenge has its own ID.
  //
  // This allows the same student to join:
  //
  // CH-001
  // CH-002
  // CH-003
  //
  // independently.
  //
  // ==========================================================

  static final Set<String> joinedChallengeIds = {};

  // ==========================================================
  // CHALLENGES
  // ==========================================================

  static final List<ChallengeModel> challenges = [
    ChallengeModel(
      id: 'CH-001',
      title: 'Smart Campus Innovation',
      description:
      'Develop innovative solutions to improve campus life using AI, IoT or Automation.',
      category: 'Innovation',
      status: 'ongoing',
      xp: 500,
      startDate: DateTime(2026, 8, 1),
      endDate: DateTime(2026, 8, 31),
      participants: 245,
      difficulty: 'Intermediate',
      image: '',
      featured: true,
      joined: false,
    ),

    ChallengeModel(
      id: 'CH-002',
      title: 'Green Energy Challenge',
      description:
      'Build sustainable energy solutions for smart cities.',
      category: 'Environment',
      status: 'open',
      xp: 350,
      startDate: DateTime(2026, 8, 5),
      endDate: DateTime(2026, 9, 10),
      participants: 108,
      difficulty: 'Beginner',
      image: '',
      featured: false,
      joined: false,
    ),

    ChallengeModel(
      id: 'CH-003',
      title: 'AI Healthcare',
      description:
      'Design AI-powered healthcare solutions for rural communities.',
      category: 'Healthcare',
      status: 'open',
      xp: 450,
      startDate: DateTime(2026, 8, 10),
      endDate: DateTime(2026, 9, 15),
      participants: 180,
      difficulty: 'Advanced',
      image: '',
      featured: false,
      joined: false,
    ),
  ];

  // ==========================================================
  // IDEAS
  // ==========================================================

  static final List<IdeaModel> ideas = [
    IdeaModel(
      id: 'IDEA-001',
      title: 'Smart Attendance using AI',
      description:
      'Face recognition based attendance system.',
      domain: 'Artificial Intelligence',
      status: 'under_review',
      submittedDate:
      DateTime(2026, 7, 15),
      points: 0,
      shortlisted: true,
    ),

    IdeaModel(
      id: 'IDEA-002',
      title: 'IoT Water Monitoring',
      description:
      'Monitor water quality using ESP32 sensors.',
      domain: 'IoT',
      status: 'submitted',
      submittedDate:
      DateTime(2026, 7, 22),
      points: 0,
      shortlisted: false,
    ),
  ];

  // ==========================================================
  // EVENTS
  // ==========================================================

  static final List<EventModel> events = [
    EventModel(
      id: 'EVT-001',
      title: 'National Hackathon',
      description:
      '24-hour innovation hackathon.',
      venue: 'Innovation Center',
      eventDate:
      DateTime(2026, 8, 20),
      organizer: 'IGC',
      type: 'Hackathon',
      registered: true,
      image: '',
    ),

    EventModel(
      id: 'EVT-002',
      title: 'Prototype Expo',
      description:
      'Showcase working prototypes to industry experts.',
      venue: 'Main Auditorium',
      eventDate:
      DateTime(2026, 9, 5),
      organizer: 'Innovation Cell',
      type: 'Expo',
      registered: false,
      image: '',
    ),

    EventModel(
      id: 'EVT-003',
      title: 'Startup Pitch Day',
      description:
      'Pitch your startup idea to investors.',
      venue: 'Seminar Hall',
      eventDate:
      DateTime(2026, 9, 18),
      organizer: 'Startup Cell',
      type: 'Pitch',
      registered: false,
      image: '',
    ),
  ];
}