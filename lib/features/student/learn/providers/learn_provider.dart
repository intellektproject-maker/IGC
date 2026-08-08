import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/training_model.dart';
import '../repositories/learn_repository.dart';

/// =======================================================
/// Repository Provider
/// =======================================================

final learnRepositoryProvider = Provider<LearnRepository>(
      (ref) => const LearnRepository(),
);

/// =======================================================
/// Continue Learning
/// =======================================================

final continueLearningProvider =
FutureProvider<TrainingModel?>((ref) async {
  return ref
      .read(learnRepositoryProvider)
      .getContinueLearning();
});

/// =======================================================
/// Mandatory Trainings
/// =======================================================

final mandatoryTrainingsProvider =
FutureProvider<List<TrainingModel>>((ref) async {
  return ref
      .read(learnRepositoryProvider)
      .getMandatoryTrainings();
});

/// =======================================================
/// Optional Trainings
/// =======================================================

final optionalTrainingsProvider =
FutureProvider<List<TrainingModel>>((ref) async {
  return ref
      .read(learnRepositoryProvider)
      .getOptionalTrainings();
});

/// =======================================================
/// Completed Trainings
/// =======================================================

final completedTrainingsProvider =
FutureProvider<List<TrainingModel>>((ref) async {
  return ref
      .read(learnRepositoryProvider)
      .getCompletedTrainings();
});

/// =======================================================
/// Dashboard Statistics
/// =======================================================

final learnStatisticsProvider =
FutureProvider<Map<String, dynamic>>((ref) async {
  return ref
      .read(learnRepositoryProvider)
      .getStatistics();
});