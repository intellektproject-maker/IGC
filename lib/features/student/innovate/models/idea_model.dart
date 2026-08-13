class IdeaModel {
  final String id;
  final String title;
  final String description;
  final String domain;

  /// draft
  /// submitted
  /// under_review
  /// approved
  /// rejected
  final String status;

  final DateTime submittedDate;

  /// Innovation points awarded for this idea.
  final int points;

  final bool shortlisted;

  const IdeaModel({
    required this.id,
    required this.title,
    required this.description,
    required this.domain,
    required this.status,
    required this.submittedDate,
    required this.points,
    required this.shortlisted,
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
      points: json['points'] as int,
      shortlisted: json['shortlisted'] as bool,
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
  }) {
    return IdeaModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      domain: domain ?? this.domain,
      status: status ?? this.status,
      submittedDate:
      submittedDate ?? this.submittedDate,
      points: points ?? this.points,
      shortlisted:
      shortlisted ?? this.shortlisted,
    );
  }
}