class StudentDashboardModel {
  final String id;
  final String name;
  final String level;
  final int xp;
  final int rank;
  final int score;
  final int projects;
  final int skillPoints;

  const StudentDashboardModel({
    required this.id,
    required this.name,
    required this.level,
    required this.xp,
    required this.rank,
    required this.score,
    required this.projects,
    required this.skillPoints,
  });

  factory StudentDashboardModel.fromJson(Map<String, dynamic> json) {
    return StudentDashboardModel(
      id: json['id'] as String,
      name: json['name'] as String,
      level: json['level'] as String,
      xp: json['xp'] as int,
      rank: json['rank'] as int,
      score: json['score'] as int,
      projects: json['projects'] as int,
      skillPoints: json['skillPoints'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'xp': xp,
      'rank': rank,
      'score': score,
      'projects': projects,
      'skillPoints': skillPoints,
    };
  }
}