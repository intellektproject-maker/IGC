class ProfileModel {
  final String id;

  final String studentName;

  final String githubUrl;

  final String linkedinUrl;

  final String portfolioUrl;

  final int careerScore;

  final int profileCompletion;

  final int certifications;

  final int internships;

  final bool featured;

  const ProfileModel({
    required this.id,
    required this.studentName,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.portfolioUrl,
    required this.careerScore,
    required this.profileCompletion,
    required this.certifications,
    required this.internships,
    required this.featured,
  });

  factory ProfileModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ProfileModel(
      id: json["id"],
      studentName: json["studentName"],
      githubUrl: json["githubUrl"],
      linkedinUrl: json["linkedinUrl"],
      portfolioUrl: json["portfolioUrl"],
      careerScore: json["careerScore"],
      profileCompletion: json["profileCompletion"],
      certifications: json["certifications"],
      internships: json["internships"],
      featured: json["featured"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "studentName": studentName,
      "githubUrl": githubUrl,
      "linkedinUrl": linkedinUrl,
      "portfolioUrl": portfolioUrl,
      "careerScore": careerScore,
      "profileCompletion": profileCompletion,
      "certifications": certifications,
      "internships": internships,
      "featured": featured,
    };
  }

  ProfileModel copyWith({
    String? id,
    String? studentName,
    String? githubUrl,
    String? linkedinUrl,
    String? portfolioUrl,
    int? careerScore,
    int? profileCompletion,
    int? certifications,
    int? internships,
    bool? featured,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      studentName: studentName ?? this.studentName,
      githubUrl: githubUrl ?? this.githubUrl,
      linkedinUrl: linkedinUrl ?? this.linkedinUrl,
      portfolioUrl: portfolioUrl ?? this.portfolioUrl,
      careerScore: careerScore ?? this.careerScore,
      profileCompletion:
      profileCompletion ?? this.profileCompletion,
      certifications:
      certifications ?? this.certifications,
      internships:
      internships ?? this.internships,
      featured: featured ?? this.featured,
    );
  }
}