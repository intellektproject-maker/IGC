class PaperModel {
  final String id;

  final String title;

  final String abstract;

  final String journal;

  /// draft
  /// submitted
  /// under_review
  /// accepted
  /// published
  final String status;

  final String indexing;

  final DateTime submissionDate;

  final DateTime? publicationDate;

  final int citations;

  final bool featured;

  const PaperModel({
    required this.id,
    required this.title,
    required this.abstract,
    required this.journal,
    required this.status,
    required this.indexing,
    required this.submissionDate,
    this.publicationDate,
    required this.citations,
    required this.featured,
  });

  factory PaperModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return PaperModel(
      id: json["id"],
      title: json["title"],
      abstract: json["abstract"],
      journal: json["journal"],
      status: json["status"],
      indexing: json["indexing"],
      submissionDate: DateTime.parse(
        json["submissionDate"],
      ),
      publicationDate: json["publicationDate"] == null
          ? null
          : DateTime.parse(
        json["publicationDate"],
      ),
      citations: json["citations"],
      featured: json["featured"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "abstract": abstract,
      "journal": journal,
      "status": status,
      "indexing": indexing,
      "submissionDate":
      submissionDate.toIso8601String(),
      "publicationDate":
      publicationDate?.toIso8601String(),
      "citations": citations,
      "featured": featured,
    };
  }

  PaperModel copyWith({
    String? id,
    String? title,
    String? abstract,
    String? journal,
    String? status,
    String? indexing,
    DateTime? submissionDate,
    DateTime? publicationDate,
    int? citations,
    bool? featured,
  }) {
    return PaperModel(
      id: id ?? this.id,
      title: title ?? this.title,
      abstract: abstract ?? this.abstract,
      journal: journal ?? this.journal,
      status: status ?? this.status,
      indexing: indexing ?? this.indexing,
      submissionDate:
      submissionDate ?? this.submissionDate,
      publicationDate:
      publicationDate ?? this.publicationDate,
      citations: citations ?? this.citations,
      featured: featured ?? this.featured,
    );
  }
}