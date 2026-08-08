class MilestoneModel {
  final String id;

  final String title;

  final String description;

  final bool completed;

  final DateTime dueDate;

  final int xp;

  const MilestoneModel({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.dueDate,
    required this.xp,
  });

  factory MilestoneModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return MilestoneModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      completed: json["completed"],
      dueDate: DateTime.parse(
        json["dueDate"],
      ),
      xp: json["xp"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "completed": completed,
      "dueDate": dueDate.toIso8601String(),
      "xp": xp,
    };
  }

  MilestoneModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
    DateTime? dueDate,
    int? xp,
  }) {
    return MilestoneModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      dueDate: dueDate ?? this.dueDate,
      xp: xp ?? this.xp,
    );
  }
}