class EventModel {
  final String id;

  final String title;

  final String description;

  final String venue;

  final DateTime eventDate;

  final String organizer;

  final String type;

  final bool registered;

  final String image;

  const EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.venue,
    required this.eventDate,
    required this.organizer,
    required this.type,
    required this.registered,
    required this.image,
  });

  factory EventModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return EventModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      venue: json["venue"],
      eventDate: DateTime.parse(
        json["eventDate"],
      ),
      organizer: json["organizer"],
      type: json["type"],
      registered: json["registered"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "venue": venue,
      "eventDate": eventDate.toIso8601String(),
      "organizer": organizer,
      "type": type,
      "registered": registered,
      "image": image,
    };
  }

  EventModel copyWith({
    String? id,
    String? title,
    String? description,
    String? venue,
    DateTime? eventDate,
    String? organizer,
    String? type,
    bool? registered,
    String? image,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      venue: venue ?? this.venue,
      eventDate: eventDate ?? this.eventDate,
      organizer: organizer ?? this.organizer,
      type: type ?? this.type,
      registered: registered ?? this.registered,
      image: image ?? this.image,
    );
  }
}