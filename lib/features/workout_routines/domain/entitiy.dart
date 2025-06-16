class WorkoutRoutineEntity {
  final String id;
  final String name;
  final String? description;
  final String? focus;
  final DateTime createdAt;
  final DateTime updatedAt;

  const WorkoutRoutineEntity({
    required this.id,
    required this.name,
    this.description,
    this.focus,
    required this.createdAt,
    required this.updatedAt,
  });

  WorkoutRoutineEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? focus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WorkoutRoutineEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      focus: focus ?? this.focus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkoutRoutineEntity &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.focus == focus &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        focus.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}

class ExerciseEntity {
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

  const ExerciseEntity({
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

  ExerciseEntity copyWith({
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
    return ExerciseEntity(
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

    return other is ExerciseEntity &&
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
        other.images == images &&
        other.videos == videos;
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
        images.hashCode ^
        videos.hashCode;
  }
}

class WorkoutRoutineUpdate {
  final String id;
  final String? name;
  final String? description;
  final String? focus;

  WorkoutRoutineUpdate(this.id, this.name, this.description, this.focus);
}

class ExerciseUpdate {
  final String id;
  final String? routineId;
  final String? name;
  final String? category;
  final int? sets;
  final int? reps;
  final int? rpe;
  final String? notes;
  final List<String>? images;
  final List<String>? videos;

  ExerciseUpdate(
    this.id,
    this.routineId,
    this.name,
    this.category,
    this.sets,
    this.reps,
    this.rpe,
    this.notes,
    this.images,
    this.videos,
  );
}
