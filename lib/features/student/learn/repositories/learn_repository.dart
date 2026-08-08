import '../mock/learn_mock_data.dart';
import '../models/training_model.dart';

class LearnRepository {
  const LearnRepository();

  //=========================================
  // All Trainings
  //=========================================

  Future<List<TrainingModel>> getAllTrainings() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return LearnMockData.trainings;
  }

  //=========================================
  // Mandatory Trainings
  //=========================================

  Future<List<TrainingModel>> getMandatoryTrainings() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return LearnMockData.trainings
        .where((training) => training.mandatory)
        .toList();
  }

  //=========================================
  // Optional Trainings
  //=========================================

  Future<List<TrainingModel>> getOptionalTrainings() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return LearnMockData.trainings
        .where((training) => !training.mandatory)
        .toList();
  }

  //=========================================
  // Continue Learning
  //=========================================

  Future<TrainingModel?> getContinueLearning() async {
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      return LearnMockData.trainings.firstWhere(
            (training) => training.status == "in_progress",
      );
    } catch (_) {
      return null;
    }
  }

  //=========================================
  // Completed Trainings
  //=========================================

  Future<List<TrainingModel>> getCompletedTrainings() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return LearnMockData.trainings
        .where((training) => training.status == "completed")
        .toList();
  }

  //=========================================
  // Dashboard Statistics
  //=========================================

  Future<Map<String, dynamic>> getStatistics() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final trainings = LearnMockData.trainings;

    final completed = trainings
        .where((e) => e.status == "completed")
        .length;

    final pending = trainings
        .where((e) => e.status != "completed")
        .length;

    final xp = trainings
        .where((e) => e.status == "completed")
        .fold<int>(
      0,
          (sum, item) => sum + item.xp,
    );

    final certificates = trainings
        .where(
          (e) =>
      e.status == "completed" &&
          e.certificateAvailable,
    )
        .length;

    return {
      "completed": completed,
      "pending": pending,
      "xp": xp,
      "certificates": certificates,
    };
  }
}