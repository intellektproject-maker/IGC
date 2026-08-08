enum StudentRole {
  student,

  // Student Chapter Leadership
  president,
  vicePresident,
  secretary,

  // Student Coordinators
  growthCoordinator,
  engagementCoordinator,
  studentAmbassador,
  trainingCoordinator,
  softwareTechnicalCoordinator,
  hardwareTechnicalCoordinator,
  attendanceCoordinator,
  sportsActivitiesCoordinator,
}

extension StudentRoleExtension on StudentRole {
  /// Display name for UI
  String get displayName {
    switch (this) {
      case StudentRole.student:
        return "Student";

      case StudentRole.president:
        return "President";

      case StudentRole.vicePresident:
        return "Vice President";

      case StudentRole.secretary:
        return "Secretary";

      case StudentRole.growthCoordinator:
        return "Growth Coordinator";

      case StudentRole.engagementCoordinator:
        return "Engagement Coordinator";

      case StudentRole.studentAmbassador:
        return "Student Ambassador";

      case StudentRole.trainingCoordinator:
        return "Training Coordinator";

      case StudentRole.softwareTechnicalCoordinator:
        return "Software Technical Coordinator";

      case StudentRole.hardwareTechnicalCoordinator:
        return "Hardware Technical Coordinator";

      case StudentRole.attendanceCoordinator:
        return "Attendance Coordinator";

      case StudentRole.sportsActivitiesCoordinator:
        return "Sports & Activities Coordinator";
    }
  }

  /// Value stored in API/Database
  String get apiValue {
    switch (this) {
      case StudentRole.student:
        return "student";

      case StudentRole.president:
        return "president";

      case StudentRole.vicePresident:
        return "vice_president";

      case StudentRole.secretary:
        return "secretary";

      case StudentRole.growthCoordinator:
        return "growth_coordinator";

      case StudentRole.engagementCoordinator:
        return "engagement_coordinator";

      case StudentRole.studentAmbassador:
        return "student_ambassador";

      case StudentRole.trainingCoordinator:
        return "training_coordinator";

      case StudentRole.softwareTechnicalCoordinator:
        return "software_technical_coordinator";

      case StudentRole.hardwareTechnicalCoordinator:
        return "hardware_technical_coordinator";

      case StudentRole.attendanceCoordinator:
        return "attendance_coordinator";

      case StudentRole.sportsActivitiesCoordinator:
        return "sports_activities_coordinator";
    }
  }

  /// True for all leadership roles
  bool get isLeadershipRole => this != StudentRole.student;

  /// True only for coordinator roles
  bool get isCoordinator {
    switch (this) {
      case StudentRole.growthCoordinator:
      case StudentRole.engagementCoordinator:
      case StudentRole.trainingCoordinator:
      case StudentRole.softwareTechnicalCoordinator:
      case StudentRole.hardwareTechnicalCoordinator:
      case StudentRole.attendanceCoordinator:
      case StudentRole.sportsActivitiesCoordinator:
        return true;

      default:
        return false;
    }
  }

  /// Chapter leadership (President/VP/Secretary)
  bool get isChapterLeadership {
    switch (this) {
      case StudentRole.president:
      case StudentRole.vicePresident:
      case StudentRole.secretary:
        return true;

      default:
        return false;
    }
  }
}

/// Converts API String → StudentRole
StudentRole parseStudentRole(String? role) {
  if (role == null || role.trim().isEmpty) {
    return StudentRole.student;
  }

  final value = role
      .toLowerCase()
      .replaceAll("_", " ")
      .replaceAll("-", " ")
      .replaceAll("&", "and")
      .trim();

  switch (value) {
    case "president":
      return StudentRole.president;

    case "vice president":
      return StudentRole.vicePresident;

    case "secretary":
      return StudentRole.secretary;

    case "growth coordinator":
      return StudentRole.growthCoordinator;

    case "engagement coordinator":
      return StudentRole.engagementCoordinator;

    case "student ambassador":
      return StudentRole.studentAmbassador;

    case "training coordinator":
      return StudentRole.trainingCoordinator;

    case "software technical coordinator":
      return StudentRole.softwareTechnicalCoordinator;

    case "hardware technical coordinator":
      return StudentRole.hardwareTechnicalCoordinator;

    case "attendance coordinator":
      return StudentRole.attendanceCoordinator;

    case "sports and activities coordinator":
    case "sports activities coordinator":
      return StudentRole.sportsActivitiesCoordinator;

    default:
      return StudentRole.student;
  }
}