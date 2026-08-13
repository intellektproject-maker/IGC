class ChallengeModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final String status;
  final int xp;
  final DateTime startDate;
  final DateTime endDate;
  final int participants;
  final String difficulty;
  final String image;
  final bool featured;
  final bool joined;

  const ChallengeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.xp,
    required this.startDate,
    required this.endDate,
    required this.participants,
    required this.difficulty,
    required this.image,
    required this.featured,
    required this.joined,
  });

  factory ChallengeModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ChallengeModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      status: json['status'] as String,
      xp: json['xp'] as int,
      startDate: DateTime.parse(
        json['startDate'] as String,
      ),
      endDate: DateTime.parse(
        json['endDate'] as String,
      ),
      participants: json['participants'] as int,
      difficulty: json['difficulty'] as String,
      image: json['image'] as String,
      featured: json['featured'] as bool,
      joined: json['joined'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'status': status,
      'xp': xp,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'participants': participants,
      'difficulty': difficulty,
      'image': image,
      'featured': featured,
      'joined': joined,
    };
  }

  ChallengeModel copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? status,
    int? xp,
    DateTime? startDate,
    DateTime? endDate,
    int? participants,
    String? difficulty,
    String? image,
    bool? featured,
    bool? joined,
  }) {
    return ChallengeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      status: status ?? this.status,
      xp: xp ?? this.xp,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      participants: participants ?? this.participants,
      difficulty: difficulty ?? this.difficulty,
      image: image ?? this.image,
      featured: featured ?? this.featured,
      joined: joined ?? this.joined,
    );
  }
}