import 'package:flutter/material.dart';
import 'cardio_workouts/cycling.dart';
import 'cardio_workouts/jogging.dart';
import 'cardio_workouts/running.dart';

class CardioExerciseScreen extends StatelessWidget {
  const CardioExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardio Exercise'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: const [
          RunningWidget(),
          Divider(),
          CyclingWidget(),
          Divider(),
          JoggingWidget(),
        ],
      ),
    );
  }
}
