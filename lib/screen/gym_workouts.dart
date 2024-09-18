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
        backgroundColor: const Color.fromARGB(255, 116, 122, 133),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => _onWorkoutSelected('Chest'),
              child: const Text('Chest Workouts'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onWorkoutSelected('Back'),
              child: const Text('Back Workouts'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onWorkoutSelected('Arms'),
              child: const Text('Arm Workouts'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onWorkoutSelected('Legs'),
              child: const Text('Leg Workouts'),
            ),
          ],
        ),
      ),
    );
  }
}
