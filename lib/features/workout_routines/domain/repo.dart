import 'package:open_workout/features/workout_routines/domain/entitiy.dart';

abstract class WorkoutRoutineRepository {
  Future<WorkoutRoutineEntity> addWorkoutRoutine(WorkoutRoutineEntity routine);

  Future<WorkoutRoutineEntity?> getWorkoutRoutine(String id);

  Future<List<WorkoutRoutineEntity>> getAllWorkoutRoutines();

  Future<void> updateWorkoutRoutine(WorkoutRoutineUpdate routine);

  Future<void> deleteWorkoutRoutine(String id);
}

abstract class ExerciseRepository {
  Future<ExerciseEntity> addExercise(ExerciseEntity exercise);

  Future<ExerciseEntity?> getExercise(String id);

  Future<List<ExerciseEntity>> getExercisesForRoutine(String routineId);

  Future<List<ExerciseEntity>> getAllExercises();

  Future<void> updateExercise(ExerciseUpdate exercise);

  Future<void> deleteExercise(String id);
}
