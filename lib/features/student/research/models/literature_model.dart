class LiteratureModel {
  final String id;

  final String title;

  final String topic;

  final String source;

  final String authors;

  final int publicationYear;

  final String type;

  final bool completed;

  final bool bookmarked;

  const LiteratureModel({
    required this.id,
    required this.title,
    required this.topic,
    required this.source,
    required this.authors,
    required this.publicationYear,
    required this.type,
    required this.completed,
    required this.bookmarked,
  });

  factory LiteratureModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return LiteratureModel(
      id: json["id"],
      title: json["title"],
      topic: json["topic"],
      source: json["source"],
      authors: json["authors"],
      publicationYear: json["publicationYear"],
      type: json["type"],
      completed: json["completed"],
      bookmarked: json["bookmarked"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "topic": topic,
      "source": source,
      "authors": authors,
      "publicationYear": publicationYear,
      "type": type,
      "completed": completed,
      "bookmarked": bookmarked,
    };
  }

  LiteratureModel copyWith({
    String? id,
    String? title,
    String? topic,
    String? source,
    String? authors,
    int? publicationYear,
    String? type,
    bool? completed,
    bool? bookmarked,
  }) {
    return LiteratureModel(
      id: id ?? this.id,
      title: title ?? this.title,
      topic: topic ?? this.topic,
      source: source ?? this.source,
      authors: authors ?? this.authors,
      publicationYear:
      publicationYear ?? this.publicationYear,
      type: type ?? this.type,
      completed: completed ?? this.completed,
      bookmarked: bookmarked ?? this.bookmarked,
    );
  }
}