class BuildEventModel {
  final String id;

  final String title;

  final String description;

  final String venue;

  final DateTime eventDate;

  final String organizer;

  final String type;

  final bool registered;

  final String image;

  /// Name of the registered team.
  final String teamName;

  /// Names of all team members.
  final List<String> teamMembers;

  const BuildEventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.venue,
    required this.eventDate,
    required this.organizer,
    required this.type,
    required this.registered,
    required this.image,
    required this.teamName,
    required this.teamMembers,
  });

  factory BuildEventModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return BuildEventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      venue: json['venue'] as String,
      eventDate: DateTime.parse(
        json['eventDate'] as String,
      ),
      organizer: json['organizer'] as String,
      type: json['type'] as String,
      registered: json['registered'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      teamName: json['teamName'] as String? ?? '',
      teamMembers:
      (json['teamMembers'] as List<dynamic>?)
          ?.map((member) => member.toString())
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'venue': venue,
      'eventDate': eventDate.toIso8601String(),
      'organizer': organizer,
      'type': type,
      'registered': registered,
      'image': image,
      'teamName': teamName,
      'teamMembers': teamMembers,
    };
  }

  BuildEventModel copyWith({
    String? id,
    String? title,
    String? description,
    String? venue,
    DateTime? eventDate,
    String? organizer,
    String? type,
    bool? registered,
    String? image,
    String? teamName,
    List<String>? teamMembers,
  }) {
    return BuildEventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      venue: venue ?? this.venue,
      eventDate: eventDate ?? this.eventDate,
      organizer: organizer ?? this.organizer,
      type: type ?? this.type,
      registered: registered ?? this.registered,
      image: image ?? this.image,
      teamName: teamName ?? this.teamName,
      teamMembers: teamMembers ?? this.teamMembers,
    );
  }
}