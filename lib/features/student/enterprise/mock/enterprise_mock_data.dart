import '../models/business_canvas_model.dart';
import '../models/enterprise_event_model.dart';
import '../models/pitch_model.dart';
import '../models/venture_model.dart';

class EnterpriseMockData {
  EnterpriseMockData._();

  //=========================================================
  // Ventures
  //=========================================================

  static final List<VentureModel> ventures = [

    VentureModel(
      id: "VEN-001",
      title: "Smart Attendance Platform",
      description:
      "AI-powered attendance solution for educational institutions.",
      industry: "EdTech",
      stage: "MVP",
      progress: 0.55,
      startupScore: 82,
      teamMembers: 5,
      featured: true,
      incubated: true,
      createdAt: DateTime(2026, 6, 15),
    ),

    VentureModel(
      id: "VEN-002",
      title: "Campus Navigation",
      description:
      "Indoor navigation platform using BLE technology.",
      industry: "IoT",
      stage: "Prototype",
      progress: 0.35,
      startupScore: 70,
      teamMembers: 4,
      featured: false,
      incubated: false,
      createdAt: DateTime(2026, 7, 2),
    ),
  ];

  //=========================================================
  // Business Canvas
  //=========================================================

  static final List<BusinessCanvasModel> canvas = [

    BusinessCanvasModel(
      id: "CAN-001",
      ventureId: "VEN-001",
      valueProposition:
      "Automated attendance with AI verification.",
      customerSegment:
      "Schools and Colleges",
      revenueModel:
      "Annual SaaS Subscription",
      keyPartners:
      "Educational Institutions",
      channels:
      "Direct Sales & Campus Partnerships",
      costStructure:
      "Cloud Hosting, AI Services",
      completed: true,
    ),

    BusinessCanvasModel(
      id: "CAN-002",
      ventureId: "VEN-002",
      valueProposition:
      "Accurate indoor campus navigation.",
      customerSegment:
      "Universities",
      revenueModel:
      "Enterprise Licensing",
      keyPartners:
      "Hardware Vendors",
      channels:
      "University Partnerships",
      costStructure:
      "BLE Infrastructure",
      completed: false,
    ),
  ];

  //=========================================================
  // Investor Pitches
  //=========================================================

  static final List<PitchModel> pitches = [

    PitchModel(
      id: "PIT-001",
      ventureId: "VEN-001",
      title: "Seed Funding Pitch",
      investor: "IGC Incubator",
      fundingRequested: 500000,
      fundingReceived: 250000,
      pitchScore: 88,
      status: "Shortlisted",
      mentorFeedback:
      "Strong MVP with clear market potential.",
      pitchDate: DateTime(2026, 8, 20),
    ),

    PitchModel(
      id: "PIT-002",
      ventureId: "VEN-002",
      title: "Prototype Validation",
      investor: "Innovation Fund",
      fundingRequested: 300000,
      fundingReceived: 0,
      pitchScore: 74,
      status: "Pending",
      mentorFeedback:
      "Improve customer validation before pitching.",
      pitchDate: DateTime(2026, 9, 5),
    ),
  ];

  //=========================================================
  // Enterprise Events
  //=========================================================

  static final List<EnterpriseEventModel> events = [

    EnterpriseEventModel(
      id: "EVT-001",
      title: "Startup Bootcamp",
      description:
      "Business model validation and startup strategy workshop.",
      venue: "Innovation Center",
      eventDate: DateTime(2026, 8, 18),
      organizer: "IGC",
      type: "Bootcamp",
      registered: true,
      image: "",
    ),

    EnterpriseEventModel(
      id: "EVT-002",
      title: "Investor Meetup",
      description:
      "Meet angel investors and venture capital mentors.",
      venue: "Conference Hall",
      eventDate: DateTime(2026, 9, 2),
      organizer: "Startup Cell",
      type: "Networking",
      registered: false,
      image: "",
    ),

    EnterpriseEventModel(
      id: "EVT-003",
      title: "Demo Day",
      description:
      "Present your venture before incubators and investors.",
      venue: "Main Auditorium",
      eventDate: DateTime(2026, 9, 25),
      organizer: "IGC Enterprise",
      type: "Pitch Event",
      registered: false,
      image: "",
    ),
  ];
}