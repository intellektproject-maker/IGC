class TrainingModel {
  final String id;
  final String title;
  final String description;

  /// mandatory / optional
  final String type;

  /// pending / in_progress / completed
  final String status;

  final int xp;

  final double progress;

  final String duration;

  final String instructor;

  final String image;

  final bool certificateAvailable;

  final bool mandatory;

  const TrainingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    required this.xp,
    required this.progress,
    required this.duration,
    required this.instructor,
    required this.image,
    required this.certificateAvailable,
    required this.mandatory,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      type: json["type"],
      status: json["status"],
      xp: json["xp"],
      progress: (json["progress"] as num).toDouble(),
      duration: json["duration"],
      instructor: json["instructor"],
      image: json["image"],
      certificateAvailable: json["certificateAvailable"],
      mandatory: json["mandatory"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "type": type,
      "status": status,
      "xp": xp,
      "progress": progress,
      "duration": duration,
      "instructor": instructor,
      "image": image,
      "certificateAvailable": certificateAvailable,
      "mandatory": mandatory,
    };
  }

  TrainingModel copyWith({
    String? id,
    String? title,
    String? description,
    String? type,
    String? status,
    int? xp,
    double? progress,
    String? duration,
    String? instructor,
    String? image,
    bool? certificateAvailable,
    bool? mandatory,
  }) {
    return TrainingModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      status: status ?? this.status,
      xp: xp ?? this.xp,
      progress: progress ?? this.progress,
      duration: duration ?? this.duration,
      instructor: instructor ?? this.instructor,
      image: image ?? this.image,
      certificateAvailable:
      certificateAvailable ?? this.certificateAvailable,
      mandatory: mandatory ?? this.mandatory,
    );
  }
}