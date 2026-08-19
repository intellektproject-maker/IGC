import '../models/build_event_model.dart';
import '../models/build_project_model.dart';
import '../models/milestone_model.dart';
import '../models/sprint_model.dart';

class BuildMockData {
  BuildMockData._();

  // ==========================================================
  // SPRINTS
  // ==========================================================

  static final List<SprintModel> sprints = [
    SprintModel(
      id: 'SPR-001',
      title: 'Smart Attendance System',
      description:
      'Develop an AI-powered attendance system using Flutter and Firebase.',
      category: 'Mobile App',
      sprintNumber: 2,
      totalSprints: 6,
      progress: 0.45,
      xp: 500,
      teamMembers: 5,
      active: true,
      featured: true,
      startDate: DateTime(2026, 8, 1),
      endDate: DateTime(2026, 9, 15),
    ),

    SprintModel(
      id: 'SPR-002',
      title: 'Campus Navigation',
      description:
      'Indoor navigation system using BLE and Flutter.',
      category: 'IoT',
      sprintNumber: 1,
      totalSprints: 5,
      progress: 0.20,
      xp: 300,
      teamMembers: 4,
      active: true,
      featured: false,
      startDate: DateTime(2026, 8, 10),
      endDate: DateTime(2026, 10, 1),
    ),
  ];

  // ==========================================================
  // PROJECTS
  // ==========================================================

  static final List<BuildProjectModel> projects = [
    BuildProjectModel(
      id: 'PROJ-001',

      // REQUIRED BY BuildProjectModel
      ideaId: 'IDEA-001',
      challengeId: 'CH-001',
      challengeTitle: 'Smart Campus Innovation Challenge',

      title: 'Smart Attendance using AI',

      description:
      'Face recognition based attendance system.',

      technology: 'Artificial Intelligence',

      status: 'In Progress',

      completion: 65,

      githubUrl:
      'https://github.com/intellektproject-maker/IGC',

      featured: true,

      createdAt: DateTime(2026, 7, 15),
    ),
  ];

  // ==========================================================
  // MILESTONES
  // ==========================================================

  static final List<MilestoneModel> milestones = [
    MilestoneModel(
      id: 'MILE-001',
      title: 'UI Design',
      description:
      'Complete all application screens.',
      completed: true,
      dueDate: DateTime(2026, 8, 8),
      xp: 100,
    ),

    MilestoneModel(
      id: 'MILE-002',
      title: 'API Integration',
      description:
      'Connect Flutter with backend.',
      completed: false,
      dueDate: DateTime(2026, 8, 18),
      xp: 200,
    ),

    MilestoneModel(
      id: 'MILE-003',
      title: 'Testing',
      description:
      'Complete integration testing.',
      completed: false,
      dueDate: DateTime(2026, 8, 30),
      xp: 150,
    ),
  ];

  // ==========================================================
// EVENTS
// ==========================================================

  static final List<BuildEventModel> events = [
    BuildEventModel(
      id: 'EVT-001',
      title: 'Flutter Sprint Workshop',
      description:
      'Build production Flutter applications.',
      venue: 'Innovation Lab',
      eventDate: DateTime(2026, 8, 15),
      organizer: 'IGC',
      type: 'Workshop',
      registered: true,
      image: '',

      teamName: 'Code Warriors',

      teamMembers: [
        'Arun Kumar',
        'Priya Sharma',
        'Rahul Raj',
      ],
    ),

    BuildEventModel(
      id: 'EVT-002',
      title: 'Demo Day',
      description:
      'Present sprint progress before mentors.',
      venue: 'Conference Hall',
      eventDate: DateTime(2026, 9, 5),
      organizer: 'IGC',
      type: 'Presentation',
      registered: false,
      image: '',

      teamName: '',

      teamMembers: [],
    ),
  ];
}