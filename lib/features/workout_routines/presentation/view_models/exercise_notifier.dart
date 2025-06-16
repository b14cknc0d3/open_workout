import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_workout/core/providers.dart';
import 'package:open_workout/features/workout_routines/domain/entitiy.dart';
import 'package:open_workout/features/workout_routines/domain/repo.dart';
import 'package:uuid/uuid.dart';

final exercisesNotifierProvider = AsyncNotifierProvider.family<
  ExercisesNotifier,
  List<ExerciseEntity>,
  String
>(ExercisesNotifier.new);

class ExercisesNotifier
    extends FamilyAsyncNotifier<List<ExerciseEntity>, String> {
  ExercisesNotifier();
  late final Uuid _uuid;

  // Lazily initialized repository instance
  late final ExerciseRepository _exerciseRepository;

  @override
  FutureOr<List<ExerciseEntity>> build(String routineId) async {
    _uuid = const Uuid();

    _exerciseRepository = ref.watch(exerciseRepositoryProvider);
    return _fetchExercisesForRoutine();
  }

  Future<List<ExerciseEntity>> _fetchExercisesForRoutine() async {
    return _exerciseRepository.getExercisesForRoutine(arg);
  }

  Future<void> addExercise(ExerciseEntity exercise) async {
    try {
      final newExercise = exercise.copyWith(id: _uuid.v4());
      await _exerciseRepository.addExercise(newExercise);
      state = AsyncValue.data(await _fetchExercisesForRoutine());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateExercise(ExerciseUpdate exercise) async {
    try {
      await _exerciseRepository.updateExercise(exercise);
      state = AsyncValue.data(await _fetchExercisesForRoutine());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteExercise(String id) async {
    try {
      await _exerciseRepository.deleteExercise(id);
      state = AsyncValue.data(await _fetchExercisesForRoutine());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshExercises() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchExercisesForRoutine());
  }
}
