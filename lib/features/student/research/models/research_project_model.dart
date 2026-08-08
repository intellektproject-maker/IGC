class ResearchProjectModel {
  final String id;

  final String title;

  final String description;

  final String domain;

  /// draft
  /// active
  /// completed
  /// published
  final String status;

  final double progress;

  final String publicationTarget;

  final int citations;

  final DateTime startDate;

  final DateTime expectedCompletion;

  final bool featured;

  const ResearchProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.domain,
    required this.status,
    required this.progress,
    required this.publicationTarget,
    required this.citations,
    required this.startDate,
    required this.expectedCompletion,
    required this.featured,
  });

  factory ResearchProjectModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ResearchProjectModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      domain: json["domain"],
      status: json["status"],
      progress: (json["progress"] as num).toDouble(),
      publicationTarget: json["publicationTarget"],
      citations: json["citations"],
      startDate: DateTime.parse(json["startDate"]),
      expectedCompletion: DateTime.parse(
        json["expectedCompletion"],
      ),
      featured: json["featured"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "domain": domain,
      "status": status,
      "progress": progress,
      "publicationTarget": publicationTarget,
      "citations": citations,
      "startDate": startDate.toIso8601String(),
      "expectedCompletion":
      expectedCompletion.toIso8601String(),
      "featured": featured,
    };
  }

  ResearchProjectModel copyWith({
    String? id,
    String? title,
    String? description,
    String? domain,
    String? status,
    double? progress,
    String? publicationTarget,
    int? citations,
    DateTime? startDate,
    DateTime? expectedCompletion,
    bool? featured,
  }) {
    return ResearchProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      domain: domain ?? this.domain,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      publicationTarget:
      publicationTarget ?? this.publicationTarget,
      citations: citations ?? this.citations,
      startDate: startDate ?? this.startDate,
      expectedCompletion:
      expectedCompletion ??
          this.expectedCompletion,
      featured: featured ?? this.featured,
    );
  }
}