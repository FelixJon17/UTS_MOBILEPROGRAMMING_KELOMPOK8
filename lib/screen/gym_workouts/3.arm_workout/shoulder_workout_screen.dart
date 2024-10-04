import 'package:fitnessapp/screen/gym_workouts/3.arm_workout/front_delts_workout.dart';
import 'package:fitnessapp/screen/gym_workouts/3.arm_workout/lateral_delts_workout.dart';
import 'package:fitnessapp/screen/gym_workouts/3.arm_workout/rear_delts_workout.dart';
import 'package:flutter/material.dart';

class ShoulderWorkoutsScreen extends StatelessWidget {
  const ShoulderWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoulder Workouts'),
        backgroundColor: const Color.fromARGB(255, 116, 122, 133),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Front Delts',
              description: 'Targets the upper shoulder',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FrontShoulderScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Lateral Delts',
              description: 'Targets the middle shoulder',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LateralShoulderScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Rear Delts',
              description: 'Targets the rear delts',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RearShoulderScreen(),
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
