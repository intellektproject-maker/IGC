import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/business_canvas_model.dart';
import '../models/enterprise_event_model.dart';
import '../models/pitch_model.dart';
import '../models/venture_model.dart';
import '../repositories/enterprise_repository.dart';

/// =======================================================
/// Repository
/// =======================================================

final enterpriseRepositoryProvider =
Provider<EnterpriseRepository>(
      (ref) => const EnterpriseRepository(),
);

/// =======================================================
/// Featured Venture
/// =======================================================

final featuredVentureProvider =
FutureProvider<VentureModel?>((ref) async {
  return ref
      .read(enterpriseRepositoryProvider)
      .getFeaturedVenture();
});

/// =======================================================
/// Ventures
/// =======================================================

final venturesProvider =
FutureProvider<List<VentureModel>>((ref) async {
  return ref
      .read(enterpriseRepositoryProvider)
      .getVentures();
});

/// =======================================================
/// Business Canvas
/// =======================================================

final businessCanvasProvider =
FutureProvider<List<BusinessCanvasModel>>((ref) async {
  return ref
      .read(enterpriseRepositoryProvider)
      .getBusinessCanvas();
});

/// =======================================================
/// Investor Pitches
/// =======================================================

final pitchesProvider =
FutureProvider<List<PitchModel>>((ref) async {
  return ref
      .read(enterpriseRepositoryProvider)
      .getPitches();
});

/// =======================================================
/// Enterprise Events
/// =======================================================

final enterpriseEventsProvider =
FutureProvider<List<EnterpriseEventModel>>((ref) async {
  return ref
      .read(enterpriseRepositoryProvider)
      .getEvents();
});

/// =======================================================
/// Dashboard Statistics
/// =======================================================

final enterpriseStatisticsProvider =
FutureProvider<Map<String, dynamic>>((ref) async {
  return ref
      .read(enterpriseRepositoryProvider)
      .getStatistics();
});