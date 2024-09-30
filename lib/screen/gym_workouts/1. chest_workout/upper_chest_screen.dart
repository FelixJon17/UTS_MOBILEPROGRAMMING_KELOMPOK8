import 'package:flutter/material.dart';

class UpperChestScreen extends StatelessWidget {
  const UpperChestScreen({super.key});

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
            UpperChestTile(
              title: 'Incline Dumbell Press',
              description: '4 x 12 reps',
            ),
            UpperChestTile(
              title: 'Inclie Bench Press',
              description: '4 x 12 reps',
            ),
            UpperChestTile(
              title: 'Incline Dumbell Fly',
              description: '4 x 12 reps',
            ),
            UpperChestTile(
              title: 'Incline Cable Fly',
              description: '4 x 12 reps',
            ),
          ],
        ),
      ),
    );
  }
}

class UpperChestTile extends StatelessWidget {
  final String title;
  final String description;

  const UpperChestTile({
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
