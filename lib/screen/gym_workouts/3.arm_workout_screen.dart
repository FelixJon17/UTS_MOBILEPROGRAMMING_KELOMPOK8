import '3.arm_workout/shoulder_workkout_screen.dart';
import '3.arm_workout/biceps_workout.dart';
import '3.arm_workout/triceps_workout.dart';
import '3.arm_workout/forearms_workout.dart';
import 'package:flutter/material.dart';

class ArmWorkoutsScreen extends StatelessWidget {
  const ArmWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arm Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Biceps',
              description:
                  'Targets long heads, short heads, and brachialis biceps',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BicepsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Triceps',
              description: 'Targets long heads, lateral, and medial triceps',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TricepsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Forearms',
              description: 'Targets flexors, extensors, and brachialis muscle',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForearmsScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              icon: Icons.fitness_center,
              title: 'Shoulder',
              description: 'Targets the front, lateral, and rear delts',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoulderWorkoutsScreen(),
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
