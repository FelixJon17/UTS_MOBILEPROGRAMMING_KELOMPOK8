import 'package:flutter/material.dart';

class MiddleBackScreen extends StatelessWidget {
  const MiddleBackScreen({super.key});

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
          children: const [  MiddleBackTile(
              title: 'Barbell Bent Over Row',
              description: '4 x 12 reps',
            ), MiddleBackTile(
              title: 'Chest Supported Row',
              description: '4 x 8 reps',
            ), MiddleBackTile(
              title: 'Seated Cable Row',
              description: '3 x 12 reps',
            ), MiddleBackTile(
              title: 'Bodyweight Rows',
              description: '4 x 12 reps',
            ),],
        ),
      ),
    );
  }
}

class MiddleBackTile extends StatelessWidget {
  final String title;
  final String description;

  const MiddleBackTile({
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
