import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'OpenWorkout';

  static const String databaseFileName = 'openworkout_db.db';

  static const int databaseVersion = 1;

  static const double defaultPadding = 16.0;

  static const double cardElevation = 4.0;

  static const double borderRadius = 8.0;

  static const Duration animationDuration = Duration(milliseconds: 300);

  static const String imageStorageSubdirectory = 'workout_images';

  static const String pushFocus = 'push_focus';
  static const String pullFocus = 'pull_focus';
  static const String legsEnduranceFocus = 'legs_endurance_focus';
  static const String pushHypertrophyFocus = 'push_hypertrophy_focus';
  static const String pullHypertrophyFocus = 'pull_hypertrophy_focus';

  static const List<String> allFocusKeys = [
    pushFocus,
    pullFocus,
    legsEnduranceFocus,
    pushHypertrophyFocus,
    pullHypertrophyFocus,
  ];

  static const String categoryChest = 'chest';
  static const String categoryShoulders = 'shoulders';
  static const String categoryTriceps = 'triceps';
  static const String categoryBack = 'back';
  static const String categoryBiceps = 'biceps';
  static const String categoryRearDelts = 'rear_delts';
  static const String categoryQuadsGlutes = 'quads_glutes';
  static const String categoryHamstrings = 'hamstrings';
  static const String categoryCalves = 'calves';
  static const String categoryCore = 'core';
  static const String categoryCardio = 'cardio';

  static const List<String> allCategoryKeys = [
    categoryChest,
    categoryShoulders,
    categoryTriceps,
    categoryChest,
    categoryBiceps,
    categoryRearDelts,
    categoryQuadsGlutes,
    categoryHamstrings,
    categoryCalves,
    categoryCore,
    categoryCardio,
  ];

  static const int defaultRPE = 7;
}

const SizedBox h8 = SizedBox(height: 8.0);
const SizedBox w8 = SizedBox(width: 8.0);
const SizedBox h16 = SizedBox(height: 16.0);
const SizedBox w16 = SizedBox(width: 16.0);
const SizedBox h24 = SizedBox(height: 24.0);
const SizedBox w24 = SizedBox(width: 24.0);

class WorkoutRoutineColumn {
  static const String id = 'id';
  static const String name = 'name';
  static const String description = 'description';
  static const String focus = 'focus';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
}

class ExerciseColumn {
  static const String id = 'id';
  static const String routineId = 'routine_id';
  static const String name = 'name';
  static const String category = 'category';
  static const String sets = 'sets';
  static const String reps = 'reps';
  static const String rpe = 'rpe';
  static const String notes = 'notes';
}

enum TableName {
  workoutRoutines('workout_routines'),
  exercises('exercises');

  final String name;
  const TableName(this.name);
}
