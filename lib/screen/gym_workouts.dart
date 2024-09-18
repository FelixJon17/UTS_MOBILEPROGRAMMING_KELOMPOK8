import 'package:flutter/material.dart';

class GymWorkoutsScreen extends StatefulWidget {
  const GymWorkoutsScreen({super.key});

  @override
  GymWorkoutsScreenState createState() => GymWorkoutsScreenState();
}

class GymWorkoutsScreenState extends State<GymWorkoutsScreen> {
  void _onWorkoutSelected(String workoutType) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$workoutType workout selected!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GYM Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => _onWorkoutSelected('Chest'),
              child: const Text('Workout Chest'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onWorkoutSelected('Back'),
              child: const Text('Workout Back'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onWorkoutSelected('Arms'),
              child: const Text('Workout Arms'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onWorkoutSelected('Legs'),
              child: const Text('Workout Legs'),
            ),
          ],
        ),
      ),
    );
  }
}
