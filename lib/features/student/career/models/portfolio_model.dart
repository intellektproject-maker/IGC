class PortfolioModel {
  final String id;

  final String title;

  final String category;

  final String platform;

  final String url;

  final String description;

  final int score;

  final bool verified;

  const PortfolioModel({
    required this.id,
    required this.title,
    required this.category,
    required this.platform,
    required this.url,
    required this.description,
    required this.score,
    required this.verified,
  });

  factory PortfolioModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return PortfolioModel(
      id: json["id"],
      title: json["title"],
      category: json["category"],
      platform: json["platform"],
      url: json["url"],
      description: json["description"],
      score: json["score"],
      verified: json["verified"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "platform": platform,
      "url": url,
      "description": description,
      "score": score,
      "verified": verified,
    };
  }

  PortfolioModel copyWith({
    String? id,
    String? title,
    String? category,
    String? platform,
    String? url,
    String? description,
    int? score,
    bool? verified,
  }) {
    return PortfolioModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      platform: platform ?? this.platform,
      url: url ?? this.url,
      description: description ?? this.description,
      score: score ?? this.score,
      verified: verified ?? this.verified,
    );
  }
}