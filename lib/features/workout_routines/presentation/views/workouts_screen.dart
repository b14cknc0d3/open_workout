import 'package:flutter/material.dart';
import 'package:open_workout/core/constants.dart';
import 'package:open_workout/features/workout_routines/domain/entitiy.dart';
import 'package:open_workout/features/workout_routines/presentation/views/workout_routine_detail_screen.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<WorkoutRoutineEntity> myWorkOuts = [
      WorkoutRoutineEntity(
        id: '1',
        name: "Day 1",
        focus: 'Push',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      WorkoutRoutineEntity(
        id: '2',
        name: "Day 2",
        focus: 'Pull',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      WorkoutRoutineEntity(
        id: '3',
        name: "Day 3",
        focus: 'Legs',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      WorkoutRoutineEntity(
        id: '4',
        name: "Day 4",
        focus: 'Core',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      WorkoutRoutineEntity(
        id: '5',
        name: "Day 5",
        focus: 'Legs',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      WorkoutRoutineEntity(
        id: '6',
        name: "Day 6",
        focus: 'Cardio',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Workouts",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          h16,
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (ctx, idx) => h16,
              itemCount: myWorkOuts.length,
              itemBuilder: (ctx, idx) {
                return WorkOutListTile(workout: myWorkOuts[idx]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WorkOutListTile extends StatelessWidget {
  final WorkoutRoutineEntity workout;
  const WorkOutListTile({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (ctx) => WorkoutRoutineDetailScreen(workoutRoutine: workout),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF5F5E5),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 48,
              width: 48,
              child: Icon(Icons.menu, color: Colors.black),
            ),
            w16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout.name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text(
                  workout.focus ?? '',
                  style: TextStyle(color: Color(0xff9E9E47), fontSize: 14),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
