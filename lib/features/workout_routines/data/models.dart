import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../domain/entitiy.dart';

class WorkoutRoutineModel {
  final String id;
  final String name;
  final String? description;
  final String? focus;
  final DateTime createdAt;
  final DateTime updatedAt;

  WorkoutRoutineModel({
    required this.id,
    required this.name,
    this.description,
    this.focus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorkoutRoutineModel.fromEntity(WorkoutRoutineEntity entity) {
    return WorkoutRoutineModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      focus: entity.focus,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory WorkoutRoutineModel.fromMap(Map<String, dynamic> map) {
    return WorkoutRoutineModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String?,
      focus: map['focus'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  WorkoutRoutineEntity toEntity() {
    return WorkoutRoutineEntity(
      id: id,
      name: name,
      description: description,
      focus: focus,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'focus': focus,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  WorkoutRoutineModel copyWith({
    String? id,
    String? name,
    String? description,
    String? focus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WorkoutRoutineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      focus: focus ?? this.focus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ExerciseModel {
  final String id;
  final String routineId;
  final String name;
  final String? category;
  final int sets;
  final int reps;
  final int? rpe;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> images;
  final List<String> videos;

  ExerciseModel({
    required this.id,
    required this.routineId,
    required this.name,
    this.category,
    required this.sets,
    required this.reps,
    this.rpe,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.videos,
  });

  factory ExerciseModel.fromEntity(ExerciseEntity entity) {
    return ExerciseModel(
      id: entity.id,
      routineId: entity.routineId,
      name: entity.name,
      category: entity.category,
      sets: entity.sets,
      reps: entity.reps,
      rpe: entity.rpe,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      images: entity.images,
      videos: entity.videos,
    );
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      id: map['id'] as String,
      routineId: map['routine_id'] as String,
      name: map['name'] as String,
      category: map['category'] as String?,
      sets: map['sets'] as int,
      reps: map['reps'] as int,
      rpe: map['rpe'] as int?,
      notes: map['notes'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      images:
          map['images'] != null
              ? List<String>.from(json.decode(map['images'] as String) as List)
              : [],
      videos:
          map['videos'] != null
              ? List<String>.from(json.decode(map['videos'] as String) as List)
              : [],
    );
  }

  ExerciseEntity toEntity() {
    return ExerciseEntity(
      id: id,
      routineId: routineId,
      name: name,
      category: category,
      sets: sets,
      reps: reps,
      rpe: rpe,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      images: images,
      videos: videos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'routine_id': routineId,
      'name': name,
      'category': category,
      'sets': sets,
      'reps': reps,
      'rpe': rpe,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'images': json.encode(images),
      'videos': json.encode(videos),
    };
  }

  ExerciseModel copyWith({
    String? id,
    String? routineId,
    String? name,
    String? category,
    int? sets,
    int? reps,
    int? rpe,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? images,
    List<String>? videos,
  }) {
    return ExerciseModel(
      id: id ?? this.id,
      routineId: routineId ?? this.routineId,
      name: name ?? this.name,
      category: category ?? this.category,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      rpe: rpe ?? this.rpe,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      images: images ?? this.images,
      videos: videos ?? this.videos,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExerciseModel &&
        other.id == id &&
        other.routineId == routineId &&
        other.name == name &&
        other.category == category &&
        other.sets == sets &&
        other.reps == reps &&
        other.rpe == rpe &&
        other.notes == notes &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        listEquals(other.images, images) &&
        listEquals(other.videos, videos);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        routineId.hashCode ^
        name.hashCode ^
        category.hashCode ^
        sets.hashCode ^
        reps.hashCode ^
        rpe.hashCode ^
        notes.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        Object.hashAll(images) ^
        Object.hashAll(videos);
  }
}
