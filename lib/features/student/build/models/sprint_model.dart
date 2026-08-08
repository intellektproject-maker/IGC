class SprintModel {
  final String id;

  final String title;

  final String description;

  final String category;

  final int sprintNumber;

  final int totalSprints;

  final double progress;

  final int xp;

  final int teamMembers;

  final bool active;

  final bool featured;

  final DateTime startDate;

  final DateTime endDate;

  const SprintModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.sprintNumber,
    required this.totalSprints,
    required this.progress,
    required this.xp,
    required this.teamMembers,
    required this.active,
    required this.featured,
    required this.startDate,
    required this.endDate,
  });

  factory SprintModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return SprintModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
      sprintNumber: json["sprintNumber"],
      totalSprints: json["totalSprints"],
      progress: (json["progress"] as num).toDouble(),
      xp: json["xp"],
      teamMembers: json["teamMembers"],
      active: json["active"],
      featured: json["featured"],
      startDate: DateTime.parse(json["startDate"]),
      endDate: DateTime.parse(json["endDate"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "sprintNumber": sprintNumber,
      "totalSprints": totalSprints,
      "progress": progress,
      "xp": xp,
      "teamMembers": teamMembers,
      "active": active,
      "featured": featured,
      "startDate": startDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
    };
  }

  SprintModel copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    int? sprintNumber,
    int? totalSprints,
    double? progress,
    int? xp,
    int? teamMembers,
    bool? active,
    bool? featured,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return SprintModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      sprintNumber: sprintNumber ?? this.sprintNumber,
      totalSprints: totalSprints ?? this.totalSprints,
      progress: progress ?? this.progress,
      xp: xp ?? this.xp,
      teamMembers: teamMembers ?? this.teamMembers,
      active: active ?? this.active,
      featured: featured ?? this.featured,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}