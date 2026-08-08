import '../models/literature_model.dart';
import '../models/paper_model.dart';
import '../models/research_event_model.dart';
import '../models/research_project_model.dart';

class ResearchMockData {
  ResearchMockData._();

  // ==========================================================
  // Research Projects
  // ==========================================================

  static final List<ResearchProjectModel> projects = [

    ResearchProjectModel(
      id: "RES-001",
      title: "AI for Smart Agriculture",
      description:
      "Research on applying Artificial Intelligence to precision farming.",
      domain: "Artificial Intelligence",
      status: "active",
      progress: 0.45,
      publicationTarget: "IEEE",
      citations: 8,
      startDate: DateTime(2026, 6, 1),
      expectedCompletion: DateTime(2026, 12, 31),
      featured: true,
    ),

    ResearchProjectModel(
      id: "RES-002",
      title: "IoT Based Water Monitoring",
      description:
      "Designing an IoT solution for real-time water quality monitoring.",
      domain: "Internet of Things",
      status: "active",
      progress: 0.25,
      publicationTarget: "Springer",
      citations: 3,
      startDate: DateTime(2026, 7, 15),
      expectedCompletion: DateTime(2027, 2, 15),
      featured: false,
    ),
  ];

  // ==========================================================
  // Research Papers
  // ==========================================================

  static final List<PaperModel> papers = [

    PaperModel(
      id: "PAP-001",
      title: "AI Based Crop Prediction",
      abstract:
      "A machine learning approach for predicting crop yield.",
      journal: "IEEE Access",
      status: "under_review",
      indexing: "Scopus",
      submissionDate: DateTime(2026, 7, 10),
      publicationDate: null,
      citations: 0,
      featured: true,
    ),

    PaperModel(
      id: "PAP-002",
      title: "Smart Water Quality Monitoring",
      abstract:
      "An IoT framework for monitoring water quality.",
      journal: "Springer Nature",
      status: "published",
      indexing: "Scopus",
      submissionDate: DateTime(2026, 5, 18),
      publicationDate: DateTime(2026, 7, 28),
      citations: 6,
      featured: false,
    ),
  ];

  // ==========================================================
  // Literature Review
  // ==========================================================

  static final List<LiteratureModel> literature = [

    LiteratureModel(
      id: "LIT-001",
      title: "Deep Learning in Agriculture",
      topic: "Artificial Intelligence",
      source: "IEEE Xplore",
      authors: "John Smith et al.",
      publicationYear: 2025,
      type: "Journal",
      completed: true,
      bookmarked: true,
    ),

    LiteratureModel(
      id: "LIT-002",
      title: "IoT Sensor Networks",
      topic: "Internet of Things",
      source: "Springer",
      authors: "Emily Johnson",
      publicationYear: 2024,
      type: "Conference",
      completed: false,
      bookmarked: true,
    ),

    LiteratureModel(
      id: "LIT-003",
      title: "Cyber Security for Smart Devices",
      topic: "Cyber Security",
      source: "Elsevier",
      authors: "Michael Brown",
      publicationYear: 2023,
      type: "Journal",
      completed: false,
      bookmarked: false,
    ),
  ];

  // ==========================================================
  // Research Events
  // ==========================================================

  static final List<ResearchEventModel> events = [

    ResearchEventModel(
      id: "EVT-001",
      title: "IEEE Paper Writing Workshop",
      description:
      "Learn how to prepare and publish IEEE research papers.",
      venue: "Research Center",
      eventDate: DateTime(2026, 8, 18),
      organizer: "IGC Research Cell",
      type: "Workshop",
      registered: true,
      image: "",
    ),

    ResearchEventModel(
      id: "EVT-002",
      title: "Patent Drafting Seminar",
      description:
      "Hands-on training for writing patent applications.",
      venue: "Seminar Hall",
      eventDate: DateTime(2026, 9, 2),
      organizer: "Innovation Cell",
      type: "Seminar",
      registered: false,
      image: "",
    ),

    ResearchEventModel(
      id: "EVT-003",
      title: "Research Methodology Bootcamp",
      description:
      "Research design, literature review and publication process.",
      venue: "Conference Hall",
      eventDate: DateTime(2026, 9, 20),
      organizer: "Academic Research Division",
      type: "Bootcamp",
      registered: false,
      image: "",
    ),
  ];
}