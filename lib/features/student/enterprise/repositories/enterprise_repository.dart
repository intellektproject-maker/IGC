import '../mock/enterprise_mock_data.dart';
import '../models/business_canvas_model.dart';
import '../models/enterprise_event_model.dart';
import '../models/pitch_model.dart';
import '../models/venture_model.dart';

class EnterpriseRepository {
  const EnterpriseRepository();

  //=========================================================
  // Featured Venture
  //=========================================================

  Future<VentureModel?> getFeaturedVenture() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    try {
      return EnterpriseMockData.ventures.firstWhere(
            (venture) => venture.featured,
      );
    } catch (_) {
      return null;
    }
  }

  //=========================================================
  // Ventures
  //=========================================================

  Future<List<VentureModel>> getVentures() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return EnterpriseMockData.ventures;
  }

  //=========================================================
  // Business Canvas
  //=========================================================

  Future<List<BusinessCanvasModel>> getBusinessCanvas() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return EnterpriseMockData.canvas;
  }

  //=========================================================
  // Investor Pitches
  //=========================================================

  Future<List<PitchModel>> getPitches() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return EnterpriseMockData.pitches;
  }

  //=========================================================
  // Enterprise Events
  //=========================================================

  Future<List<EnterpriseEventModel>> getEvents() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return EnterpriseMockData.events;
  }

  //=========================================================
  // Dashboard Statistics
  //=========================================================

  Future<Map<String, dynamic>> getStatistics() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final ventures = EnterpriseMockData.ventures;
    final canvas = EnterpriseMockData.canvas;
    final pitches = EnterpriseMockData.pitches;

    final incubatedVentures = ventures
        .where((venture) => venture.incubated)
        .length;

    final completedCanvas = canvas
        .where((item) => item.completed)
        .length;

    final averagePitchScore = pitches.isEmpty
        ? 0
        : (pitches
        .map((pitch) => pitch.pitchScore)
        .reduce((a, b) => a + b) /
        pitches.length)
        .round();

    final startupScore = ventures.isEmpty
        ? 0
        : (ventures
        .map((venture) => venture.startupScore)
        .reduce((a, b) => a + b) /
        ventures.length)
        .round();

    return {
      "ventures": ventures.length,
      "canvas": completedCanvas,
      "pitchScore": averagePitchScore,
      "startupScore": startupScore,
      "incubated": incubatedVentures,
    };
  }
}