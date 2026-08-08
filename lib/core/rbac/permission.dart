enum Permission {
  // =====================================================
  // Dashboard
  // =====================================================
  viewDashboard,

  // =====================================================
  // Student Modules
  // =====================================================
  viewProfile,
  editProfile,

  viewLearning,
  viewInnovation,
  viewProjects,
  viewEvents,
  viewLeaderboard,
  viewCertificates,

  // =====================================================
  // Attendance
  // =====================================================
  viewAttendance,
  markAttendance,
  manageAttendance,

  // =====================================================
  // Meetings
  // =====================================================
  viewMeetings,
  createMeeting,
  manageMeetings,

  // =====================================================
  // Reports
  // =====================================================
  viewReports,
  createReports,
  manageReports,

  // =====================================================
  // Member Management
  // =====================================================
  viewMembers,
  manageMembers,

  // =====================================================
  // Communication
  // =====================================================
  sendAnnouncements,
  sendNotifications,

  // =====================================================
  // Growth Coordinator
  // =====================================================
  manageGrowth,

  // =====================================================
  // Engagement Coordinator
  // =====================================================
  manageEngagement,

  // =====================================================
  // Student Ambassador
  // =====================================================
  manageOutreach,

  // =====================================================
  // Training Coordinator
  // =====================================================
  manageTraining,

  // =====================================================
  // Software Technical Coordinator
  // =====================================================
  manageSoftware,

  // =====================================================
  // Hardware Technical Coordinator
  // =====================================================
  manageHardware,

  // =====================================================
  // Sports & Activities Coordinator
  // =====================================================
  manageSports,

  // =====================================================
  // Analytics
  // =====================================================
  viewAnalytics,
}

extension PermissionExtension on Permission {
  String get displayName {
    switch (this) {
      case Permission.viewDashboard:
        return "Dashboard";

      case Permission.viewProfile:
        return "Profile";

      case Permission.editProfile:
        return "Edit Profile";

      case Permission.viewLearning:
        return "Learning";

      case Permission.viewInnovation:
        return "Innovation";

      case Permission.viewProjects:
        return "Projects";

      case Permission.viewEvents:
        return "Events";

      case Permission.viewLeaderboard:
        return "Leaderboard";

      case Permission.viewCertificates:
        return "Certificates";

      case Permission.viewAttendance:
        return "View Attendance";

      case Permission.markAttendance:
        return "Mark Attendance";

      case Permission.manageAttendance:
        return "Manage Attendance";

      case Permission.viewMeetings:
        return "View Meetings";

      case Permission.createMeeting:
        return "Create Meeting";

      case Permission.manageMeetings:
        return "Manage Meetings";

      case Permission.viewReports:
        return "View Reports";

      case Permission.createReports:
        return "Create Reports";

      case Permission.manageReports:
        return "Manage Reports";

      case Permission.viewMembers:
        return "View Members";

      case Permission.manageMembers:
        return "Manage Members";

      case Permission.sendAnnouncements:
        return "Send Announcements";

      case Permission.sendNotifications:
        return "Send Notifications";

      case Permission.manageGrowth:
        return "Growth Management";

      case Permission.manageEngagement:
        return "Engagement Management";

      case Permission.manageOutreach:
        return "Outreach Management";

      case Permission.manageTraining:
        return "Training Management";

      case Permission.manageSoftware:
        return "Software Management";

      case Permission.manageHardware:
        return "Hardware Management";

      case Permission.manageSports:
        return "Sports Management";

      case Permission.viewAnalytics:
        return "Analytics";
    }
  }
}