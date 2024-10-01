import '1.chest_workout/upper_chest_screen.dart';
import '1.chest_workout/middle_chest_screen.dart';
import '1.chest_workout/lower_chest_screen.dart';
import 'package:flutter/material.dart';

class ChestWorkoutsScreen extends StatelessWidget {
  const ChestWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chest Workouts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HomeFeatureTile(
              title: 'Upper Chest',
              description: 'Targets the upper chest',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpperChestScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              title: 'Middle Chest',
              description: 'Targets the middle chest',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MiddleChestScreen(),
                  ),
                );
              },
            ),
            HomeFeatureTile(
              title: 'Lower Chest',
              description: 'Targets the lower chest',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LowerChestScreen(),
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
  final String title;
  final String description;
  final VoidCallback onTap;

  const HomeFeatureTile({
    super.key,
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
