import 'permission.dart';
import 'role.dart';

class RolePermissions {
  RolePermissions._();

  static final Map<StudentRole, Set<Permission>> permissions = {
    // =====================================================
    // Default Student
    // =====================================================
    StudentRole.student: {
      Permission.viewDashboard,
      Permission.viewProfile,
      Permission.editProfile,
      Permission.viewLearning,
      Permission.viewInnovation,
      Permission.viewProjects,
      Permission.viewEvents,
      Permission.viewLeaderboard,
      Permission.viewCertificates,
      Permission.viewAttendance,
      Permission.viewMeetings,
    },

    // =====================================================
    // President
    // =====================================================
    StudentRole.president: {
      ...permissionsForStudent,

      Permission.viewReports,
      Permission.createReports,
      Permission.manageReports,

      Permission.viewMembers,
      Permission.manageMembers,

      Permission.createMeeting,
      Permission.manageMeetings,

      Permission.sendAnnouncements,
      Permission.sendNotifications,

      Permission.viewAnalytics,
    },

    // =====================================================
    // Vice President
    // =====================================================
    StudentRole.vicePresident: {
      ...permissionsForStudent,

      Permission.viewReports,
      Permission.createReports,

      Permission.viewMembers,

      Permission.createMeeting,
      Permission.manageMeetings,

      Permission.viewAnalytics,
    },

    // =====================================================
    // Secretary
    // =====================================================
    StudentRole.secretary: {
      ...permissionsForStudent,

      Permission.viewReports,
      Permission.createReports,

      Permission.sendAnnouncements,
      Permission.sendNotifications,
    },

    // =====================================================
    // Growth Coordinator
    // =====================================================
    StudentRole.growthCoordinator: {
      ...permissionsForStudent,

      Permission.manageGrowth,
      Permission.viewMembers,
      Permission.viewReports,
    },

    // =====================================================
    // Engagement Coordinator
    // =====================================================
    StudentRole.engagementCoordinator: {
      ...permissionsForStudent,

      Permission.manageEngagement,
      Permission.viewEvents,
      Permission.viewReports,
    },

    // =====================================================
    // Student Ambassador
    // =====================================================
    StudentRole.studentAmbassador: {
      ...permissionsForStudent,

      Permission.manageOutreach,
      Permission.sendAnnouncements,
      Permission.sendNotifications,
    },

    // =====================================================
    // Training Coordinator
    // =====================================================
    StudentRole.trainingCoordinator: {
      ...permissionsForStudent,

      Permission.manageTraining,
      Permission.viewReports,
    },

    // =====================================================
    // Software Technical Coordinator
    // =====================================================
    StudentRole.softwareTechnicalCoordinator: {
      ...permissionsForStudent,

      Permission.manageSoftware,
      Permission.viewProjects,
    },

    // =====================================================
    // Hardware Technical Coordinator
    // =====================================================
    StudentRole.hardwareTechnicalCoordinator: {
      ...permissionsForStudent,

      Permission.manageHardware,
      Permission.viewProjects,
    },

    // =====================================================
    // Attendance Coordinator
    // =====================================================
    StudentRole.attendanceCoordinator: {
      ...permissionsForStudent,

      Permission.markAttendance,
      Permission.manageAttendance,
      Permission.viewReports,
    },

    // =====================================================
    // Sports & Activities Coordinator
    // =====================================================
    StudentRole.sportsActivitiesCoordinator: {
      ...permissionsForStudent,

      Permission.manageSports,
      Permission.viewEvents,
    },
  };

  // =====================================================
  // Shared Student Permissions
  // =====================================================

  static const Set<Permission> permissionsForStudent = {
    Permission.viewDashboard,
    Permission.viewProfile,
    Permission.editProfile,
    Permission.viewLearning,
    Permission.viewInnovation,
    Permission.viewProjects,
    Permission.viewEvents,
    Permission.viewLeaderboard,
    Permission.viewCertificates,
    Permission.viewAttendance,
    Permission.viewMeetings,
  };

  // =====================================================
  // Get Permissions
  // =====================================================

  static Set<Permission> getPermissions(StudentRole role) {
    return permissions[role] ?? permissionsForStudent;
  }
}