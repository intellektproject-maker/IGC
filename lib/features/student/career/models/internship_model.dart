class InternshipModel {
  final String id;

  final String company;

  final String role;

  final String location;

  final String mode;

  final String duration;

  final String stipend;

  final String eligibility;

  final String applicationStatus;

  final DateTime applicationDeadline;

  const InternshipModel({
    required this.id,
    required this.company,
    required this.role,
    required this.location,
    required this.mode,
    required this.duration,
    required this.stipend,
    required this.eligibility,
    required this.applicationStatus,
    required this.applicationDeadline,
  });

  factory InternshipModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return InternshipModel(
      id: json["id"],
      company: json["company"],
      role: json["role"],
      location: json["location"],
      mode: json["mode"],
      duration: json["duration"],
      stipend: json["stipend"],
      eligibility: json["eligibility"],
      applicationStatus: json["applicationStatus"],
      applicationDeadline: DateTime.parse(
        json["applicationDeadline"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "company": company,
      "role": role,
      "location": location,
      "mode": mode,
      "duration": duration,
      "stipend": stipend,
      "eligibility": eligibility,
      "applicationStatus": applicationStatus,
      "applicationDeadline":
      applicationDeadline.toIso8601String(),
    };
  }

  InternshipModel copyWith({
    String? id,
    String? company,
    String? role,
    String? location,
    String? mode,
    String? duration,
    String? stipend,
    String? eligibility,
    String? applicationStatus,
    DateTime? applicationDeadline,
  }) {
    return InternshipModel(
      id: id ?? this.id,
      company: company ?? this.company,
      role: role ?? this.role,
      location: location ?? this.location,
      mode: mode ?? this.mode,
      duration: duration ?? this.duration,
      stipend: stipend ?? this.stipend,
      eligibility: eligibility ?? this.eligibility,
      applicationStatus:
      applicationStatus ?? this.applicationStatus,
      applicationDeadline:
      applicationDeadline ??
          this.applicationDeadline,
    );
  }
}