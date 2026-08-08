class PitchModel {
  final String id;

  final String ventureId;

  final String title;

  final String investor;

  final double fundingRequested;

  final double fundingReceived;

  final int pitchScore;

  final String status;

  final String mentorFeedback;

  final DateTime pitchDate;

  const PitchModel({
    required this.id,
    required this.ventureId,
    required this.title,
    required this.investor,
    required this.fundingRequested,
    required this.fundingReceived,
    required this.pitchScore,
    required this.status,
    required this.mentorFeedback,
    required this.pitchDate,
  });

  factory PitchModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return PitchModel(
      id: json["id"],
      ventureId: json["ventureId"],
      title: json["title"],
      investor: json["investor"],
      fundingRequested:
      (json["fundingRequested"] as num).toDouble(),
      fundingReceived:
      (json["fundingReceived"] as num).toDouble(),
      pitchScore: json["pitchScore"],
      status: json["status"],
      mentorFeedback: json["mentorFeedback"],
      pitchDate: DateTime.parse(
        json["pitchDate"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "ventureId": ventureId,
      "title": title,
      "investor": investor,
      "fundingRequested": fundingRequested,
      "fundingReceived": fundingReceived,
      "pitchScore": pitchScore,
      "status": status,
      "mentorFeedback": mentorFeedback,
      "pitchDate": pitchDate.toIso8601String(),
    };
  }

  PitchModel copyWith({
    String? id,
    String? ventureId,
    String? title,
    String? investor,
    double? fundingRequested,
    double? fundingReceived,
    int? pitchScore,
    String? status,
    String? mentorFeedback,
    DateTime? pitchDate,
  }) {
    return PitchModel(
      id: id ?? this.id,
      ventureId: ventureId ?? this.ventureId,
      title: title ?? this.title,
      investor: investor ?? this.investor,
      fundingRequested:
      fundingRequested ?? this.fundingRequested,
      fundingReceived:
      fundingReceived ?? this.fundingReceived,
      pitchScore:
      pitchScore ?? this.pitchScore,
      status: status ?? this.status,
      mentorFeedback:
      mentorFeedback ?? this.mentorFeedback,
      pitchDate:
      pitchDate ?? this.pitchDate,
    );
  }
}