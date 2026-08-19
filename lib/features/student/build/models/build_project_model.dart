class BuildProjectModel {
  final String id;

  /// Idea from which this project was created.
  final String ideaId;

  /// Challenge under which the idea was submitted.
  final String challengeId;

  /// Challenge title for displaying project context.
  final String challengeTitle;

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
    required this.ideaId,
    required this.challengeId,
    required this.challengeTitle,
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
      id: json['id'] as String,
      ideaId: json['ideaId'] as String,
      challengeId: json['challengeId'] as String,
      challengeTitle:
      json['challengeTitle'] as String,
      title: json['title'] as String,
      description:
      json['description'] as String,
      technology:
      json['technology'] as String,
      status: json['status'] as String,
      completion:
      (json['completion'] as num).toInt(),
      githubUrl:
      json['githubUrl'] as String,
      featured:
      json['featured'] as bool,
      createdAt: DateTime.parse(
        json['createdAt'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ideaId': ideaId,
      'challengeId': challengeId,
      'challengeTitle': challengeTitle,
      'title': title,
      'description': description,
      'technology': technology,
      'status': status,
      'completion': completion,
      'githubUrl': githubUrl,
      'featured': featured,
      'createdAt':
      createdAt.toIso8601String(),
    };
  }

  BuildProjectModel copyWith({
    String? id,
    String? ideaId,
    String? challengeId,
    String? challengeTitle,
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
      ideaId: ideaId ?? this.ideaId,
      challengeId:
      challengeId ?? this.challengeId,
      challengeTitle:
      challengeTitle ?? this.challengeTitle,
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