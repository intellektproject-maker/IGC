class BuildProjectModel {
  final String id;

  final String title;

  final String description;

  final String technology;

  final String status;

  final int completion;

  final String githubUrl;

  final bool featured;

  final DateTime createdAt;

  const BuildProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.technology,
    required this.status,
    required this.completion,
    required this.githubUrl,
    required this.featured,
    required this.createdAt,
  });

  factory BuildProjectModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return BuildProjectModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      technology: json["technology"],
      status: json["status"],
      completion: json["completion"],
      githubUrl: json["githubUrl"],
      featured: json["featured"],
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
      "technology": technology,
      "status": status,
      "completion": completion,
      "githubUrl": githubUrl,
      "featured": featured,
      "createdAt":
      createdAt.toIso8601String(),
    };
  }

  BuildProjectModel copyWith({
    String? id,
    String? title,
    String? description,
    String? technology,
    String? status,
    int? completion,
    String? githubUrl,
    bool? featured,
    DateTime? createdAt,
  }) {
    return BuildProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description:
      description ?? this.description,
      technology:
      technology ?? this.technology,
      status: status ?? this.status,
      completion:
      completion ?? this.completion,
      githubUrl:
      githubUrl ?? this.githubUrl,
      featured:
      featured ?? this.featured,
      createdAt:
      createdAt ?? this.createdAt,
    );
  }
}