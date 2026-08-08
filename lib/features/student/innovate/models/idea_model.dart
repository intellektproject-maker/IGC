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

  final int likes;

  final int comments;

  final bool shortlisted;

  const IdeaModel({
    required this.id,
    required this.title,
    required this.description,
    required this.domain,
    required this.status,
    required this.submittedDate,
    required this.likes,
    required this.comments,
    required this.shortlisted,
  });

  factory IdeaModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return IdeaModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      domain: json["domain"],
      status: json["status"],
      submittedDate: DateTime.parse(
        json["submittedDate"],
      ),
      likes: json["likes"],
      comments: json["comments"],
      shortlisted: json["shortlisted"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "domain": domain,
      "status": status,
      "submittedDate":
      submittedDate.toIso8601String(),
      "likes": likes,
      "comments": comments,
      "shortlisted": shortlisted,
    };
  }

  IdeaModel copyWith({
    String? id,
    String? title,
    String? description,
    String? domain,
    String? status,
    DateTime? submittedDate,
    int? likes,
    int? comments,
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
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      shortlisted:
      shortlisted ?? this.shortlisted,
    );
  }
}