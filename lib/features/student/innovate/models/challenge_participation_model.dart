class ChallengeParticipationModel {
  final String id;
  final String challengeId;

  final String fullName;
  final String studentId;
  final String institution;
  final String course;
  final String year;

  final String email;
  final String phone;

  /// Individual / Team
  final String participationType;

  final DateTime participatedAt;

  /// joined / cancelled
  final String status;

  const ChallengeParticipationModel({
    required this.id,
    required this.challengeId,
    required this.fullName,
    required this.studentId,
    required this.institution,
    required this.course,
    required this.year,
    required this.email,
    required this.phone,
    required this.participationType,
    required this.participatedAt,
    required this.status,
  });

  factory ChallengeParticipationModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ChallengeParticipationModel(
      id: json['id'] as String,
      challengeId: json['challengeId'] as String,
      fullName: json['fullName'] as String,
      studentId: json['studentId'] as String,
      institution: json['institution'] as String,
      course: json['course'] as String,
      year: json['year'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      participationType:
      json['participationType'] as String,
      participatedAt: DateTime.parse(
        json['participatedAt'] as String,
      ),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'challengeId': challengeId,
      'fullName': fullName,
      'studentId': studentId,
      'institution': institution,
      'course': course,
      'year': year,
      'email': email,
      'phone': phone,
      'participationType': participationType,
      'participatedAt':
      participatedAt.toIso8601String(),
      'status': status,
    };
  }

  ChallengeParticipationModel copyWith({
    String? id,
    String? challengeId,
    String? fullName,
    String? studentId,
    String? institution,
    String? course,
    String? year,
    String? email,
    String? phone,
    String? participationType,
    DateTime? participatedAt,
    String? status,
  }) {
    return ChallengeParticipationModel(
      id: id ?? this.id,
      challengeId:
      challengeId ?? this.challengeId,
      fullName: fullName ?? this.fullName,
      studentId: studentId ?? this.studentId,
      institution:
      institution ?? this.institution,
      course: course ?? this.course,
      year: year ?? this.year,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      participationType:
      participationType ??
          this.participationType,
      participatedAt:
      participatedAt ??
          this.participatedAt,
      status: status ?? this.status,
    );
  }
}