class VentureModel {
  final String id;

  final String title;

  final String description;

  final String industry;

  final String stage;

  final double progress;

  final int startupScore;

  final int teamMembers;

  final bool featured;

  final bool incubated;

  final DateTime createdAt;

  const VentureModel({
    required this.id,
    required this.title,
    required this.description,
    required this.industry,
    required this.stage,
    required this.progress,
    required this.startupScore,
    required this.teamMembers,
    required this.featured,
    required this.incubated,
    required this.createdAt,
  });

  factory VentureModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return VentureModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      industry: json["industry"],
      stage: json["stage"],
      progress: (json["progress"] as num).toDouble(),
      startupScore: json["startupScore"],
      teamMembers: json["teamMembers"],
      featured: json["featured"],
      incubated: json["incubated"],
      createdAt: DateTime.parse(
        json["createdAt"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "industry": industry,
      "stage": stage,
      "progress": progress,
      "startupScore": startupScore,
      "teamMembers": teamMembers,
      "featured": featured,
      "incubated": incubated,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  VentureModel copyWith({
    String? id,
    String? title,
    String? description,
    String? industry,
    String? stage,
    double? progress,
    int? startupScore,
    int? teamMembers,
    bool? featured,
    bool? incubated,
    DateTime? createdAt,
  }) {
    return VentureModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      industry: industry ?? this.industry,
      stage: stage ?? this.stage,
      progress: progress ?? this.progress,
      startupScore: startupScore ?? this.startupScore,
      teamMembers: teamMembers ?? this.teamMembers,
      featured: featured ?? this.featured,
      incubated: incubated ?? this.incubated,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}