class BusinessCanvasModel {
  final String id;

  final String ventureId;

  final String valueProposition;

  final String customerSegment;

  final String revenueModel;

  final String keyPartners;

  final String channels;

  final String costStructure;

  final bool completed;

  const BusinessCanvasModel({
    required this.id,
    required this.ventureId,
    required this.valueProposition,
    required this.customerSegment,
    required this.revenueModel,
    required this.keyPartners,
    required this.channels,
    required this.costStructure,
    required this.completed,
  });

  factory BusinessCanvasModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return BusinessCanvasModel(
      id: json["id"],
      ventureId: json["ventureId"],
      valueProposition: json["valueProposition"],
      customerSegment: json["customerSegment"],
      revenueModel: json["revenueModel"],
      keyPartners: json["keyPartners"],
      channels: json["channels"],
      costStructure: json["costStructure"],
      completed: json["completed"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "ventureId": ventureId,
      "valueProposition": valueProposition,
      "customerSegment": customerSegment,
      "revenueModel": revenueModel,
      "keyPartners": keyPartners,
      "channels": channels,
      "costStructure": costStructure,
      "completed": completed,
    };
  }

  BusinessCanvasModel copyWith({
    String? id,
    String? ventureId,
    String? valueProposition,
    String? customerSegment,
    String? revenueModel,
    String? keyPartners,
    String? channels,
    String? costStructure,
    bool? completed,
  }) {
    return BusinessCanvasModel(
      id: id ?? this.id,
      ventureId: ventureId ?? this.ventureId,
      valueProposition:
      valueProposition ?? this.valueProposition,
      customerSegment:
      customerSegment ?? this.customerSegment,
      revenueModel:
      revenueModel ?? this.revenueModel,
      keyPartners:
      keyPartners ?? this.keyPartners,
      channels: channels ?? this.channels,
      costStructure:
      costStructure ?? this.costStructure,
      completed: completed ?? this.completed,
    );
  }
}