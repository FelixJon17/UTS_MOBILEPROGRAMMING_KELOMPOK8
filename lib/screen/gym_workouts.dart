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
            GestureDetector(
              onTap: () => _onWorkoutSelected('Chest'),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 94, 115, 92),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Chest Workouts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => _onWorkoutSelected('Back'),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 104, 108, 150),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Back Workouts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => _onWorkoutSelected('Arms'),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 67, 108, 109),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Arm Workouts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => _onWorkoutSelected('Legs'),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 114, 94, 65),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Leg Workouts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
