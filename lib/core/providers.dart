import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_workout/core/services/database_services.dart';
import 'package:open_workout/features/workout_routines/data/repo_impl.dart';
import 'package:open_workout/features/workout_routines/domain/repo.dart';

final databaseServiceProvider = Provider<DatabaseServices>((ref) {
  return DatabaseServices();
});
final workoutRoutineRepositoryProvider = Provider<WorkoutRoutineRepository>((
  ref,
) {
  final databaseService = ref.watch(databaseServiceProvider);
  return WorkoutRoutineRepositoryImpl(databaseService: databaseService);
});

final exerciseRepositoryProvider = Provider<ExerciseRepository>((ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return ExerciseRepositoryImpl(databaseService);
});
