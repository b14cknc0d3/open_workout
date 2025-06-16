import 'package:flutter/material.dart';
import 'package:open_workout/core/theme.dart';
import 'package:open_workout/features/workout_routines/domain/entitiy.dart';
import 'package:open_workout/features/workout_routines/presentation/views/add_edit_exercise_screen.dart';

class WorkoutRoutineDetailScreen extends StatelessWidget {
  final WorkoutRoutineEntity workoutRoutine;
  const WorkoutRoutineDetailScreen({super.key, required this.workoutRoutine});

  @override
  Widget build(BuildContext context) {
    List<ExerciseEntity> myExercise = [
      ExerciseEntity(
        id: '1',
        routineId: '1',
        name: "Incline Dumbbell Press",
        sets: 3,
        reps: 8,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        images: [],
        videos: [],
        rpe: 7,
      ),
      ExerciseEntity(
        id: '2',
        routineId: '1',
        name: "Flat Barbell Bench Press",
        sets: 3,
        reps: 8,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        images: [],
        videos: [],
        rpe: 8,
      ),
      ExerciseEntity(
        id: '3',
        routineId: '1',
        name: "Dumbbell Shoulder Press",
        sets: 3,
        reps: 12,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        images: [],
        videos: [],
        rpe: 8,
      ),
      ExerciseEntity(
        id: '4',
        routineId: '1',
        name: "Lateral Raises",
        sets: 3,
        reps: 15,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        images: [],
        videos: [],
        rpe: 8,
      ),
      ExerciseEntity(
        id: '5',
        routineId: '1',
        name: "Overhead Triceps Extensions",
        sets: 2,
        reps: 12,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        images: [],
        videos: [],
        rpe: 7,
      ),
    ];
    return Scaffold(
      backgroundColor: Color(0xffFCFCF7),

      appBar: AppBar(
        title: Text('${workoutRoutine.name} - ${workoutRoutine.focus}'),
        backgroundColor: Color(0xffFCFCF7),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (ctx) => AddEditExerciseScreen()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: myExercise.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, idx) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme.lightBackground,
                ),
                child: Icon(
                  Icons.sports_gymnastics_outlined,
                  color: Colors.black,
                ),
              ),
              title: Text(
                myExercise[idx].name,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                '${myExercise[idx].sets} Sets | ${myExercise[idx].reps} Reps | RPE ${myExercise[idx].rpe}',
                style: TextStyle(color: Color(0xff9E9E47)),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_circle_fill_rounded),
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
