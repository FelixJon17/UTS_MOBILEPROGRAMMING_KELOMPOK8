import 'package:flutter/material.dart';
import '2.gym_workouts.dart';
import '5.cardio_workout_screen.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WorkoutOptionCard(
                imagePath: 'assets/img/bg/gympic.jpg',
                title: 'GYM Workouts',
                description:
                    'Explore various gym exercises for different muscle groups.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GymWorkoutsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              WorkoutOptionCard(
                imagePath: 'assets/img/bg/gympic.jpg',
                title: 'Cardio Exercise',
                description:
                    'Find exercises like running, cycling, and jogging.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardioExerciseScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutOptionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;

  const WorkoutOptionCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
