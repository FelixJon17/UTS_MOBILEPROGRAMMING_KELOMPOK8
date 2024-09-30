import 'package:flutter/material.dart';

class MiddleChestScreen extends StatelessWidget {
  const MiddleChestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chest Workouts'),
        backgroundColor: const Color.fromARGB(255, 116, 122, 133),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            MiddleChestTile(
              title: 'Flat Dumbell Press',
              description: '4 x 12 reps',
            ),
            MiddleChestTile(
              title: 'Flat Bench Press',
              description: '4 x 12 reps',
            ),
            MiddleChestTile(
              title: 'Machine Fly',
              description: '4 x 12 reps',
            ),
            MiddleChestTile(
              title: 'Flat Cable Fly',
              description: '4 x 12 reps',
            ),
          ],
        ),
      ),
    );
  }
}

class MiddleChestTile extends StatelessWidget {
  final String title;
  final String description;

  const MiddleChestTile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const Icon(Icons.fitness_center,
            size: 40, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
