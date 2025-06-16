import 'dart:convert';

import 'package:open_workout/core/constants.dart';
import 'package:open_workout/core/services/database_services.dart';
import 'package:open_workout/features/workout_routines/data/models.dart';
import 'package:open_workout/features/workout_routines/domain/entitiy.dart';
import 'package:open_workout/features/workout_routines/domain/repo.dart';

class WorkoutRoutineRepositoryImpl implements WorkoutRoutineRepository {
  final DatabaseServices _databaseService;

  WorkoutRoutineRepositoryImpl({required DatabaseServices databaseService})
    : _databaseService = databaseService;

  @override
  Future<WorkoutRoutineEntity> addWorkoutRoutine(
    WorkoutRoutineEntity routine,
  ) async {
    final db = await _databaseService.database;
    final model = WorkoutRoutineModel.fromEntity(routine);
    await db.insert(TableName.workoutRoutines.name, model.toMap());
    return model.toEntity();
  }

  @override
  Future<void> deleteWorkoutRoutine(String id) async {
    final db = await _databaseService.database;
    await db.delete(
      TableName.workoutRoutines.name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<WorkoutRoutineEntity>> getAllWorkoutRoutines() async {
    final db = await _databaseService.database;
    final result = await db.query(TableName.workoutRoutines.name);
    return result
        .map((e) => WorkoutRoutineModel.fromMap(e).toEntity())
        .toList();
  }

  @override
  Future<WorkoutRoutineEntity?> getWorkoutRoutine(String id) async {
    final db = await _databaseService.database;
    final result = await db.query(
      TableName.workoutRoutines.name,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty
        ? WorkoutRoutineModel.fromMap(result.first).toEntity()
        : null;
  }

  @override
  Future<void> updateWorkoutRoutine(WorkoutRoutineUpdate routine) async {
    final db = await _databaseService.database;
    if (routine.name == null &&
        routine.description == null &&
        routine.focus == null) {
      return;
    }
    await db.update(
      TableName.workoutRoutines.name,
      {
        if (routine.name != null) 'name': routine.name,
        if (routine.description != null) 'description': routine.description,
        if (routine.focus != null) 'focus': routine.focus,
      },
      where: 'id = ?',
      whereArgs: [routine.id],
    );
  }
}

class ExerciseRepositoryImpl implements ExerciseRepository {
  final DatabaseServices _databaseService;

  ExerciseRepositoryImpl(this._databaseService);

  @override
  Future<ExerciseEntity> addExercise(ExerciseEntity exercise) async {
    final db = await _databaseService.database;
    final model = ExerciseModel.fromEntity(exercise);
    await db.insert(TableName.exercises.name, model.toMap());
    return model.toEntity();
  }

  @override
  Future<void> deleteExercise(String id) async {
    final db = await _databaseService.database;
    await db.delete(TableName.exercises.name, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<ExerciseEntity>> getAllExercises() async {
    final db = await _databaseService.database;
    final result = await db.query(TableName.exercises.name);
    return result.map((e) => ExerciseModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<ExerciseEntity?> getExercise(String id) async {
    final db = await _databaseService.database;
    final result = await db.query(
      TableName.exercises.name,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty
        ? ExerciseModel.fromMap(result.first).toEntity()
        : null;
  }

  @override
  Future<List<ExerciseEntity>> getExercisesForRoutine(String routineId) async {
    final db = await _databaseService.database;
    final result = await db.query(
      TableName.exercises.name,
      where: '${ExerciseColumn.routineId} = ?',
      whereArgs: [routineId],
    );
    return result.map((e) => ExerciseModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<void> updateExercise(ExerciseUpdate exercise) async {
    final db = await _databaseService.database;
    if (exercise.name == null &&
        exercise.category == null &&
        exercise.sets == null &&
        exercise.reps == null &&
        exercise.rpe == null &&
        exercise.notes == null &&
        exercise.images == null &&
        exercise.videos == null) {
      return;
    }
    await db.update(
      TableName.exercises.name,
      {
        if (exercise.name != null) 'name': exercise.name,
        if (exercise.category != null) 'category': exercise.category,
        if (exercise.sets != null) 'sets': exercise.sets,
        if (exercise.reps != null) 'reps': exercise.reps,
        if (exercise.rpe != null) 'rpe': exercise.rpe,
        if (exercise.notes != null) 'notes': exercise.notes,
        if (exercise.images != null) 'images': jsonEncode(exercise.images),
        if (exercise.videos != null) 'videos': jsonEncode(exercise.videos),
      },
      where: 'id = ?',
      whereArgs: [exercise.id],
    );
  }
}
