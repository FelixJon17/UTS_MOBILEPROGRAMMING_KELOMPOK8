import '/screen/gym_workouts/2.back_workout/upper_back_screen.dart';
import '/screen/gym_workouts/2.back_workout/middle_back_screen.dart';
import '/screen/gym_workouts/2.back_workout/lower_back_screen.dart';
import 'package:flutter/material.dart';

class BackWorkoutsScreen extends StatelessWidget {
  const BackWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Upper Back',
              description: 'Targets the upper Back',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpperBackScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Middle Back',
              description: 'Targets the middle Back',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MiddleBackScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Lower Back',
              description: 'Targets the lower Back',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LowerBackScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeFeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const HomeFeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}
