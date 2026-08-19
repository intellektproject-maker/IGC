class IdeaModel {
  final String id;
  final String title;
  final String description;
  final String domain;

  final String status;

  final DateTime submittedDate;

  final int points;

  final bool shortlisted;

  /// True after the idea has been moved into Build.
  final bool movedToBuild;

  /// Challenge in which the idea was submitted.
  final String challengeId;

  /// Challenge title for displaying context.
  final String challengeTitle;

  const IdeaModel({
    required this.id,
    required this.title,
    required this.description,
    required this.domain,
    required this.status,
    required this.submittedDate,
    required this.points,
    required this.shortlisted,
    required this.movedToBuild,
    required this.challengeId,
    required this.challengeTitle,
  });

  factory IdeaModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return IdeaModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      domain: json['domain'] as String,
      status: json['status'] as String,
      submittedDate: DateTime.parse(
        json['submittedDate'] as String,
      ),
      points:
      (json['points'] as num).toInt(),
      shortlisted:
      json['shortlisted'] as bool,
      movedToBuild:
      json['movedToBuild'] as bool,
      challengeId:
      json['challengeId'] as String,
      challengeTitle:
      json['challengeTitle'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'domain': domain,
      'status': status,
      'submittedDate':
      submittedDate.toIso8601String(),
      'points': points,
      'shortlisted': shortlisted,
      'movedToBuild': movedToBuild,
      'challengeId': challengeId,
      'challengeTitle': challengeTitle,
    };
  }

  IdeaModel copyWith({
    String? id,
    String? title,
    String? description,
    String? domain,
    String? status,
    DateTime? submittedDate,
    int? points,
    bool? shortlisted,
    bool? movedToBuild,
    String? challengeId,
    String? challengeTitle,
  }) {
    return IdeaModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description:
      description ?? this.description,
      domain: domain ?? this.domain,
      status: status ?? this.status,
      submittedDate:
      submittedDate ?? this.submittedDate,
      points: points ?? this.points,
      shortlisted:
      shortlisted ?? this.shortlisted,
      movedToBuild:
      movedToBuild ?? this.movedToBuild,
      challengeId:
      challengeId ?? this.challengeId,
      challengeTitle:
      challengeTitle ?? this.challengeTitle,
    );
  }
}