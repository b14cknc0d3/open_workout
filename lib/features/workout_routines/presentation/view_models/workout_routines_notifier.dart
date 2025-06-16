import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_workout/core/providers.dart';
import 'package:open_workout/features/workout_routines/domain/entitiy.dart';
import 'package:open_workout/features/workout_routines/domain/repo.dart';
import 'package:uuid/uuid.dart';

final workoutRoutinesNotifierProvider =
    AsyncNotifierProvider<WorkoutRoutinesNotifier, List<WorkoutRoutineEntity>>(
      () {
        return WorkoutRoutinesNotifier();
      },
    );

class WorkoutRoutinesNotifier
    extends AsyncNotifier<List<WorkoutRoutineEntity>> {
  late final Uuid _uuid;

  late final WorkoutRoutineRepository _workoutRoutineRepository;
  @override
  FutureOr<List<WorkoutRoutineEntity>> build() {
    _uuid = const Uuid();
    _workoutRoutineRepository = ref.watch(workoutRoutineRepositoryProvider);
    return _fetchWorkoutRoutines();
  }

  Future<List<WorkoutRoutineEntity>> _fetchWorkoutRoutines() async {
    return _workoutRoutineRepository.getAllWorkoutRoutines();
  }

  Future<void> addWorkoutRoutine({
    required String name,
    String? description,
    String? focus,
  }) async {
    state = const AsyncValue.loading();

    try {
      final newRoutine = WorkoutRoutineEntity(
        id: _uuid.v4(),
        name: name,
        description: description,
        focus: focus,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await _workoutRoutineRepository.addWorkoutRoutine(newRoutine);

      state = AsyncValue.data(await _fetchWorkoutRoutines());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateWorkoutRoutine(WorkoutRoutineUpdate updatedRoutine) async {
    state = const AsyncValue.loading();

    try {
      await _workoutRoutineRepository.updateWorkoutRoutine(updatedRoutine);
      state = AsyncValue.data(await _fetchWorkoutRoutines());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteWorkoutRoutine(String id) async {
    state = const AsyncValue.loading();

    try {
      await _workoutRoutineRepository.deleteWorkoutRoutine(id);
      state = AsyncValue.data(await _fetchWorkoutRoutines());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshRoutines() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchWorkoutRoutines());
  }
}
